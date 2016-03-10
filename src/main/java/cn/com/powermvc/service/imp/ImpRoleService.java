package cn.com.powermvc.service.imp;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.enterprise.context.RequestScoped;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.com.powermvc.bo.FunctionInfo;
import cn.com.powermvc.bo.RoleInfo;
import cn.com.powermvc.common.Publish;
import cn.com.powermvc.common.ext.mybatis.Page;
import cn.com.powermvc.common.ext.mybatis.SqlSessionClient;
import cn.com.powermvc.common.ui.TreeNode;
import cn.com.powermvc.common.util.CommonUtil;
import cn.com.powermvc.service.RoleService;


@Service("RoleService")
public class ImpRoleService implements RoleService {
    
	//注入sqlSession
	@Resource
	private SqlSessionClient sqlSessionClient;

	/**
	 * 
	 *操作日期:2016年1月5日 下午5:01:42
	 *操作类型:新增
	 *操作人员:黄燕
	 *操作描述:角色列表，可分页 
	 *@param page 分页对象
	 *@return
	 *@throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public Page<RoleInfo> getRoleList(Page<RoleInfo> page) throws Exception{
		if(page!=null){
			Map<String,Object> params = new HashMap<String,Object>();
			params.put("dataStatus", Publish.DATA_STATUS_NORMAL);
			Page<RoleInfo> replayPage = (Page<RoleInfo>) sqlSessionClient.selectPage(page,"Role.roleList", params);
			replayPage.setCallReply(Publish.CALLREPLY_SUCCESS);
			return replayPage; 
		}
		else{
			return null;
		}
	}
	/**
	 * 
	 *操作日期:2016年1月5日 下午5:00:52
	 *操作类型:新增
	 *操作人员:黄燕
	 *操作描述:角色列表，可分页，可根据角色名称查询 
	 *@param page 分页对象
	 *@param roleName 角色名称
	 *@return
	 *@throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public Page<RoleInfo> getRoleList(Page<RoleInfo> page, String roleName)
			throws Exception {
		// TODO Auto-generated method stub
		if(page!=null && roleName != null && roleName != ""){
			Map<String,Object> params = new HashMap<String,Object>();
			params.put("roleName", roleName);
			params.put("dataStatus", Publish.DATA_STATUS_NORMAL);
			return (Page<RoleInfo>) sqlSessionClient.selectPage(page,"Role.roleList",params);
		}
		else{
			return null;
		}
	}
	/**
	 * 
	 *操作日期:2016年1月5日 下午5:00:00
	 *操作类型:新增
	 *操作人员:黄燕
	 *操作描述:根据主键查询单个角色对象
	 *@param id 角色主键ID
	 *@return
	 */
    public RoleInfo selectByPrimaryKey(Long id){
    	return this.sqlSessionClient.selectOne("Role.selectByPrimaryKey", id);
    }

	/**
	 * 
	 *操作日期:2016年1月5日 下午4:59:05
	 *操作类型:新增
	 *操作人员:游岚
	 *操作描述:新增角色 
	 *@param map 用于存入参数
	 *@return
	 *@throws Exception
	 */
	@Override
	public int insert(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		int state = this.sqlSessionClient.insert("Role.insertRole", map);
		String message = (String) map.get("message");
		return state;
	}
	/**
	 * 
	 *操作日期:2016年1月5日 下午4:58:03
	 *操作类型:增加
	 *操作人员:游岚
	 *操作描述:修改角色 
	 *@param map 用于存入参数
	 *@return
	 *@throws Exception
	 */
	@Override
	public int update(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		int state = this.sqlSessionClient.update("Role.updateRole",map);
		String message = (String) map.get("message");
		return state;
	}
	/**
	 * 
	 *操作日期:2016年1月5日 下午4:56:34
	 *操作类型:新增
	 *操作人员:游岚
	 *操作描述:单个或批量删除角色 
	 *@param map 用于存放参数
	 *@return
	 *@throws Exception
	 */
	@Override
	public int delete(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		int state = this.sqlSessionClient.delete("Role.deleteRole",map);
		String message = (String) map.get("message");
		return state;
	}

	
	
}
