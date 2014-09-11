package com.wismay.apqt.comm;

import java.util.HashMap;
import java.util.Map;

/**
 * 定义角色
 * 
 * @author Wang Peng
 *         2014-9-1
 */
public class Role {
	private static Map<String, String> roleMap;
	static {
		roleMap = new HashMap<String, String>();
		roleMap.put(Role.system_admin, Role.system_admin_name);
		roleMap.put(Role.super_admin, Role.super_admin_name);
		roleMap.put(Role.plantform_admin, Role.plantform_admin_name);
		roleMap.put(Role.proxy_admin, Role.proxy_admin_name);
		roleMap.put(Role.proxy_user, Role.proxy_user_name);

	}

	public static String getRoleName(String roleCode) {
		return roleMap.get(roleCode);
	}

	/**
	 * 系统管理员，该角色不对用户开发，仅仅针对系统维护人员开放
	 */
	public static final String system_admin = "system_admin";
	public static final String system_admin_name = "系统管理员";

	/**
	 * 超级管理员
	 */
	public static final String super_admin = "super_admin";
	public static final String super_admin_name = "超级管理员";

	/**
	 * 平台管理员
	 */
	public static final String plantform_admin = "plantform_admin";
	public static final String plantform_admin_name = "平台管理员";

	/**
	 * 代理管理员
	 */
	public static final String proxy_admin = "proxy_admin";
	public static final String proxy_admin_name = "代理管理员";

	/**
	 * 代理用户
	 */
	public static final String proxy_user = "proxy_user";
	public static final String proxy_user_name = "代理用户";

}
