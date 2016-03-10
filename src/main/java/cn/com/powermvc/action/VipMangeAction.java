package cn.com.powermvc.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.com.powermvc.bo.UserInfo;
import cn.com.powermvc.common.ext.mybatis.Page;
import cn.com.powermvc.common.ui.Datagrid;
import cn.com.powermvc.service.VipManageService;

@Controller
@RequestMapping("/vip-manage")  
public class VipMangeAction {
	@Resource
	private VipManageService vipManageServ;
	
	private Datagrid<UserInfo> vipInfoGrid; 
    
	@RequestMapping("/index")  
    public ModelAndView vipIndex(){  
        ModelAndView mav = new ModelAndView("management/systemmanage/vip-manage");
        return mav;  
    } 
	@ResponseBody  
	@RequestMapping("/list")
	public Datagrid<UserInfo> getVipInfoDg(HttpServletRequest request){  
        //创建模型跟视图，用于渲染页面。并且指定要返回的页面为home页面  
		//Page<UserInfo> pages = this.buildPage(request);
		//vipManageServ.getVipsPages(pages);
		//vipInfoGrid =  new Datagrid<UserInfo>(pages.getTotalCount(),
		//		pages.getResult());
		//String json = CommonUtil.ObjectToJson(vipInfoGrid);
		Page<UserInfo> page = new Page<UserInfo>();
		List<UserInfo> list = vipManageServ.getVipsInfo();
		page.setResult(list);
		page.setTotalCount(list.size());
		vipInfoGrid =  new Datagrid<UserInfo>(page.getTotalCount(),page.getResult());
        return vipInfoGrid;  
    } 
	
}
