package com.wismay.apqt.web.front;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wismay.apqt.entity.Company;
import com.wismay.apqt.entity.Personal;
import com.wismay.apqt.service.CompanyService;
import com.wismay.apqt.service.PersonalService;

/**
 * 查询接口：根据诚信信用码查询
 * 
 * @author Peter
 */
@Controller
@RequestMapping(value = "/web")
public class WebSearchController {
	private static Logger logger = LoggerFactory.getLogger(WebSearchController.class);
	@Autowired
	private CompanyService companyService;

	@Autowired
	private PersonalService personalService;

	// 前端首页
	@RequestMapping(value = "home", method = RequestMethod.GET)
	public String list(Model model) {
		return "front/index";
	}

	// 机构查询
	@RequestMapping(value = "jgcy", method = RequestMethod.GET)
	public String jgcy(Model model) {
		return "front/jgcy";
	}

	// 产品查询
	@RequestMapping(value = "cpcx", method = RequestMethod.GET)
	public String cpcx(Model model) {
		return "front/cpcx";
	}

	// 修改授权码
	@RequestMapping(value = "xgsqm", method = RequestMethod.GET)
	public String xgsqm(Model model) {
		return "front/xgsqm";
	}

	// 个人查询
	@RequestMapping(value = "grcy", method = RequestMethod.GET)
	public String grcy(Model model) {
		return "front/grcy";
	}

	@RequestMapping(value = "search", method = { RequestMethod.GET, RequestMethod.POST })
	public String list(@ModelAttribute("certcode") String certcode, Model model) {
		String result = "front/index";
		if (StringUtils.isNotEmpty(certcode)) {
			model.addAttribute("list", companyService.searchByCertcode(certcode));
		}

		// 查询公司
		List<Company> companyList = companyService.searchByCertcode(certcode);

		List<Personal> personalList = null;
		// 查询个人
		if (companyList == null || companyList.size() == 0) {
			personalList = personalService.searchByCertcode(certcode);
			if (personalList != null && personalList.size() > 0) {
				result = "front/personal-result";
				model.addAttribute("obj", personalList.get(0));
			}
		} else {
			result = "front/company-result";
			model.addAttribute("obj", companyList.get(0));
		}

		model.addAttribute("certcode", certcode);
		return result;
	}

	// 按机构查询
	@RequestMapping(value = "search/company", method = { RequestMethod.GET, RequestMethod.POST })
	public String searchCompany(@ModelAttribute("company") Company company, @ModelAttribute("searchBy") String searchBy, Model model) {
		String result = "front/jgcy";

		// 查询公司
		List<Company> companyList = companyService.webSearch(company);

		if (companyList != null && companyList.size() > 0) {
			result = "front/company-result";
			model.addAttribute("obj", companyList.get(0));
		}

		model.addAttribute("company", company);
		model.addAttribute("searchBy", searchBy);

		return result;
	}

	// 个人查询
	@RequestMapping(value = "search/personal", method = { RequestMethod.GET, RequestMethod.POST })
	public String searchPersonal(@ModelAttribute("personal") Personal personal, @ModelAttribute("searchBy") String searchBy, Model model) {
		String result = "front/grcy";

		// 查询个人
		List<Personal> personalList = personalService.webSearch(personal);

		if (personalList != null && personalList.size() > 0) {
			result = "front/personal-result";
			model.addAttribute("obj", personalList.get(0));
		}

		model.addAttribute("personal", personal);
		model.addAttribute("searchBy", searchBy);

		return result;
	}

	// 产品查询
	@RequestMapping(value = "search/product", method = { RequestMethod.GET, RequestMethod.POST })
	public String searchProduct(@ModelAttribute("personal") Personal personal, @ModelAttribute("searchBy") String searchBy, Model model) {
		String result = "front/cpcx";

		// 查询产品（一期不实现此功能）

		model.addAttribute("personal", personal);
		model.addAttribute("searchBy", searchBy);

		return result;
	}

	@RequestMapping(value = "ajax/personal/checkAuthCode", method = RequestMethod.GET)
	@ResponseBody
	public String checkAuthCodeForPersonal(@ModelAttribute("certcode") String certcode, @ModelAttribute("authCode") String authCode) {
		logger.info(certcode + ":" + authCode);
		String result = "false";

		Personal personal = personalService.searchByAuthCode(certcode, authCode);
		if (personal != null) {
			result = "true";
		}

		return result;
	}

	@RequestMapping(value = "ajax/company/checkAuthCode", method = RequestMethod.GET)
	@ResponseBody
	public String checkAuthCodeForCompany(@ModelAttribute("certcode") String certcode, @ModelAttribute("authCode") String authCode) {
		logger.info(certcode + ":" + authCode);
		String result = "false";

		Company company = companyService.searchByAuthCode(certcode, authCode);
		if (company != null) {
			result = "true";
		}

		return result;
	}

	// 修改授权码
	@RequestMapping(value = "authCodeEdit", method = { RequestMethod.GET, RequestMethod.POST })
	public String authCodeEdit(@ModelAttribute("certcode") String certcode, @ModelAttribute("oldAuthCode") String oldAuthCode, @ModelAttribute("newAuthCode") String newAuthCode, Model model) {
		logger.info(certcode + ":" + oldAuthCode + ":" + newAuthCode);

		Company company = companyService.searchByAuthCode(certcode, oldAuthCode);

		Personal personal = personalService.searchByAuthCode(certcode, oldAuthCode);

		if (company != null) {
			company.setAuthCode(newAuthCode);
			companyService.update(company);
			model.addAttribute("successMsg", "授权码修改成功！");
		} else if (personal != null) {
			personal.setAuthCode(newAuthCode);
			personalService.update(personal);
			model.addAttribute("successMsg", "授权码修改成功！");
		} else {
			model.addAttribute("errorMsg", "认证码或授权码错误！");
		}

		model.addAttribute("certcode", certcode);
		return "front/xgsqm";
	}

}
