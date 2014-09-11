package com.wismay.apqt.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.wismay.apqt.entity.Company;

/**
 * 通过@MapperScannerConfigurer扫描目录中的所有接口, 动态在Spring Context中生成实现.
 * 方法名称必须与Mapper.xml中保持一致.
 * 
 * @author peter
 */
@MyBatisRepository
public interface CompanyDao {

	Company getById(Long id);

	List<Company> getAll();

	List<Company> search(@Param("company") Company company);

	List<Company> searchByCertcode(String certcode);

	/**
	 * 分页查询
	 * 
	 * @param overtime
	 * @param pageStart
	 * @param pageSize
	 * @return
	 */
	List<Company> searchPage(@Param("company") Company company, @Param("pageStart") int pageStart, @Param("pageSize") int pageSize);

	/**
	 * 分页查询总记录数
	 * 
	 * @param overtime
	 * @return
	 */
	Long searchCount(Company company);

	void save(Company company);

	void update(Company company);

	/**
	 * 软删除
	 */
	void delete(Long id);

}
