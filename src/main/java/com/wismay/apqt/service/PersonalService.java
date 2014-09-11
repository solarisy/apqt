package com.wismay.apqt.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wismay.apqt.comm.MyPage;
import com.wismay.apqt.entity.Personal;
import com.wismay.apqt.repository.PersonalDao;

/**
 * 
 * 
 * @author Peter
 */
// Spring Service Bean的标识.
@Component
public class PersonalService {

	private static Logger logger = LoggerFactory.getLogger(PersonalService.class);

	@Autowired
	private PersonalDao personalDao;

	public Personal getById(Long id) {
		return personalDao.getById(id);
	}

	public List<Personal> getAll() {
		return personalDao.getAll();
	}

	/**
	 * 分页查询
	 * 
	 * @param overtime
	 * @param pageStart
	 * @param pageSize
	 * @return
	 */
	public MyPage<Personal> searchPage(Personal personal, int currentPage, int pageSize) {
		MyPage<Personal> myPage = new MyPage<Personal>();

		Long count = personalDao.searchCount(personal);

		int pageStart = (currentPage - 1) < 0 ? 0 : (currentPage - 1) * pageSize;
		List<Personal> list = personalDao.searchPage(personal, pageStart, pageSize);

		myPage.setCount(count);
		myPage.setContent(list);

		return myPage;
	}

	public void save(Personal personal) {
		personalDao.save(personal);
	}

	public void update(Personal personal) {
		personalDao.update(personal);
	}

	/**
	 * 软删除
	 */
	public void delete(Long id) {
		personalDao.delete(id);
	}

	public List<Personal> search(Personal personal) {
		// TODO Auto-generated method stub
		return personalDao.search(personal);
	}
}
