package com.wismay.apqt.web.front;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.validation.Valid;

import org.apache.shiro.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wismay.apqt.comm.DeletedFlag;
import com.wismay.apqt.entity.MembershipApply;
import com.wismay.apqt.service.MembershipApplyService;
import com.wismay.apqt.service.account.ShiroDbRealm.ShiroUser;

/**
 * 
 * 
 * @author Peter
 */
@Controller
@RequestMapping(value = "/web/membershipApply")
public class MembershipApplyWebController {
	private static Logger logger = LoggerFactory.getLogger(MembershipApplyWebController.class);

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		SimpleDateFormat dateFormat2 = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat2, true));
	}

	@Autowired
	private MembershipApplyService membershipApplyService;

	// to 新增
	@RequestMapping(value = "create")
	public String create(Model model) {
		return "front/membership-apply";
	}

	// 新增保存
	@RequestMapping(value = "save", method = RequestMethod.POST)
	public String save(@Valid @ModelAttribute("membershipApply") MembershipApply membershipApply, Model model) {
		try {
			membershipApply.setCreateUser(0L);
			membershipApply.setCreateDate(new Date());
			membershipApply.setUpdateDate(new Date());
			membershipApply.setDeleted(DeletedFlag.USED);
			membershipApply.setRegisterDate(new Date());

			membershipApplyService.save(membershipApply);

			model.addAttribute("obj", membershipApply);
			model.addAttribute("successMsg", "申请成功！");
		} catch (Exception e) {
			model.addAttribute("errorMsg", "申请失败！");
			logger.error("申请失败！", e);
		}
		return "front/membership-apply-result";
	}

	public ShiroUser getCurrentUser() {
		ShiroUser user = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
		return user;
	}
}
