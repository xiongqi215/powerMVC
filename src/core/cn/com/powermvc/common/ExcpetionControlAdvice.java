package cn.com.powermvc.common;

import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import cn.com.powermvc.common.exception.BasicException;

/**
 * 异常统一处理类
 * @author 熊颀
 *2015年12月16日 下午11:34:43
 */
@EnableWebMvc
@ControllerAdvice
public class ExcpetionControlAdvice {
	
	private static Log logger = LogFactory.getLog(ExcpetionControlAdvice.class);
	
	@Resource
    private ResourceBundleMessageSource messageSource;
    
	/**
	 * 框架定义异常
	 * @param e
	 * @param request
	 * @return
	 */
	@ExceptionHandler(BasicException.class)
	@ResponseBody
	
    public Message exception(BasicException e,HttpServletRequest request) {  
		logger.error("catch excpetion "+e.getMessage(),e);
		HttpSession session=request.getSession();
		Locale locale=(Locale) session.getAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME);
           String msg=messageSource.getMessage(e.getCode(), e.getArg(), locale);
           Message message=new Message();
 
           if(msg==null){
        	   msg=e.getCode();
           }
           message.setContent(msg);
           message.setCode(e.getCode());
           message.setType(Message.MESSAGE_TYPE_ERROR);
        return message;  
    }  
	
	/**
	 * 其它异常
	 */
	@ExceptionHandler(Exception.class)
	@ResponseBody
    public Message exception(Exception e,HttpServletRequest request) {  
		logger.error("catch excpetion "+e.getMessage(),e);
		HttpSession session=request.getSession();
		Locale locale=(Locale) session.getAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME);
           String msg=messageSource.getMessage("program_error", new Object[]{e.getClass().getCanonicalName()}, locale);
           Message message=new Message();
           
           if(msg==null){
        	   msg="program_error";
           }
           message.setContent(msg);
           message.setCode("program_error");
           message.setType(Message.MESSAGE_TYPE_ERROR);
        return message;  
    }  
}
