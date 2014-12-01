package com.wismay.apqt.repository;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.wismay.apqt.entity.MembershipApply;

/**
 * 通过@MapperScannerConfigurer扫描目录中的所有接口, 动态在Spring Context中生成实现.
 * 方法名称必须与Mapper.xml中保持一致.
 * 
 * @author peter
 */
@MyBatisRepository
public interface MembershipApplyDao {
	
	MembershipApply getById(Long id);
	
	List<MembershipApply> getAll();
	
	/**
	 * 分页查询
	 * @param overtime
	 * @param pageStart
	 * @param pageSize
	 * @return
	 */
	List<MembershipApply> searchPage(@Param("membershipApply")MembershipApply membershipApply,@Param("pageStart")int pageStart,@Param("pageSize")int pageSize);
	
	/**
	 * 分页查询总记录数
	 * @param overtime
	 * @return
	 */
	Long searchCount(MembershipApply membershipApply);
	
	void save(MembershipApply membershipApply);
	
	void update(MembershipApply membershipApply);
	
	/**
	 * 软删除
	 */
	void delete(Long id);
	

}
