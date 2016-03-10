package cn.com.powermvc.action;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cn.com.powermvc.bo.Member;
import cn.com.powermvc.common.Publish;
import cn.com.powermvc.service.LakeInfoService;


//@Controller
//@RequestMapping("/memberCenter")
public class MemberCenterAction {
    @Resource
	private LakeInfoService lakeInfoService;
    
//    @RequestMapping("/init/{view}")	
	 public ModelAndView  init(HttpSession session,@PathVariable String view){
    	ModelAndView modelView=new ModelAndView();
		
		 if(view.equals("show")){
			 modelView.setViewName("memberCenter/member-index");
		 }else{
			 modelView.setViewName("memberCenter/member-input");
		 }
		 
		 Member member=(Member) session.getAttribute(Publish.SESSION_USER);
		 modelView.addObject("member", member);
		 
		 return modelView;
	 }
    
    
    
}
