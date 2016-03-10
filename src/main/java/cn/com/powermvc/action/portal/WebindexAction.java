package cn.com.powermvc.action.portal;

import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import cn.com.powermvc.bo.UserInfo;
import cn.com.powermvc.common.Publish;
import cn.com.powermvc.common.exception.BusinessCheckException;
import cn.com.powermvc.common.util.Encrypt;
import cn.com.powermvc.service.LoginService;

/**
 * 前台入口
 * @author 熊颀
 *2015年12月28日 下午2:18:18
 */
@Controller
@RequestMapping("/portal")
public class WebindexAction {
   
	@Resource
	private LoginService loginService;
    
    /**
     * 前台页面入口
     * @param request
     * @param session
     * @param langType
     * @return
     * @throws Exception
     */
	@RequestMapping
	public String init(HttpServletRequest request,HttpSession session,@RequestParam(value="langType", defaultValue="zh") String langType) throws Exception{
		//语言判断
		 if(langType.equals("zh")){
             Locale locale = new Locale("zh", "CN"); 
             request.getSession().setAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME,locale); 
         }
         else if(langType.equals("en")){
             Locale locale = new Locale("en", "US"); 
             request.getSession().setAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME,locale);
         }
         else {
             request.getSession().setAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME,LocaleContextHolder.getLocale());
	}
		return "home/webIndex";
	}
	
	     /**
	      * 前台登录
	      * @param userName
	      * @param password
	      * @param session
	      * @return
	      * @throws Exception
	      */
	    @ResponseBody 
	    @RequestMapping("/login")
	    public UserInfo login(String userName,String password,HttpSession session) throws Exception{
	    	UserInfo user=loginService.protalLogin(userName, Encrypt.e(password));
	    	if(user==null){
	    		throw new BusinessCheckException("loginFaile", null);
	    	}
	       session.setAttribute(Publish.SESSION_USER, user);
			return user;
	    }
	    
	    /**
	     * 前台登出
	     */
	    @RequestMapping("/loginout")
	    public String loginout(HttpSession session) throws Exception{
	    	
	       session.removeAttribute(Publish.SESSION_USER);
			return "redirect:/portal.do";
	    }
}
