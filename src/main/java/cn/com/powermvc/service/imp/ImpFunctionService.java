package cn.com.powermvc.service.imp;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import cn.com.powermvc.bo.FunctionInfo;
import cn.com.powermvc.bo.RoleInfo;
import cn.com.powermvc.bo.UserInfo;
import cn.com.powermvc.common.Publish;
import cn.com.powermvc.common.ext.mybatis.SqlSessionClient;
import cn.com.powermvc.common.ui.TreeNode;
import cn.com.powermvc.common.util.CommonUtil;
import cn.com.powermvc.service.FunctionService;


/**
 * 菜单资源服务层
 * @author 熊颀
 *2015年12月22日 上午11:15:43
 */
@Service("functionService")
public class ImpFunctionService implements FunctionService {
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Resource
	private SqlSessionClient sqlSessionClient;
	
	/**
	 * 通过角色查询菜单资源
	 * @param roleId
	 * @return
	 */
	@Override
	public List<FunctionInfo> getFunctionByRole(Long roleId,String type) throws Exception{
		Map<String, Object> params=new HashMap<String, Object>();
		 params.put("roleId",roleId);
		 params.put("is_delete", Publish.NORMAL);
		 params.put("funType", type);
		List<FunctionInfo> list=sqlSessionTemplate.selectList("mgmt.loadFunByRoleId", params);
		return list;
		
	}
	
	/**
	 * 构建后台菜单树
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<TreeNode> buildMgmtFunTree(UserInfo user)throws Exception{
		List<FunctionInfo> list=null;
		if(user==null){
			return null;
		}
		//判断是否是超级管理员,超级管理员加载所有后台菜单
		if(user.getUserType().equals(Publish.ADMIN_USER)){
			list=this.getAllFunction(Publish.FUN_TYPE_MGMT);
		}else{
			if(user.getRoleInfo()==null){
				return null;
			}
			//普通用户按角色加载菜单
			RoleInfo role=user.getRoleInfo();
			 list=this.getFunctionByRole(role.getId(),Publish.FUN_TYPE_MGMT);
			
		}
		return buildFunctionTree(list,null);
	}
	
	
	
	/**
	 *查询所有菜单
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<FunctionInfo> getAllFunction(String type) throws Exception {
		 Map<String,Object> params=new HashMap<String,Object>();
		 params.put("funType", type);
		 params.put("is_delete", Publish.NORMAL);
		List<FunctionInfo> list=sqlSessionTemplate.selectList("mgmt.getAllFunction", params);
		return list;
	}
	
	

	/**
	 * 组装菜单树(递归)
	 * @param parentId
	 * @return
	 */
	public List<TreeNode>  buildFunctionTree(List<FunctionInfo> functionList,Long parentId){
		//获取顶级菜单
		List<TreeNode> treeNodes = new ArrayList<TreeNode>();
		//获取指定父级ID的菜单
		List<FunctionInfo> parentList = getFuntionByParentId(functionList,parentId);
		for (int i = 0; i < parentList.size(); i++) {
			FunctionInfo function = parentList.get(i);
			//如果菜单逻辑删除，则跳过
			if(Publish.LOGICDELETE.equals(function.getIsDelete())){
				continue;
			}
			//使用菜单数据构建treeNode对象
			TreeNode treeNode = new TreeNode(function.getId() + "",function.getFunNameCh());
			Map<String, Object> attributes = new HashMap<String, Object>();
			attributes.put("url", function.getUrl());  //action url
			attributes.put("id", function.getId());   //ID
			treeNode.setAttributes(attributes);
			treeNodes.add(treeNode);
           //递归调用，获取当前菜单的子菜单
			List<TreeNode> subTreeNodes = buildFunctionTree(functionList,function.getId());
			if (subTreeNodes != null && subTreeNodes.size() != 0) {
				treeNode.setChildren(subTreeNodes);
				
			}

		}
		return treeNodes;
	}
/**
 * 根据父级菜单ID查询子菜单，返回子菜单list
 * @param id
 * @return
 */
	public List<FunctionInfo> getFuntionByParentId(List<FunctionInfo> parent,Long id){
		if(id==null){
			id=new Long("0");
		}
		List<FunctionInfo> list=new ArrayList<FunctionInfo>();
		for(FunctionInfo function : parent){
			//如果父级ID等于参数ID，
			if(id.equals(function.getParentId())){
				list.add(function);
			}
		}
		return list;
	}

	/**
	 * 
	 *操作日期:2016年1月5日 下午3:03:30
	 *操作类型:新增
	 *操作人员:游岚
	 *操作描述:递归调用，生成combotree的菜单数据
	 * 例如：父级菜单-系统管理，子级菜单-角色管理、用户管理、机构管理
	 * 角色A，拥有菜单为系统管理，角色管理，用户管理
	 * combotree中父级菜单一旦勾中，所有子级菜单（包括机构管理）都会被勾中，如下图右边所示
	 * 所以生成的combotree的数据时，系统管理不能勾选，即checked为false。
	 * 但easyui展示时，已勾中子菜单，则会自动勾选父级菜单
	 *  ■系统管理               √系统管理
	 *       √角色管理                 √角色管理
	 *       √用户管理                 √用户管理
	 *         机构管理                 √机构管理 
	 *   
	 *@param allFunList 所有的菜单
	 *@param functionList 选中的菜单
	 *@param parentId 父级菜单ID
	 *@return
	 */
	public List<TreeNode>  buildFunctionTree(List<FunctionInfo> allFunList,
			List<FunctionInfo> functionList,Long parentId){
		//获取顶级菜单
		List<TreeNode> treeNodes = new ArrayList<TreeNode>();
		//获取指定父级ID的菜单
		List<FunctionInfo> parentList = getFuntionByParentId(allFunList,parentId);
		for (int i = 0; i < parentList.size(); i++) {
			FunctionInfo function = parentList.get(i);
			//如果菜单逻辑删除，则跳过
			if(Publish.LOGICDELETE.equals(function.getIsDelete())){
				continue;
			}
			//使用菜单数据构建treeNode对象
			TreeNode treeNode = new TreeNode(function.getId() + "",function.getFunNameCh());
			Map<String, Object> attributes = new HashMap<String, Object>();
			attributes.put("url", function.getUrl());  //action url
			attributes.put("id", function.getId());   //ID
			treeNode.setAttributes(attributes);
			treeNodes.add(treeNode);
           //递归调用，获取当前菜单的子菜单
			List<TreeNode> subTreeNodes = buildFunctionTree(allFunList,functionList,function.getId());
			if (subTreeNodes != null && subTreeNodes.size() != 0) {
				treeNode.setChildren(subTreeNodes);
				
			}
			//判断叶子节点是否需要勾选
			if(treeNode.getChildren() == null || treeNode.getChildren().size() == 0){
				if(this.isChecked(functionList, function.getId())){
					treeNode.setChecked(true);
				}
			}

		}
		return treeNodes;
	}
	
	/**
	 * 
	 *操作日期:2016年1月5日 下午3:05:33
	 *操作类型:新增
	 *操作人员:游岚
	 *操作描述:判断集合中list中是否该菜单 
	 *@param list  菜单集合
	 *@param funId 菜单ID
	 *@return
	 */
	public boolean isChecked(List<FunctionInfo> list,Long funId){
		for(int i=0;i<list.size();i++){
			if(list.get(i).getId().longValue()==funId.longValue()){
				return true;
			}
		}
		
		return false;
		
	}
	/**
	 * 
	 *操作日期:2016年1月5日 下午3:34:32
	 *操作类型:新增
	 *操作人员:游岚
	 *操作描述:获取角色所拥有菜单 
	 *@param roleId
	 *@return
	 *@throws Exception
	 */
	@Override
	public List<TreeNode> selectFunctionInfoList(Long roleId) throws Exception {
		// TODO Auto-generated method stub
		Map<String,Object> params = new HashMap<String,Object>();
		params.put("roleId", roleId);
		//查询出该角色下的所有菜单 
		List<FunctionInfo> list = this.sqlSessionClient.selectList("Function.functionList", params);
		//查询出所有菜单
		List<FunctionInfo> allFunList = this.sqlSessionClient.selectList("Function.allFunctionList");
		if(CommonUtil.isNullOrEmpty(roleId)){
			return this.buildFunctionTree(allFunList,new ArrayList<FunctionInfo>(),null);
		}
		List<TreeNode> tree = this.buildFunctionTree(allFunList,list,null);
		
		return tree;
	}
}
