package com.wismay.apqt.web.proxy;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.validation.Valid;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.wismay.apqt.comm.AuditStatus;
import com.wismay.apqt.comm.DeletedFlag;
import com.wismay.apqt.comm.ProxyFlag;
import com.wismay.apqt.entity.Company;
import com.wismay.apqt.service.ProxyService;
import com.wismay.apqt.service.account.ShiroDbRealm.ShiroUser;

/**
 * 代理管理：新建、审核
 * 
 * @author Peter
 */
@Controller
@RequestMapping(value = "/proxy")
public class ProxyController {

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		SimpleDateFormat dateFormat2 = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat2, true));
	}

	@Autowired
	private ProxyService proxyService;

	// 列表
	@RequestMapping(method = RequestMethod.GET)
	public String list(Model model) {
		model.addAttribute("list", proxyService.listForAuditPass());
		return "proxy/proxyList";
	}

	@RequestMapping(value = "selectSection", method = RequestMethod.GET)
	public String selectSection(Model model, @RequestParam("control") String control) {
		Company p = new Company();
		List<Long> status = new ArrayList<Long>();
		status.add(1L);// 审核通过
		p.setAuditStatusList(status);
		model.addAttribute("list", proxyService.search(p));
		model.addAttribute("control", decode(control));

		return "account/proxySelectSection";
	}

	// 详情
	@RequestMapping(value = "detail/{id}", method = RequestMethod.GET)
	public String detail(@PathVariable("id") Long id, Model model) {
		model.addAttribute("proxy", proxyService.getById(id));
		return "proxy/proxyDetail";
	}

	// 详情 （审核列表页面查看详情）
	@RequestMapping(value = "detail-audit/{id}", method = RequestMethod.GET)
	public String detailAudit(@PathVariable("id") Long id, Model model) {
		model.addAttribute("proxy", proxyService.getById(id));
		return "proxy/proxyDetail-audit";
	}

	// 诚信信用码
	@RequestMapping(value = "certcode/{id}", method = RequestMethod.GET)
	public String certcodeFrom(@PathVariable("id") Long id, Model model) {
		model.addAttribute("proxy", proxyService.getById(id));
		return "proxy/certcodeSection";
	}

	// 诚信信用码 save
	@RequestMapping(value = "certcode/save")
	public String saveCertcode(@ModelAttribute("proxy") Company proxy, RedirectAttributes redirectAttributes) {
		proxyService.update(proxy);
		redirectAttributes.addFlashAttribute("message", "诚信信用码设置成功");
		return "redirect:/proxy";
	}

	// 新增
	@RequestMapping(value = "create", method = RequestMethod.GET)
	public String createForm(Model model) {
		model.addAttribute("action", "create");
		return "proxy/proxyForm";
	}

	@RequestMapping(value = "create", method = RequestMethod.POST)
	public String saveForm(@Valid @ModelAttribute("proxy") Company proxy, Model model) {
		proxy.setCreateUser(getCurrentUser().id);
		proxy.setCreateDate(new Date());
		proxy.setAuditStatus(0L);
		proxy.setAuthCode("123456");
		proxy.setIsProxy(ProxyFlag.YES);
		proxy.setProxy(getCurrentUser().getProxy() == null ? 0L : getCurrentUser().getProxy());
		proxy.setDeleted(DeletedFlag.USED);

		proxyService.save(proxy);

		model.addAttribute("proxy", proxy);
		return "proxy/proxyCreateEnd";
	}

	// 更新
	@RequestMapping(value = "update/{id}", method = RequestMethod.GET)
	public String updateForm(@PathVariable("id") Long id, Model model) {
		model.addAttribute("action", "update");
		model.addAttribute("proxy", proxyService.getById(id));
		return "proxy/proxyForm";
	}

	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String updateSave(@Valid @ModelAttribute("proxy") Company proxy, RedirectAttributes redirectAttributes) {
		proxyService.update(proxy);
		redirectAttributes.addFlashAttribute("message", "操作成功");
		return "redirect:/proxy/audit/list";
	}

	// 审核列表
	@RequestMapping(value = "audit/list", method = RequestMethod.GET)
	public String auditList(Model model) {
		Company proxy = new Company();
		List<Long> status = new ArrayList<Long>();
		status.add(AuditStatus.NONE);// 未审核
		status.add(AuditStatus.NOT_PASS);// 审核不通过
		proxy.setAuditStatusList(status);
		model.addAttribute("list", proxyService.search(proxy));
		return "proxy/proxyAuditList";
	}

	// 审核
	@RequestMapping(value = "audit/{id}", method = RequestMethod.GET)
	public String auditForm(@PathVariable("id") Long id, Model model) {
		model.addAttribute("proxy", proxyService.getById(id));
		return "proxy/proxyAudit";
	}

	// 审核 save
	@RequestMapping(value = "audit/save", method = RequestMethod.POST)
	public String auditForm(@Valid @ModelAttribute("proxy") Company proxy, Model model) {
		// 前端使用checkbox，选择为通过=1，否则是null，如果是null，说明是审核不通过。
		if (proxy.getAuditStatus() == null) {
			proxy.setAuditStatus(AuditStatus.NOT_PASS);// 审核不通过
		}
		proxy.setProxy(proxy.getId());// 代理也是一个公司，其代理是自己。
		proxyService.update(proxy);
		model.addAttribute("proxy", proxyService.getById(proxy.getId()));
		return "proxy/proxyAudit";
	}

	// 删除
	@RequestMapping(value = "delete/{id}")
	public String delete(@PathVariable("id") Long id, RedirectAttributes redirectAttributes) {
		proxyService.delete(id);
		redirectAttributes.addFlashAttribute("message", "删除成功");
		return "redirect:/proxy/audit/list";
	}

	public ShiroUser getCurrentUser() {
		ShiroUser user = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
		return user;
	}

	public String decode(String str) {
		try {
			System.out.println("str:" + str);
			String newstr = new String(str.getBytes("ISO-8859-1"), "UTF-8");
			System.out.println("newstr:" + newstr);
			// newstr = URLDecoder.decode(str, "UTF-8");
			// System.out.println("decoder newstr:" + newstr);
			return newstr;
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return "";
	}

}
