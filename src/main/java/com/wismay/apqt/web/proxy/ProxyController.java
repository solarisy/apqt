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

import com.wismay.apqt.entity.Proxy;
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

	@RequestMapping(method = RequestMethod.GET)
	public String list(Model model) {
		Proxy p = new Proxy();
		List<Long> status = new ArrayList<Long>();
		status.add(1L);
		status.add(2L);
		p.setAuditStatusList(status);
		model.addAttribute("list", proxyService.search(p));
		return "proxy/proxyList";
	}

	@RequestMapping(value = "selectSection", method = RequestMethod.GET)
	public String selectSection(Model model, @RequestParam("control") String control) {
		Proxy p = new Proxy();
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

	// 诚信码
	@RequestMapping(value = "certcode/{id}", method = RequestMethod.GET)
	public String certcodeFrom(@PathVariable("id") Long id, Model model) {
		model.addAttribute("proxy", proxyService.getById(id));
		return "proxy/certcodeSection";
	}

	// 诚信码 save
	@RequestMapping(value = "certcode/save")
	public String saveCertcode(@ModelAttribute("proxy") Proxy proxy, RedirectAttributes redirectAttributes) {
		proxyService.update(proxy);
		redirectAttributes.addFlashAttribute("message", "诚信码设置成功");
		return "redirect:/proxy";
	}

	// 新增
	@RequestMapping(value = "create", method = RequestMethod.GET)
	public String createForm(Model model) {
		model.addAttribute("action", "create");
		return "proxy/proxyForm";
	}

	@RequestMapping(value = "create", method = RequestMethod.POST)
	public String saveForm(@Valid @ModelAttribute("proxy") Proxy proxy, Model model) {
		proxy.setCreateUser(getCurrentUser().id);
		proxy.setCreateDate(new Date());
		proxy.setAuditStatus(0L);
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
	public String updateSave(@Valid @ModelAttribute("proxy") Proxy proxy, RedirectAttributes redirectAttributes) {
		proxyService.update(proxy);
		redirectAttributes.addFlashAttribute("message", "操作成功");
		return "redirect:/proxy";
	}

	// 审核列表
	@RequestMapping(value = "audit/list", method = RequestMethod.GET)
	public String auditList(Model model) {
		Proxy proxy = new Proxy();
		List<Long> status = new ArrayList<Long>();
		status.add(0L);// 未审核
		status.add(2L);// 审核不通过
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
	public String auditForm(@Valid @ModelAttribute("proxy") Proxy proxy, Model model) {
		Proxy oldProxy = proxyService.getById(proxy.getId());
		// 前端使用checkbox，选择为通过=1，否则是null，如果是null，说明是审核不通过。
		if (proxy.getAuditStatus() == null) {
			proxy.setAuditStatus(2L);// 审核不通过
		}
		proxyService.update(proxy);
		model.addAttribute("proxy", proxyService.getById(proxy.getId()));
		return "proxy/proxyAudit";
	}

	// 删除
	@RequestMapping(value = "delete/{id}")
	public String delete(@PathVariable("id") Long id, RedirectAttributes redirectAttributes) {
		proxyService.delete(id);
		redirectAttributes.addFlashAttribute("message", "删除成功");
		return "redirect:/proxy";
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
