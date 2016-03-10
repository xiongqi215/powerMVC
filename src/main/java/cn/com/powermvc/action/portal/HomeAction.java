package cn.com.powermvc.action.portal;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.com.powermvc.common.Publish;
import cn.com.powermvc.service.DatasetService;

/**
 *前台首页
 * @author 熊颀
 *2015年12月28日 下午1:53:36
 */
@Controller
@RequestMapping("/home")
public class HomeAction {
	@Resource
	private DatasetService datasetService;
	
	@RequestMapping
	public ModelAndView init() throws Exception{
		
		ModelAndView model=new ModelAndView("home/homepage");
		model.addObject("latestDataSet",datasetService.getLatestDatasetList());
		model.addObject("hotDataSet",datasetService.getHotRecDatasetList(Publish.SJSMHP_HOTDATASETCOUNT));
		model.addObject("rcmDataSet",datasetService.getHotRecDatasetList(Publish.SJSMHP_RECOMMENDDATASETCOUNT));
		
		return model;
	}
	
	
	
}
