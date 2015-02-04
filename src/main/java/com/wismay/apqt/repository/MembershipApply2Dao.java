package com.wismay.apqt.repository;

import java.util.List;

import com.wismay.apqt.entity.MembershipApply2;

/**
 * 通过@MapperScannerConfigurer扫描目录中的所有接口, 动态在Spring Context中生成实现.
 * 方法名称必须与Mapper.xml中保持一致.
 * 
 * @author peter
 */
@MyBatisRepository
public interface MembershipApply2Dao {

	MembershipApply2 getById(Long id);

	List<MembershipApply2> getAll();

	void save(MembershipApply2 membershipApply2);

	void update(MembershipApply2 membershipApply2);

	/**
	 * 软删除
	 */
	void delete(Long id);

}
