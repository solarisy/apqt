package com.wismay.apqt.web;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wismay.apqt.comm.AuditStatus;
import com.wismay.apqt.comm.Role;
import com.wismay.apqt.entity.Company;
import com.wismay.apqt.entity.Personal;
import com.wismay.apqt.service.CompanyService;
import com.wismay.apqt.service.PersonalService;
import com.wismay.apqt.service.account.ShiroDbRealm.ShiroUser;

/**
 * 我的代理、客户查询
 * 
 * @author Peter
 */
@Controller
@RequestMapping(value = "/${class.name?uncap_first}")
public class ${class.name}Controller {

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		SimpleDateFormat dateFormat2 = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat2, true));
	}

	@Autowired
	private ${class.name}Service ${class.name?uncap_first}Service;

	@Autowired
	private PersonalService personalService;

	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String ${class.name?uncap_first}list(Model model) {

		model.addAttribute("list", ${class.name?uncap_first}Service.getAll());

		return "${class.name?uncap_first}/${class.name?uncap_first}List";
	}

	// 跳转到更新页面
	@RequestMapping(value = "update/{id}", method = RequestMethod.GET)
	public String updateForm(@PathVariable("id") Long id, Model model) {
		model.addAttribute("action", "update");
		model.addAttribute("${class.name?uncap_first}", ${class.name?uncap_first}Service.getById(id));
		return "${class.name?uncap_first}/${class.name?uncap_first}Form";
	}

	// 更新保存
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String updateSave(@Valid @ModelAttribute("${class.name?uncap_first}") ${class.name} ${class.name?uncap_first}, RedirectAttributes redirectAttributes) {
		${class.name?uncap_first}Service.update(${class.name?uncap_first});
		redirectAttributes.addFlashAttribute("message", "操作成功");
		return "redirect:/${class.name?uncap_first}/${class.name?uncap_first}List";
	}
	
	// 删除
	@RequestMapping(value = "delete/{id}")
	public String delete(@PathVariable("id") Long id, RedirectAttributes redirectAttributes) {
		${class.name?uncap_first}Service.delete(id);
		redirectAttributes.addFlashAttribute("message", "删除成功");
		return "redirect:/${class.name?uncap_first}/${class.name?uncap_first}List";
	}
	
	public ShiroUser getCurrentUser() {
		ShiroUser user = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
		return user;
	}
}
