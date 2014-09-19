package com.wismay.apqt.webservice.rest;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springside.modules.mapper.BeanMapper;
import org.springside.modules.mapper.JaxbMapper;

import com.wismay.apqt.entity.Company;
import com.wismay.apqt.entity.Personal;
import com.wismay.apqt.service.CompanyService;
import com.wismay.apqt.service.PersonalService;

/**
 * Shiro的配置文件中对/api/secure/**进行拦截，要求authBasic认证.
 * 
 * @author calvin
 */
@Controller
@RequestMapping(value = { "/api/v1/certcode/search", "/api/secure/v1/certcode/search" })
public class CertcodeSearchSmsController {
	private static Logger logger = LoggerFactory.getLogger(CertcodeSearchSmsController.class);

	@Autowired
	private CompanyService companyService;

	@Autowired
	private PersonalService personalService;

	/**
	 * 基于ContentNegotiationManager,根据URL的后缀渲染不同的格式
	 * eg. /api/v1/user/xml 返回xml
	 * /api/v1/user/json 返回json
	 * /api/v1/user/1 返回xml(why?)
	 */
	@RequestMapping(value = "/xml", method = RequestMethod.POST)
	@ResponseBody
	public CertcodeSearchResponse search(@RequestBody String xml) {
		logger.info(xml);
		CertcodeSearchResponse res = new CertcodeSearchResponse();

		// 使用Dozer转换DTO类，并补充Dozer不能自动绑定的属性
		try {
			CertcodeSearchRequest certcodeSearchRequest = JaxbMapper.fromXml(xml, CertcodeSearchRequest.class);

			res = BeanMapper.map(certcodeSearchRequest, CertcodeSearchResponse.class);

			res.setServiceCode(certcodeSearchRequest.getSmsServiceCode());

			String certcode = certcodeSearchRequest.getMessage();// 消息内容就是诚信码

			// 查询公司
			List<Company> companyList = companyService.searchByCertcode(certcode);

			List<Personal> personalList = null;
			if (companyList == null || companyList.size() == 0) {
				// 查询个人
				personalList = personalService.searchByCertcode(certcode);
				if (personalList == null || personalList.size() == 0) {
					res.setMessage("诚信码“" + certcode + "”还没有被使用");
				} else {
					Personal personal = personalList.get(0);
					StringBuffer msg = new StringBuffer("诚信码：").append(personal.getCertcode()).append("，姓名：" + personal.getName()).append("。");
					res.setMessage(msg.toString());
				}

			} else {
				Company company = companyList.get(0);
				StringBuffer msg = new StringBuffer("诚信码：").append(company.getCertcode()).append("，公司名称：" + company.getNameCn()).append("。");
				res.setMessage(msg.toString());
			}

		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			res.setMessage("抱歉，系统维护中！请稍后再试。");
		}

		return res;
	}
}
