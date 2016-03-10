package cn.com.powermvc.service;

import java.util.List;
import java.util.Map;

import cn.com.powermvc.bo.RoleInfo;
import cn.com.powermvc.common.ext.mybatis.Page;
import cn.com.powermvc.common.ui.TreeNode;

public interface RoleService {

	/**
	 * 角色列表，可分页
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public Page<RoleInfo> getRoleList(Page<RoleInfo> page)
			throws Exception;
	
	/**
	 * 角色列表，可分页，可根据角色名称查询
	 * @param page
	 * @param roleName
	 * @return
	 * @throws Exception
	 */
	public Page<RoleInfo> getRoleList(Page<RoleInfo> page,String roleName)
			throws Exception;
	/**
	 * 根据主键查询单个角色对象
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public RoleInfo selectByPrimaryKey(Long id) throws Exception;
    
    /**
     * 新增角色
     * @param map
     * @return
     * @throws Exception
     */
    public int insert(Map<String,Object> map) throws Exception;
    /**
     * 修改角色
     * @param map
     * @return
     * @throws Exception
     */
    public int update(Map<String,Object> map)throws Exception;
    /**
     * 删除角色
     * @param map
     * @return
     * @throws Exception
     */
    public int delete(Map<String,Object> map) throws Exception;
}