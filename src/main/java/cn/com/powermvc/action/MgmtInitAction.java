package cn.com.powermvc.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.com.powermvc.bo.UserInfo;
import cn.com.powermvc.common.Message;
import cn.com.powermvc.common.Publish;
import cn.com.powermvc.common.exception.BusinessCheckException;
import cn.com.powermvc.common.ui.TreeNode;
import cn.com.powermvc.service.FunctionService;
import cn.com.powermvc.service.LoginService;

/**
 * 管理端初始化Action
 * @author 熊颀
 *2015年12月21日 下午3:29:01
 */

@Controller
@RequestMapping("/mgmt")
public class MgmtInitAction {
	
	 @Resource
     private LoginService loginService;
	 
	 @Resource
	 private FunctionService functionService;
	 /**
	  * 登入页面
	  * @return
	  */
	@RequestMapping
	public String init() {
		return "management/login";
	}
	
	/**
	 * 首页
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/index")
	public String index(HttpSession session) throws Exception {
		
		UserInfo user=(UserInfo) session.getAttribute(Publish.SESSION_USER);
		if(user==null){
    		return "redirect:/mgmt.do";
    	}
		
		return "management/index";
	}
	
	/**
	 * 后台登录
	 * @param loginName
	 * @param password
	 * @param session
	 * @return
	 * @throws Exception
	 */
    @ResponseBody
	@RequestMapping("/login")
	public Message login(String loginName,String password,HttpSession session) throws Exception{
		UserInfo user=loginService.LoginMgmt(loginName, password);
		if(user==null){
    		throw new BusinessCheckException("loginFaile", null);
    	}
		session.setAttribute(Publish.SESSION_USER, user);
		return Message.successMsg();
	}
    
    
     /**
      * 初始化菜单
      * @param loginName
      * @param password
      * @param session
      * @return
      * @throws Exception
      */
    @ResponseBody
    @RequestMapping("/initMenu")
    public List<TreeNode> initMenu(HttpSession session) throws Exception{
    	UserInfo user=(UserInfo) session.getAttribute(Publish.SESSION_USER);
    	List<TreeNode> funTree=this.functionService.buildMgmtFunTree(user);
		
		return funTree;
	}
    
    /**
     * 注销
     * @return
     */
    @RequestMapping("/logout")
    public String logout(HttpSession session){
    	 session.removeAttribute(Publish.SESSION_USER);
    	 return "redirect:/mgmt.do";
    }
}
