package com.wismay.apqt.web.search;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wismay.apqt.entity.Company;
import com.wismay.apqt.entity.Personal;
import com.wismay.apqt.service.CompanyService;
import com.wismay.apqt.service.PersonalService;

/**
 * 查询接口：根据诚信码查询
 * 
 * @author Peter
 */
@Controller
@RequestMapping(value = "/search")
public class SearchController {

	@Autowired
	private CompanyService companyService;

	@Autowired
	private PersonalService personalService;

	@RequestMapping(method = { RequestMethod.POST, RequestMethod.GET })
	public String list(@ModelAttribute("certcode") String certcode, Model model) {
		if (StringUtils.isNotEmpty(certcode)) {

			// 查询公司
			List<Company> companyList = companyService.searchByCertcode(certcode);

			List<Personal> personalList = null;
			// 查询个人
			if (companyList == null || companyList.size() == 0) {
				personalList = personalService.searchByCertcode(certcode);
			}

			model.addAttribute("companyList", companyList);
			model.addAttribute("personalList", personalList);
		}
		model.addAttribute("certcode", certcode);
		return "search/searchList";
	}

}
