package com.wismay.apqt.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wismay.apqt.comm.MyPage;
import com.wismay.apqt.comm.ProxyFlag;
import com.wismay.apqt.entity.Company;
import com.wismay.apqt.repository.CompanyDao;

/**
 * 
 * 
 * @author Peter
 */
// Spring Service Bean的标识.
@Component
public class CompanyService {

	private static Logger logger = LoggerFactory.getLogger(CompanyService.class);

	@Autowired
	private CompanyDao companyDao;

	// 根据诚信信用码查询
	public List<Company> searchByCertcode(String certcode) {
		return companyDao.searchByCertcode(certcode);
	}

	public Company getById(Long id) {
		return companyDao.getById(id);
	}

	public List<Company> search(Company company) {
		return companyDao.search(company);
	}

	public List<Company> webSearch(Company company) {
		return companyDao.webSearch(company);
	}

	public List<Company> myCustomer(Company company) {
		return companyDao.myCustomer(company);
	}

	/**
	 * 分页查询
	 * 
	 * @param overtime
	 * @param pageStart
	 * @param pageSize
	 * @return
	 */
	public MyPage<Company> searchPage(Company company, int currentPage, int pageSize) {
		MyPage<Company> myPage = new MyPage<Company>();

		Long count = companyDao.searchCount(company);

		int pageStart = (currentPage - 1) < 0 ? 0 : (currentPage - 1) * pageSize;
		List<Company> list = companyDao.searchPage(company, pageStart, pageSize);

		myPage.setCount(count);
		myPage.setContent(list);

		return myPage;
	}

	public void save(Company company) {
		company.setIsProxy(ProxyFlag.NO);// 不是代理
		companyDao.save(company);
	}

	public void update(Company company) {
		companyDao.update(company);
	}

	/**
	 * 软删除
	 */
	public void delete(Long id) {
		companyDao.delete(id);
	}

	public Company searchByAuthCode(String certcode, String authCode) {
		List<Company> list = companyDao.searchByAuthCode(certcode, authCode);
		if (list == null || list.size() == 0) {
			return null;
		} else {
			return list.get(0);
		}
	}

}
