package com.wismay.apqt.web.account;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.wismay.apqt.comm.AuditStatus;
import com.wismay.apqt.comm.Role;
import com.wismay.apqt.entity.Company;
import com.wismay.apqt.entity.User;
import com.wismay.apqt.service.ProxyService;
import com.wismay.apqt.service.account.AccountService;
import com.wismay.apqt.service.account.ShiroDbRealm.ShiroUser;

/**
 * 平台管理员
 * 
 * @author Peter
 */
@Controller
@RequestMapping(value = "/admin/proxy-admin")
public class ProxyAdminController {

	@Autowired
	private AccountService accountService;

	@Autowired
	private ProxyService proxyService;

	@RequestMapping(method = RequestMethod.GET)
	public String list(Model model) {
		User user = new User();
		user.setRoles(Role.proxy_admin);

		List<User> list = accountService.searchHaveProxy(user);

		model.addAttribute("list", list);
		return "account/proxyAdminList";
	}

	@RequestMapping(value = "create", method = RequestMethod.GET)
	public String createForm(Model model) {
		Company proxy = new Company();
		List<Long> status = new ArrayList<Long>();
		status.add(AuditStatus.PASS);// 审核通过
		proxy.setAuditStatusList(status);
		model.addAttribute("proxyList", proxyService.search(proxy));
		model.addAttribute("action", "create");
		return "account/proxyAdminForm";
	}

	@RequestMapping(value = "create", method = RequestMethod.POST)
	public String saveForm(@Valid @ModelAttribute("user") User user, RedirectAttributes redirectAttributes) {
		user.setPlainPassword("123456");
		user.setRoles(Role.proxy_admin);
		user.setCreateUser(getCurrentUser().id);
		accountService.addUser(user);
		redirectAttributes.addFlashAttribute("message", "代理管理员创建成功，账号：" + user.getLoginName() + "，初始密码：123456");
		return "redirect:/admin/proxy-admin";
	}

	@RequestMapping(value = "update/{id}", method = RequestMethod.GET)
	public String updateForm(@PathVariable("id") Long id, Model model) {
		// 查询代理列表，初始化下拉框
		Company proxy = new Company();
		List<Long> status = new ArrayList<Long>();
		status.add(AuditStatus.PASS);// 审核通过
		proxy.setAuditStatusList(status);
		model.addAttribute("proxyList", proxyService.search(proxy));

		model.addAttribute("user", accountService.getUser(id));
		model.addAttribute("action", "update");
		return "account/proxyAdminForm";
	}

	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(@Valid @ModelAttribute("user") User user, RedirectAttributes redirectAttributes) {
		accountService.updateUser(user);
		redirectAttributes.addFlashAttribute("message", "操作成功");
		return "redirect:/admin/proxy-admin";
	}

	@RequestMapping(value = "pwd/{id}", method = RequestMethod.GET)
	public String updatePwdForm(@PathVariable("id") Long id, Model model) {
		model.addAttribute("user", accountService.getUser(id));
		return "account/proxyAdminPwdForm";
	}

	@RequestMapping(value = "updatePwd", method = RequestMethod.POST)
	public String updatePwd(@ModelAttribute("user") User user, RedirectAttributes redirectAttributes) {
		accountService.updateUser(user);
		redirectAttributes.addFlashAttribute("message", "密码修改成功");
		return "redirect:/admin/proxy-admin";
	}

	@RequestMapping(value = "delete/{id}")
	public String delete(@PathVariable("id") Long id, RedirectAttributes redirectAttributes) {
		accountService.deleteUser(id);
		redirectAttributes.addFlashAttribute("message", "操作成功");
		return "redirect:/admin/proxy-admin";
	}

	public ShiroUser getCurrentUser() {
		ShiroUser user = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
		return user;
	}

}
