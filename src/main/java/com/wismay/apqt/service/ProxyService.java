package com.wismay.apqt.service;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wismay.apqt.comm.AuditStatus;
import com.wismay.apqt.comm.DeletedFlag;
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
public class ProxyService {

	private static Logger logger = LoggerFactory.getLogger(ProxyService.class);

	@Autowired
	private CompanyDao companyDao;

	public Company getById(Long id) {
		return companyDao.getById(id);
	}

	public List<Company> search(Company company) {
		company.setIsProxy(ProxyFlag.YES);// 只查询代理
		return companyDao.search(company);
	}

	public void save(Company company) {
		company.setIsProxy(ProxyFlag.YES);
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

	/**
	 * 查询审核通过的代理
	 * 
	 * @return
	 *         2014-10-16
	 *         Peter
	 */
	public List<Company> listForAuditPass() {
		Company c = new Company();

		c.setDeleted(DeletedFlag.USED);

		List<Long> status = new ArrayList<Long>();
		status.add(AuditStatus.PASS);// 审核通过
		c.setAuditStatusList(status);

		return search(c);
	}
}
