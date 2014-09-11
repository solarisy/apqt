package com.wismay.apqt.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.wismay.apqt.entity.Personal;

/**
 * 通过@MapperScannerConfigurer扫描目录中的所有接口, 动态在Spring Context中生成实现.
 * 方法名称必须与Mapper.xml中保持一致.
 * 
 * @author peter
 */
@MyBatisRepository
public interface PersonalDao {

	Personal getById(Long id);

	List<Personal> getAll();

	/**
	 * 分页查询
	 * 
	 * @param overtime
	 * @param pageStart
	 * @param pageSize
	 * @return
	 */
	List<Personal> searchPage(@Param("personal") Personal personal, @Param("pageStart") int pageStart, @Param("pageSize") int pageSize);

	/**
	 * 分页查询总记录数
	 * 
	 * @param overtime
	 * @return
	 */
	Long searchCount(Personal personal);

	void save(Personal personal);

	void update(Personal personal);

	/**
	 * 软删除
	 */
	void delete(Long id);

	List<Personal> search(@Param("personal") Personal personal);

}
