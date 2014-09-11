package com.wismay.apqt.comm;

import java.util.List;

public class MyPage<T> {

	private List<T> content;// 内容

	private Long pageSize;// 每页多少条数据

	private Long count;// 总记录数

	private Long currentPage;// 当前第几页

	public void setContent(List<T> content) {
		this.content = content;
	}

	public List<T> getContent() {
		return this.content;
	}

	public Long getPageSize() {
		return pageSize;
	}

	public void setPageSize(Long pageSize) {
		this.pageSize = pageSize;
	}

	public Long getCount() {
		return count;
	}

	public void setCount(Long count) {
		this.count = count;
	}

	public Long getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(Long currentPage) {
		this.currentPage = currentPage;
	}

}
