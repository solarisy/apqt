package com.wismay.apqt.web.customer;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wismay.apqt.comm.Role;
import com.wismay.apqt.entity.Company;
import com.wismay.apqt.service.CompanyService;
import com.wismay.apqt.service.account.ShiroDbRealm.ShiroUser;

/**
 * 我的代理、客户查询
 * 
 * @author Peter
 */
@Controller
@RequestMapping(value = "/customer")
public class CustomerController {

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		SimpleDateFormat dateFormat2 = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat2, true));
	}

	@Autowired
	private CompanyService companyService;

	@RequestMapping(value = "mycustomer", method = RequestMethod.GET)
	public String customerlist(Model model) {
		Company company = new Company();
		List<Long> status = new ArrayList<Long>();

		String role = getCurrentUser().getRoles();

		// 代理管理员、代理人员:看到自己的代理人员提交的信息
		if (role.contains(Role.proxy_admin) || role.contains(Role.proxy_user)) {
			company.setProxy(getCurrentUser().getProxy());
		}

		// 审核状态 0：未审核(代理提交)；1：未审核(平台管理员提交)；2：代理管理员审核通过；
		// 3：代理管理员审核不通过；4：平台管理员审核通过；5：平台管理员神不通过。
		status.add(4L);

		company.setAuditStatusList(status);
		model.addAttribute("list", companyService.search(company));
		return "customer/mycustomerList";
	}

	public ShiroUser getCurrentUser() {
		ShiroUser user = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
		return user;
	}
}
