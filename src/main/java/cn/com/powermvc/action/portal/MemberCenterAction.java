package cn.com.powermvc.action.portal;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;











import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cn.com.powermvc.bo.LakeInfo;
import cn.com.powermvc.bo.OrganInfo;
import cn.com.powermvc.bo.UserInfo;
import cn.com.powermvc.common.Publish;
import cn.com.powermvc.common.ext.mybatis.Page;
import cn.com.powermvc.service.LakeInfoService;
import cn.com.powermvc.service.OrganService;

/**
 * 会员中心
 * @author 熊颀
 *2015年12月28日 下午3:07:59
 */
@Controller
@RequestMapping("/memberCenter")
public class MemberCenterAction {
	@Resource
	private OrganService organService;
	
	@Resource
    private LakeInfoService lakeInfoService;
	
	/**
	 * 会员中心入口页面
	 * @return
	 */
	@RequestMapping
	public ModelAndView init(HttpSession session) throws Exception{
		//通过登录用户，获取用户机构信息
		UserInfo user=(UserInfo) session.getAttribute(Publish.SESSION_USER);
		OrganInfo organ=organService.getOrganById(user.getOrganInfo().getId());
		
		ModelAndView model=new ModelAndView("/memberCenter/member-index");
		model.addObject("organ",organ);
		return model;
	}
	
	/**
	 * 湖泊管理页面
	 * @param organId 机构ID
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/lakeMgmt")
	public ModelAndView lakeMgmt(Page<LakeInfo> page,Long organId)throws Exception{
		ModelAndView model=new ModelAndView("/memberCenter/lake");
		if(page==null){
			page=new Page<LakeInfo>();
		}
		lakeInfoService.getLakeInfoListByOrgan(page, organId);
		
		model.addObject("list",page.getResult());
		model.addObject("totalCount",page.getTotalCount());
		model.addObject("pageSize",page.getPageSize());
		return model;
		
	}
	
}
