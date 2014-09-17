package com.wismay.apqt.web.front;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wismay.apqt.service.CompanyService;

/**
 * 查询接口：根据诚信码查询
 * 
 * @author Peter
 */
@Controller
@RequestMapping(value = "/web/search")
public class WebSearchController {

	@Autowired
	private CompanyService companyService;

	@RequestMapping(method = { RequestMethod.POST, RequestMethod.GET })
	public String list(@ModelAttribute("certcode") String certcode, Model model) {
		if (StringUtils.isNotEmpty(certcode)) {
			model.addAttribute("list", companyService.searchByCertcode(certcode));
		}
		model.addAttribute("certcode", certcode);
		return "front/search";
	}

}
