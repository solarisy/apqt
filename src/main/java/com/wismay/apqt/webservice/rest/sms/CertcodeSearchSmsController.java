package com.wismay.apqt.webservice.rest.sms;

import java.io.UnsupportedEncodingException;
import java.util.Random;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springside.modules.mapper.BeanMapper;
import org.springside.modules.mapper.JaxbMapper;

import com.wismay.apqt.service.ServiceException;

/**
 * Shiro的配置文件中对/api/secure/**进行拦截，要求authBasic认证.
 * 
 * @author calvin
 */
@Controller
@RequestMapping(value = { "/api/v1/certcode/search", "/api/secure/v1/certcode/search" })
public class CertcodeSearchSmsController {
	private static Logger logger = LoggerFactory.getLogger(CertcodeSearchSmsController.class);

	@Value("#{settings['web.search.url']}")
	private String webSearchURL;

	/**
	 * 基于ContentNegotiationManager,根据URL的后缀渲染不同的格式
	 * eg. /api/v1/user/xml 返回xml
	 * /api/v1/user/json 返回json
	 * /api/v1/user/1 返回xml(why?)
	 * 
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping(value = "/xml", method = RequestMethod.POST)
	@ResponseBody
	public String search(@RequestBody String xml, HttpServletResponse response) throws UnsupportedEncodingException {
		response.setContentType(" text/html;charset=gb2312");
		Random r = new Random(System.currentTimeMillis());
		Long TF = r.nextLong();

		logger.info(TF + "-SMS Request:\n" + xml);
		CertcodeSearchResponse res = new CertcodeSearchResponse();

		// 使用Dozer转换DTO类，并补充Dozer不能自动绑定的属性
		try {
			CertcodeSearchRequest certcodeSearchRequest = JaxbMapper.fromXml(xml, CertcodeSearchRequest.class);

			res = BeanMapper.map(certcodeSearchRequest, CertcodeSearchResponse.class);

			res.setServiceCode(certcodeSearchRequest.getSmsServiceCode());

			String msg = certcodeSearchRequest.getMessage();// 消息内容“诚信# 诚信信用码#授权码”

			String str[] = msg.split("#");
			String certcode = "0";
			if (str == null) {
				throw new ServiceException("短信格式错误，请检查短信格式是否与“诚信#诚信信用码#授权码”一致。");
			} else if (str.length == 1) {
				throw new ServiceException("短信格式错误，请检查短信格式是否与“诚信#诚信信用码#授权码”一致。");
			} else if (str.length == 2) {
				certcode = str[1].trim();
			} else if (str.length == 3) {
				certcode = str[1].trim();
			} else {
				throw new ServiceException("短信格式错误，请检查短信格式是否与“诚信#诚信信用码#授权码”一致。");
			}

			if (StringUtils.isBlank(certcode)) {
				throw new ServiceException("短信格式错误，诚信信用码不能为空。");
			} else {
				res.setMessage(webSearchURL + certcode);
			}

			/* 返回前端查询的网址 */
			// 查询公司
			// List<Company> companyList = companyService.searchByCertcode(certcode);
			//
			// List<Personal> personalList = null;
			// if (companyList == null || companyList.size() == 0) {
			// // 查询个人
			// personalList = personalService.searchByCertcode(certcode);
			// if (personalList == null || personalList.size() == 0) {
			// res.setMessage("诚信信用码“" + certcode + "”还没有被使用");
			// } else {
			// Personal personal = personalList.get(0);
			// StringBuffer msg = new StringBuffer("诚信信用码：").append(personal.getCertcode()).append("，姓名：" + personal.getName()).append("。");
			// res.setMessage(msg.toString());
			// }
			//
			// } else {
			// Company company = companyList.get(0);
			// StringBuffer msg = new StringBuffer("诚信信用码：").append(company.getCertcode()).append("，公司名称：" + company.getNameCn()).append("。");
			// res.setMessage(msg.toString());
			// }

		} catch (ServiceException e) {
			logger.info(e.getMessage(), e);
			res.setMessage(e.getMessage());
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			res.setMessage("抱歉，系统维护中！请稍后再试。");
		}

		res.setMobaddrName("");
		String result = JaxbMapper.toXml(res, "gb2312");

		// String str = new String(result.getBytes("utf-8"), "gb2312");

		logger.info(TF + "-SMS Response:\n" + result);
		return result;
	}

	public static void main(String[] args) {
		String str = "诚信# 111111";

		String strs[] = str.split("#");
		System.out.println(strs.length);
		System.out.println(strs[0]);
		System.out.println(strs[1]);
		System.out.println(strs[2]);
	}
}
