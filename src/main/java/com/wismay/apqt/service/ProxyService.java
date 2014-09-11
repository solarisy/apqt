package com.wismay.apqt.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wismay.apqt.comm.MyPage;
import com.wismay.apqt.entity.Proxy;
import com.wismay.apqt.repository.ProxyDao;

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
	private ProxyDao proxyDao;

	public Proxy getById(Long id) {
		return proxyDao.getById(id);
	}

	public List<Proxy> getAll() {
		return proxyDao.getAll();
	}

	public List<Proxy> search(Proxy proxy) {
		return proxyDao.search(proxy);
	}

	/**
	 * 分页查询
	 * 
	 * @param overtime
	 * @param pageStart
	 * @param pageSize
	 * @return
	 */
	public MyPage<Proxy> searchPage(Proxy proxy, int currentPage, int pageSize) {
		MyPage<Proxy> myPage = new MyPage<Proxy>();

		Long count = proxyDao.searchCount(proxy);

		int pageStart = (currentPage - 1) < 0 ? 0 : (currentPage - 1) * pageSize;
		List<Proxy> list = proxyDao.searchPage(proxy, pageStart, pageSize);

		myPage.setCount(count);
		myPage.setContent(list);

		return myPage;
	}

	public void save(Proxy proxy) {
		proxyDao.save(proxy);
	}

	public void update(Proxy proxy) {
		proxyDao.update(proxy);
	}

	/**
	 * 软删除
	 */
	public void delete(Long id) {
		proxyDao.delete(id);
	}
}
