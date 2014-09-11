[#ftl] 
package com.wismay.apqt.repository;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.wismay.apqt.entity.${class.name};

/**
 * 通过@MapperScannerConfigurer扫描目录中的所有接口, 动态在Spring Context中生成实现.
 * 方法名称必须与Mapper.xml中保持一致.
 * 
 * @author peter
 */
@MyBatisRepository
public interface ${class.name}Dao {
	
	${class.name} getById(Long id);
	
	List<${class.name}> getAll();
	
	/**
	 * 分页查询
	 * @param overtime
	 * @param pageStart
	 * @param pageSize
	 * @return
	 */
	List<${class.name}> searchPage(@Param("${class.name?uncap_first}")${class.name} ${class.name?uncap_first},@Param("pageStart")int pageStart,@Param("pageSize")int pageSize);
	
	/**
	 * 分页查询总记录数
	 * @param overtime
	 * @return
	 */
	Long searchCount(${class.name} ${class.name?uncap_first});
	
	void save(${class.name} ${class.name?uncap_first});
	
	void update(${class.name} ${class.name?uncap_first});
	
	/**
	 * 软删除
	 */
	void delete(Long id);
	

}
