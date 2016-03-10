package cn.com.powermvc.action;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.com.powermvc.service.DatasetService;
/*
 * 
 * 数据集Action层
 */
@Controller
@RequestMapping("/dataset")
public class DatasetAction {
    
	@Resource
	private DatasetService datasetService;
	
	
	/**
	 * 查询最新数据集
	 * @return
	 * @throws Exception
	 */
	@ResponseBody 
	@RequestMapping("/loadLatestDataset")
	public List loadLatestDataset() throws Exception{
		return datasetService.getLatestDatasetList();
	}
}
