package com.wismay.apqt.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wismay.apqt.entity.MembershipApply2;
import com.wismay.apqt.repository.MembershipApply2Dao;

/**
 * 
 * 
 * @author Peter
 */
// Spring Service Bean的标识.
@Component
public class MembershipApply2Service {

	private static Logger logger = LoggerFactory.getLogger(MembershipApply2Service.class);

	@Autowired
	private MembershipApply2Dao membershipApply2Dao;

	public MembershipApply2 getById(Long id) {
		return membershipApply2Dao.getById(id);
	}

	public List<MembershipApply2> getAll() {
		return membershipApply2Dao.getAll();
	}

	public void save(MembershipApply2 membershipApply2) {
		membershipApply2Dao.save(membershipApply2);
	}

	public void update(MembershipApply2 membershipApply2) {
		membershipApply2Dao.update(membershipApply2);
	}

	/**
	 * 软删除
	 */
	public void delete(Long id) {
		membershipApply2Dao.delete(id);
	}
}
