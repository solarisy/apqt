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

	@Autowired
	private PersonalService personalService;

	@RequestMapping(value = "mycustomer", method = RequestMethod.GET)
	public String customerlist(Model model) {
		Company company = new Company();

		String role = getCurrentUser().getRoles();

		// 代理管理员、代理人员:看到自己的代理人员提交的信息
		if (role.contains(Role.proxy_admin) || role.contains(Role.proxy_user)) {
			company.setProxy(getCurrentUser().getProxy());
		} else {
			company.setProxy(null);
		}

		// 只看审核通过的客户信息
		List<Long> status = new ArrayList<Long>();
		status.add(AuditStatus.PASS);
		company.setAuditStatusList(status);

		company.setIsProxy(null);

		model.addAttribute("list", companyService.myCustomer(company));

		return "customer/mycustomerList";
	}

	// 根据公司查询器下面所有的个人信息
	@RequestMapping(value = "mypersonal/{companyId}", method = { RequestMethod.GET })
	public String listPersonal(@PathVariable("companyId") Long companyId, Model model) {
		Personal p = new Personal();
		p.setCompany(companyId);
		List<Long> status = new ArrayList<Long>();
		status.add(1L);
		p.setAuditStatusList(status);

		model.addAttribute("companyId", companyId);
		model.addAttribute("list", personalService.search(p));
		return "customer/myPersonalList";
	}

	public ShiroUser getCurrentUser() {
		ShiroUser user = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
		return user;
	}
}
