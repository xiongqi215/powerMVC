package cn.com.powermvc.service.imp;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import cn.com.powermvc.bo.UserInfo;
import cn.com.powermvc.common.ext.mybatis.Page;
import cn.com.powermvc.service.VipManageService;
@Service("VipManageService")
public class ImpVipManageService implements VipManageService{

	@Resource
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<UserInfo> getVipsInfo() {
		// TODO Auto-generated method stub
		List<UserInfo> list =sqlSessionTemplate.selectList("sqlmapper.VipMapper.getVipsResultSet");
		return list==null?new ArrayList<UserInfo>():list;
	}

	//@Override
	/*public Page<UserInfo> getVipsPages(Page<UserInfo> pages) {
		// TODO Auto-generated method stub
		List<UserInfo> list =sqlSessionTemplate.selectList("sqlmapper.VipMapper.getVipsResultSet");
		pages.setResult(list);
		pages.setTotalCount(list.size());
		return pages;
	}*/
	
	

}
