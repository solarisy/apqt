package com.wismay.apqt.comm;

/**
 * 代理审核状态 0：未审核；1：审核通过；2：审核不通过。
 * 
 * @author Peter
 *         2014-10-16
 */
public class AuditStatus {
	/**
	 * 未审核
	 */
	public static final Long NONE = 0L;

	/**
	 * 审核通过
	 */
	public static final Long PASS = 1L;

	/**
	 * 审核不通过
	 */
	public static final Long NOT_PASS = 2L;
}
