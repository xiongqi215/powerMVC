package cn.com.powermvc.action;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.com.powermvc.bo.OrganInfo;
import cn.com.powermvc.common.ext.mybatis.Page;
import cn.com.powermvc.common.ui.Datagrid;
import cn.com.powermvc.service.OrganService;
/**
 * 机构管理Action层
 * @author 熊颀
 *2016年1月3日 下午5:31:25
 */
@Controller
@RequestMapping("/organ")
public class OrganAction {
	@Resource
	private OrganService organService;
	
	@RequestMapping()
	public String init() throws Exception{
		
		return "management/systemmanage/organ";
	}
	
//	 @ModelAttribute  
//     public void buildPage(int rows, int page,Model model) {  
//		 Page<OrganInfo> pageObj=new Page<OrganInfo>();
//		 pageObj.setPageNo(rows);
//		 pageObj.setPageSize(page);
//        model.addAttribute("page", pageObj);  
//     }  
	 /**
	  * 查询机构列表
	  * @param rows
	  * @param page
	  * @return
	  * @throws Exception
	  */
	@ResponseBody
	@RequestMapping("/list")
	public Datagrid<OrganInfo> list(int rows, int page) throws Exception{
		Page<OrganInfo> pageObj=new Page<OrganInfo>();
		 pageObj.setPageNo(page);
		 pageObj.setPageSize(rows);
		 pageObj=this.organService.getAllOrgan(pageObj);
		Datagrid<OrganInfo> datagrid=new Datagrid(pageObj.getTotalCount(),pageObj.getResult());
		return datagrid;
	}
}