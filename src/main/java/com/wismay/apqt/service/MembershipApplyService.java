package com.wismay.apqt.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wismay.apqt.comm.MyPage;
import com.wismay.apqt.entity.MembershipApply;
import com.wismay.apqt.repository.MembershipApplyDao;

/**
 * 
 * 
 * @author Peter
 */
// Spring Service Bean的标识.
@Component
public class MembershipApplyService {

	private static Logger logger = LoggerFactory.getLogger(MembershipApplyService.class);

	@Autowired
	private MembershipApplyDao membershipApplyDao;

	public MembershipApply getById(Long id) {
		return membershipApplyDao.getById(id);
	}

	public List<MembershipApply> getAll() {
		return membershipApplyDao.getAll();
	}

	/**
	 * 分页查询
	 * 
	 * @param overtime
	 * @param pageStart
	 * @param pageSize
	 * @return
	 */
	public MyPage<MembershipApply> searchPage(MembershipApply membershipApply, int currentPage, int pageSize) {
		MyPage<MembershipApply> myPage = new MyPage<MembershipApply>();

		Long count = membershipApplyDao.searchCount(membershipApply);

		int pageStart = (currentPage - 1) < 0 ? 0 : (currentPage - 1) * pageSize;
		List<MembershipApply> list = membershipApplyDao.searchPage(membershipApply, pageStart, pageSize);

		myPage.setCount(count);
		myPage.setContent(list);

		return myPage;
	}

	public void save(MembershipApply membershipApply) {
		membershipApplyDao.save(membershipApply);
	}

	public void update(MembershipApply membershipApply) {
		membershipApplyDao.update(membershipApply);
	}

	/**
	 * 软删除
	 */
	public void delete(Long id) {
		membershipApplyDao.delete(id);
	}
}
