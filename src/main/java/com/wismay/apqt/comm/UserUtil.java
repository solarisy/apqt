package com.wismay.apqt.comm;

import org.apache.shiro.SecurityUtils;

import com.wismay.apqt.service.account.ShiroDbRealm.ShiroUser;

public class UserUtil {

	public static ShiroUser getCurrentUser() {
		ShiroUser user = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
		return user;
	}

}
