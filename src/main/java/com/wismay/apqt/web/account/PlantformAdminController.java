package com.wismay.apqt.web.account;

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

import com.wismay.apqt.comm.Role;
import com.wismay.apqt.entity.User;
import com.wismay.apqt.service.account.AccountService;
import com.wismay.apqt.service.account.ShiroDbRealm.ShiroUser;

/**
 * 平台管理员
 * 
 * @author Peter
 */
@Controller
@RequestMapping(value = "/admin/plantform-admin")
public class PlantformAdminController {

	@Autowired
	private AccountService accountService;

	@RequestMapping(method = RequestMethod.GET)
	public String list(Model model) {
		User user = new User();
		user.setRoles(Role.plantform_admin);

		List<User> list = accountService.search(user);

		model.addAttribute("list", list);
		return "account/plantformAdminList";
	}

	@RequestMapping(value = "create", method = RequestMethod.GET)
	public String createForm(Model model) {
		model.addAttribute("action", "create");
		return "account/plantformAdminForm";
	}

	@RequestMapping(value = "create", method = RequestMethod.POST)
	public String saveForm(@Valid @ModelAttribute("user") User user, RedirectAttributes redirectAttributes) {
		user.setPlainPassword("123456");
		user.setRoles(Role.plantform_admin);
		user.setCreateUser(getCurrentUser().id);
		user.setProxy(0L);
		accountService.addUser(user);
		redirectAttributes.addFlashAttribute("message", "操作成功，初始密码：123456");
		return "redirect:/admin/plantform-admin";
	}

	@RequestMapping(value = "update/{id}", method = RequestMethod.GET)
	public String updateForm(@PathVariable("id") Long id, Model model) {
		model.addAttribute("user", accountService.getUser(id));
		model.addAttribute("action", "update");
		return "account/plantformAdminForm";
	}

	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(@Valid @ModelAttribute("user") User user, RedirectAttributes redirectAttributes) {
		accountService.updateUser(user);
		redirectAttributes.addFlashAttribute("message", "操作成功");
		return "redirect:/admin/plantform-admin";
	}

	@RequestMapping(value = "pwd/{id}", method = RequestMethod.GET)
	public String updatePwdForm(@PathVariable("id") Long id, Model model) {
		model.addAttribute("user", accountService.getUser(id));
		return "account/plantformPwdForm";
	}

	@RequestMapping(value = "updatePwd", method = RequestMethod.POST)
	public String updatePwd(@ModelAttribute("user") User user, RedirectAttributes redirectAttributes) {
		accountService.updateUser(user);
		redirectAttributes.addFlashAttribute("message", "密码修改成功");
		return "redirect:/admin/plantform-admin";
	}

	@RequestMapping(value = "delete/{id}")
	public String delete(@PathVariable("id") Long id, RedirectAttributes redirectAttributes) {
		accountService.deleteUser(id);
		redirectAttributes.addFlashAttribute("message", "操作成功");
		return "redirect:/admin/plantform-admin";
	}

	public ShiroUser getCurrentUser() {
		ShiroUser user = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
		return user;
	}

}
