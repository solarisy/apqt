package com.wismay.apqt.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import com.wismay.apqt.comm.MyPage;
import com.wismay.apqt.entity.${class.name};
import com.wismay.apqt.repository.${class.name}Dao;

/**
 * 
 * 
 * @author Peter
 */
// Spring Service Bean的标识.
@Component
public class ${class.name}Service {

	private static Logger logger = LoggerFactory.getLogger(${class.name}Service.class);

	@Autowired
	private ${class.name}Dao ${class.name?uncap_first}Dao;

	public ${class.name} getById(Long id) {
		return ${class.name?uncap_first}Dao.getById(id);
	}

	public List<${class.name}> getAll() {
		return ${class.name?uncap_first}Dao.getAll();
	}

	/**
	 * 分页查询
	 * 
	 * @param overtime
	 * @param pageStart
	 * @param pageSize
	 * @return
	 */
	public MyPage<${class.name}> searchPage(${class.name} ${class.name?uncap_first}, int currentPage, int pageSize) {
		MyPage<${class.name}> myPage = new MyPage<${class.name}>();

		Long count = ${class.name?uncap_first}Dao.searchCount(${class.name?uncap_first});

		int pageStart = (currentPage - 1) < 0 ? 0 : (currentPage - 1) * pageSize;
		List<${class.name}> list = ${class.name?uncap_first}Dao.searchPage(${class.name?uncap_first}, pageStart, pageSize);

		myPage.setCount(count);
		myPage.setContent(list);

		return myPage;
	}

	public void save(${class.name} ${class.name?uncap_first}) {
		${class.name?uncap_first}Dao.save(${class.name?uncap_first});
	}

	public void update(${class.name} ${class.name?uncap_first}) {
		${class.name?uncap_first}Dao.update(${class.name?uncap_first});
	}

	/**
	 * 软删除
	 */
	public void delete(Long id) {
		${class.name?uncap_first}Dao.delete(id);
	}
}
