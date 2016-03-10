package cn.com.powermvc.service;


import cn.com.powermvc.bo.OrganInfo;
import cn.com.powermvc.common.ext.mybatis.Page;

public interface OrganService {
  
	/**
	 * 查询所有机构信息
	 * @return
	 * @throws Exception
	 */
	public Page<OrganInfo>  getAllOrgan(Page<OrganInfo> page) throws Exception;
	
	
	/**
	 * 通过Id查询机构信息
	 * @return
	 * @throws Exception
	 */
	public OrganInfo getOrganById(Long organId) throws Exception;
}
