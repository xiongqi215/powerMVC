package cn.com.powermvc.service.imp;


import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.com.powermvc.bo.OrganInfo;
import cn.com.powermvc.common.Publish;
import cn.com.powermvc.common.ext.mybatis.Page;
import cn.com.powermvc.common.ext.mybatis.SqlSessionClient;
import cn.com.powermvc.service.OrganService;

@Service("OrganService")
public class ImpOrganService implements OrganService {
	
	@Resource
	private SqlSessionClient sqlSessionClient;
	
	/**
	 * 查询所有机构信息
	 * @return
	 * @throws Exception
	 */
	@Override
	public Page<OrganInfo>  getAllOrgan(Page<OrganInfo> page) throws Exception {
		return (Page<OrganInfo>) sqlSessionClient.selectPage(page,"organ.organList", Publish.NORMAL);
	}

	/**
	 * 根据ID查询机构信息
	 */
	public OrganInfo getOrganById(Long organId) throws Exception {
		 Map<String,Object> params=new HashMap<String,Object>();
		 params.put("id", organId);
		 params.put("isDelete", Publish.NORMAL);
		return sqlSessionClient.selectOne("organ.getOrganById",params);
	}
}
