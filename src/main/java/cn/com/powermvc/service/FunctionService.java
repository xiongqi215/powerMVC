package cn.com.powermvc.service;

import java.util.List;

import cn.com.powermvc.bo.FunctionInfo;
import cn.com.powermvc.bo.UserInfo;
import cn.com.powermvc.common.ui.TreeNode;

public interface FunctionService {

	/**
	 * 通过角色查询菜单资源
	 * @param roleId
	 * @return
	 */
	public abstract List<FunctionInfo> getFunctionByRole(Long roleId,String type)
			throws Exception;

	/**
	 * 加构建后台菜单树
	 * @return
	 * @throws Exception
	 */
	public abstract List<TreeNode> buildMgmtFunTree(UserInfo user)
			throws Exception;
    
	/**
	 *查询所有菜单
	 * @return
	 * @throws Exception
	 */
	public abstract List<FunctionInfo> getAllFunction(String type)throws Exception;
	
	/**
	 * 
	 *操作日期:2016年1月5日 下午3:32:53
	 *操作类型:新增
	 *操作人员:游岚
	 *操作描述:获取角色所拥有菜单的接口 
	 *@param roleId
	 *@return
	 *@throws Exception
	 */
	public List<TreeNode> selectFunctionInfoList(Long roleId) throws Exception;

}