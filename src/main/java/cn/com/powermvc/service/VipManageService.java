package cn.com.powermvc.service;

import java.util.List;

import cn.com.powermvc.bo.UserInfo;
import cn.com.powermvc.common.ext.mybatis.Page;

public interface VipManageService {
	//查询会员信息
	public List<UserInfo> getVipsInfo();
	//public Page<UserInfo> getVipsPages(Page<UserInfo> pages);
}
