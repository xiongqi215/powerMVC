package cn.com.powermvc.service;

import cn.com.powermvc.bo.UserInfo;

import cn.com.powermvc.bo.Member;

public interface LoginService {

	/**
	 * 前台会员登录
	 * @return
	 * @throws Exception
	 */
	public UserInfo protalLogin(String loginName,String pwd) throws Exception;
	
	/**
	 * 后台用户登录
	 * @return
	 * @throws Exception
	 */
	public UserInfo LoginMgmt(String loginName,String pwd) throws Exception;
}
