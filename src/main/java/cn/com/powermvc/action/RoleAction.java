package cn.com.powermvc.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.com.powermvc.bo.RoleInfo;
import cn.com.powermvc.bo.UserInfo;
import cn.com.powermvc.common.Message;
import cn.com.powermvc.common.Publish;
import cn.com.powermvc.common.ext.mybatis.Page;
import cn.com.powermvc.common.ui.Datagrid;
import cn.com.powermvc.common.ui.TreeNode;
import cn.com.powermvc.common.util.CommonUtil;
import cn.com.powermvc.service.FunctionService;
import cn.com.powermvc.service.RoleService;

@Controller
@RequestMapping("/role")
public class RoleAction  {

	//注入角色资源
	@Resource
	private RoleService roleService;
	//注入菜单资源
	@Resource
	private FunctionService funService;

	@RequestMapping()
	public String init() throws Exception{
		
		return "management/systemmanage/role";
	}

	private Datagrid<RoleInfo> roleInfoGrid; //角色列表数据datagrid
	
	public Datagrid<RoleInfo> getRoleInfoGrid() {
		return roleInfoGrid;
	}

	public void setRoleInfoGrid(Datagrid<RoleInfo> roleInfoGrid) {
		this.roleInfoGrid = roleInfoGrid;
	}
	
	@ModelAttribute
	public void setUser(HttpSession session,Model model){
		UserInfo sessionUser=(UserInfo) session.getAttribute(Publish.SESSION_USER);
		model.addAttribute("sessionUser", sessionUser);
//		return sessionUser;
	}
	

	/**
	 * 
	 *操作日期:2016年1月5日 下午5:12:42
	 *操作类型:新增
	 *操作人员:黄燕
	 *操作描述:获取角色列表，以分页形式展示 
	 *@param rows 前端DATAGRID的pagesize参数
	 *@param page 前端DATAGRID的pageno参数
	 *@param sessionUser 当前用户
	 *@param request 请求对象
	 *@return
	 *@throws Exception
	 */
	@ResponseBody
	@RequestMapping("/ObjList")
	public Datagrid<RoleInfo> ObjList(int rows, int page,UserInfo sessionUser,HttpServletRequest request) throws Exception{
		Page<RoleInfo> pageObj=new Page<RoleInfo>();
		pageObj.setPageNo(page);
		pageObj.setPageSize(rows);
		String roleName = request.getParameter("roleName");
		if(null !=roleName && "" != roleName){
			pageObj=this.roleService.getRoleList(pageObj,roleName);
		}
		else{
			pageObj=this.roleService.getRoleList(pageObj);
		}
		
		this.roleInfoGrid=new Datagrid<RoleInfo>(pageObj.getTotalCount(),pageObj.getResult());
		return roleInfoGrid;
	}
	
	/**
	 *操作日期:2016年1月5日 下午5:05:31
	 *操作类型:修改
	 *操作人员:游岚
	 *操作描述:通过存储过程的方式实现，新增、修改角色
	 * 
	 *操作日期:2016年1月3日 下午5:05:31
	 *操作类型:新增
	 *操作人员:黄燕
	 *操作描述:新增、修改角色
	 *@param role 角色对象 
	 *@param session 会话对象
	 *@param request 请求对象
	 *@return
	 *@throws Exception
	 */
	@ResponseBody
	@RequestMapping("/SaveObj")
	public Message SaveObj(RoleInfo role,HttpSession session,HttpServletRequest request) throws Exception{
		UserInfo sessionUser=(UserInfo) session.getAttribute(Publish.SESSION_USER);
		role.setCreateUser(sessionUser.getUserName());
		role.setUpdateUser(sessionUser.getUserName());
		String operateType = request.getParameter("operateType");
		String funIds = request.getParameter("funIds");
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("funIds", funIds);
		if(role.getId()==null){
			role.setIsDelete(Publish.DATA_STATUS_NORMAL);
			map.put("role", role);
			map.put("operateType", "insert");
			this.roleService.insert(map);
		}
		else{
			map.put("role", role);
			map.put("operateType", "update");
			this.roleService.update(map);
		}
		return Message.successMsg();
	}
	
	/**
	 *操作日期:2016年1月5日 下午5:05:31
	 *操作类型:修改
	 *操作人员:游岚
	 *操作描述:通过存储过程的方式，单个删除角色
	 * 
	 *操作日期:2016年1月3日 下午5:05:31
	 *操作类型:新增
	 *操作人员:黄燕
	 *操作描述:单个删除角色 
	 *@param session 会话对象
	 *@param request 请求对象
	 *@return
	 *@throws Exception
	 */
	@ResponseBody
	@RequestMapping("/DeleteObj")
	public Message DeleteObj(HttpSession session,HttpServletRequest request) throws Exception{
		String objId = request.getParameter("objId");
		UserInfo sessionUser=(UserInfo) session.getAttribute(Publish.SESSION_USER);
		RoleInfo role = new RoleInfo();
		role.setUpdateUser(sessionUser.getUpdateUser());
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("role", role);
		map.put("objId", objId);
		map.put("operateType", "delete");
		this.roleService.delete(map);
		return Message.successMsg();
	}
	
	/**
	 * 
	 *操作日期:2016年1月5日 下午5:04:30
	 *操作类型:新增
	 *操作人员:黄燕
	 *操作描述:批量删除角色 
	 *@param session
	 *@param request
	 *@return
	 *@throws Exception
	 */
	@ResponseBody
	@RequestMapping("/BatchDeleteObj")
	public Message BatchDeleteObj(HttpSession session,HttpServletRequest request) throws Exception{
		UserInfo sessionUser=(UserInfo) session.getAttribute(Publish.SESSION_USER);
		RoleInfo role = new RoleInfo();
		role.setUpdateUser(sessionUser.getUpdateUser());
		String objIdStr = request.getParameter("objIdStr");
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("role", role);
		map.put("objId", objIdStr);
		map.put("operateType", "delete");
		this.roleService.delete(map);
		return Message.successMsg();
	}
	
	/**
	 * 
	 *操作日期:2016年1月5日 下午5:03:45
	 *操作类型:新增
	 *操作人员:黄燕
	 *操作描述:根据主键ID查询对象 
	 *@param session 会话对象
	 *@param request 请求对象
	 *@return
	 *@throws Exception
	 */
	@RequestMapping("/ObjInput")	
	public ModelAndView ObjInput(HttpSession session,HttpServletRequest request) throws Exception{
		ModelAndView modelView=new ModelAndView();
		modelView.setViewName("management/systemmanage/role-input");
		RoleInfo role = null;
		String objId = request.getParameter("objId");
		String operateType = request.getParameter("operateType");
		//角色的所拥有菜单
		if(!CommonUtil.isNullOrEmpty(objId)){
			
		}
		if(operateType.equals(Publish.OPERATETYPE_MODIFY)){
			role = this.roleService.selectByPrimaryKey(Long.parseLong(objId));
		}
		modelView.addObject("role", role);
		return modelView;
	}
	/**
	 * 
	 *操作日期:2016年1月5日 下午5:03:13
	 *操作类型:新增
	 *操作人员:游岚
	 *操作描述:获得角色所拥有的菜单 
	 *@param request 请求对象
	 *@return
	 *@throws Exception
	 */
	@ResponseBody
	@RequestMapping("/funInfoTree")	
	public List<TreeNode> functionInfoTree(HttpServletRequest request) throws Exception{
		List<TreeNode> tree= new ArrayList<TreeNode>();
		String id = request.getParameter("roleId");
		Long roleId = null;
		if(!CommonUtil.isNullOrEmpty(id)){
			roleId = Long.parseLong(id);
		}
		//tree = roleService.selectFunctionInfoList(roleId);
		tree = funService.selectFunctionInfoList(roleId);
		return tree;
	}

}
