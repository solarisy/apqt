package com.wismay.apqt.web.membership;

import java.text.SimpleDateFormat;
import java.util.Date;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.wismay.apqt.entity.MembershipApply2;
import com.wismay.apqt.service.MembershipApply2Service;
import com.wismay.apqt.service.account.ShiroDbRealm.ShiroUser;

/**
 * 
 * @author Peter
 */
@Controller
@RequestMapping(value = "/membershipApply")
public class MembershipApplyController {

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		SimpleDateFormat dateFormat2 = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat2, true));
	}

	@Autowired
	private MembershipApply2Service membershipApplyService;

	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String membershipApplylist(Model model) {

		model.addAttribute("list", membershipApplyService.getAll());

		return "membershipApply/membershipApplyList";
	}

	// to 详情页面
	@RequestMapping(value = "detail/{id}", method = RequestMethod.GET)
	public String detail(@PathVariable("id") Long id, Model model) {
		model.addAttribute("obj", membershipApplyService.getById(id));
		return "membershipApply/membershipApplyDetail";
	}

	// to 更新页面
	@RequestMapping(value = "update/{id}", method = RequestMethod.GET)
	public String updateForm(@PathVariable("id") Long id, Model model) {
		model.addAttribute("action", "update");
		model.addAttribute("obj", membershipApplyService.getById(id));
		return "membershipApply/membershipApplyForm";
	}

	// 更新保存
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String updateSave(@Valid @ModelAttribute("membershipApply") MembershipApply2 membershipApply, RedirectAttributes redirectAttributes) {
		membershipApplyService.update(membershipApply);
		redirectAttributes.addFlashAttribute("message", "操作成功");
		return "redirect:/membershipApply/list";
	}

	// 删除
	@RequestMapping(value = "delete/{id}", method = RequestMethod.GET)
	public String delete(@PathVariable("id") Long id, RedirectAttributes redirectAttributes) {
		membershipApplyService.delete(id);
		redirectAttributes.addFlashAttribute("message", "删除成功");
		return "redirect:/membershipApply/list";
	}

	public ShiroUser getCurrentUser() {
		ShiroUser user = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
		return user;
	}
}
