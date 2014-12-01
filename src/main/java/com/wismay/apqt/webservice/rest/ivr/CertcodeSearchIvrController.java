package com.wismay.apqt.webservice.rest.ivr;

import java.util.List;
import java.util.Random;

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
import org.springside.modules.mapper.JaxbMapper;

import com.wismay.apqt.entity.Company;
import com.wismay.apqt.entity.Personal;
import com.wismay.apqt.service.CompanyService;
import com.wismay.apqt.service.PersonalService;
import com.wismay.apqt.service.ServiceException;

/**
 * Shiro的配置文件中对/api/secure/**进行拦截，要求authBasic认证.
 * 
 * @author calvin
 */
@Controller
@RequestMapping(value = { "/api/ivr/v1/certcode/search", "/api/ivr/secure/v1/certcode/search" })
public class CertcodeSearchIvrController {
	private static Logger logger = LoggerFactory.getLogger(CertcodeSearchIvrController.class);

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
	@RequestMapping(value = "/xml", method = { RequestMethod.POST, RequestMethod.GET })
	@ResponseBody
	public CertcodeSearchResponse search(@ModelAttribute("Phone") String Phone, @ModelAttribute("CxCode") String CxCode, @ModelAttribute("AuCode") String AuCode, Model model) {
		Random r = new Random(System.currentTimeMillis());
		Long TF = r.nextLong();

		logger.info(TF + "-IVR Request:\n" + "Phone:" + Phone + ",CxCode:" + CxCode + ";AuCode" + AuCode);
		CertcodeSearchResponse res = new CertcodeSearchResponse();
		res.setFrom(Phone);

		String msg = "诚信码错误";

		try {

			// 查询公司
			List<Company> companyList = companyService.searchByCertcode(CxCode);

			List<Personal> personalList = null;
			// 查询个人
			if (companyList == null || companyList.size() == 0) {
				personalList = personalService.searchByCertcode(CxCode);
				if (personalList != null && personalList.size() > 0) {
					Personal p = personalList.get(0);
					// 授权信息
					if (StringUtils.isNotBlank(AuCode) && AuCode.equals(p.getAuthCode().trim())) {
						msg = changeNull(p.getName()) + "，" + changeNull(p.getSex()) + "，工作单位：" + changeNull(p.getUnit()) + "，" + changeNull(p.getDuty()) + "，职业号：" + changeNull(p.getJobNumber())
								+ "，电话：" + changeNull(p.getPhone()) + "，" + "身份证号：" + changeNull(p.getIdNumber()) + "，国籍：" + changeNull(p.getCountry()) + "，" + changeNull(p.getEthnic()) + "，婚姻状况："
								+ changeNull(p.getMarriage()) + "，子女数量：" + changeNull(p.getChildren()) + "，籍贯/户籍地址：" + changeNull(p.getRegisteredAddress()) + "，手机号" + changeNull(p.getMobilephone())
								+ "，电子邮箱：" + changeNull(p.getEmail()) + "，学历：" + changeNull(p.getEducation()) + "。";
					} else {
						// 非授权信息
						msg = changeNull(p.getName()) + "，" + changeNull(p.getSex()) + "，工作单位：" + changeNull(p.getUnit()) + "，" + changeNull(p.getDuty()) + "，职业号：" + changeNull(p.getJobNumber())
								+ "，电话：" + changeNull(p.getPhone()) + "。";
					}
				}
			} else {
				Company c = companyList.get(0);
				// 授权信息
				if (StringUtils.isNotBlank(AuCode) && AuCode.equals(c.getAuthCode().trim())) {
					msg = changeNull(c.getNameCn()) + "，联系人地址：" + changeNull(c.getContactsAddress()) + "，单位性质：" + changeNull(c.getUnitPropertie()) + "，组织机构代码：" + changeNull(c.getOrgcode()) + "，所属行业："
							+ changeNull(c.getIndustry()) + "，法人代表：" + changeNull(c.getLegalRepresentative()) + "，单位网址" + changeNull(c.getWebsite()) + "，邮编：" + changeNull(c.getZip()) + "，联系电话："
							+ changeNull(c.getContactsPhone()) + "，" + "经营范围：" + changeNull(c.getBusinessScope()) + "，年营业额：" + changeNull(c.getAnnualTurnover()) + "，员工人数："
							+ changeNull(c.getEmployeeNumber()) + "，基本账户开户行：" + changeNull(c.getBasicBank()) + "，基本账户账号：" + changeNull(c.getBasicBankAccount()) + "，注册资金："
							+ changeNull(c.getRegisteredCapital()) + "，注册地址：" + changeNull(c.getRegisteredAddress()) + "，获得何种证书：" + changeNull(c.getCertificate()) + "。";
				} else {
					// 非授权信息
					msg = changeNull(c.getNameCn()) + "，联系人地址：" + changeNull(c.getContactsAddress()) + "，单位性质：" + changeNull(c.getUnitPropertie()) + "，组织机构代码：" + changeNull(c.getOrgcode()) + "，所属行业："
							+ changeNull(c.getIndustry()) + "，法人代表：" + changeNull(c.getLegalRepresentative()) + "，单位网址" + changeNull(c.getWebsite()) + "，邮编：" + changeNull(c.getZip()) + "，联系电话："
							+ changeNull(c.getContactsPhone()) + "。";
				}

			}

			res.setMsg(msg);
		} catch (ServiceException e) {
			logger.info(e.getMessage(), e);
			res.setIsError("1");
			res.setMsg(e.getMessage());

		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			res.setIsError("1");
			res.setMsg("抱歉，系统维护中！请稍后再试。");
		}

		logger.info(TF + "-IVR Response:\n" + JaxbMapper.toXml(res));
		return res;
	}

	public static void main(String[] args) {
		String str = "ss";

		// String strs[] = str.split("#");
		/*
		 * System.out.println(strs.length);
		 * System.out.println(strs[0]);
		 * System.out.println(strs[1]);
		 * System.out.println(strs[2]);
		 */

		// System.out.println(changeNull(str));

	}

	public String changeNull(String str) {

		return str != null ? str : "";
	}
}
