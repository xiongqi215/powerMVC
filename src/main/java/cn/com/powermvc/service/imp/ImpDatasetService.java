package cn.com.powermvc.service.imp;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import cn.com.powermvc.bo.lakeDatasetInfo;
import cn.com.powermvc.common.Publish;
import cn.com.powermvc.service.DatasetService;

/**
 * 数据集服务层
 * @author 熊颀
 *2016年1月3日 下午5:32:39
 */
@Service("DatasetService")
public class ImpDatasetService implements DatasetService {
    
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;
	
     
	@Override
	/**
	 * 查询最新数据集
	 * @author 熊颀
	 * 
	 */
	public List<lakeDatasetInfo> getLatestDatasetList() throws Exception{
		 Map<String,Object> params=new HashMap<String,Object>();
		 params.put("rownum", Publish.SJSMHP_LATESTDATASETCOUNT);
		 params.put("is_delete", Publish.NORMAL);
		 List<lakeDatasetInfo> lakeDatasetInfoList=sqlSessionTemplate.selectList("Dataset.loadLatestDatasetList", params);
		return lakeDatasetInfoList;
		 
	 }


	/**
	 * 查询4条热门数据集或3条推荐数据集
	 * @author 熊颀
	 * @param dataStatus
	 * @return
	 * @throws Exception
	 * 2016年1月6日
	 */
	public List<lakeDatasetInfo> getHotRecDatasetList(Integer dataStatus)
			throws Exception {
		Map<String,Object> params=new HashMap<String,Object>();
		
		if(dataStatus==Publish.SJSMHP_RECOMMEND){
			 params.put("rownum", Publish.SJSMHP_RECOMMENDDATASETCOUNT);
		}
		else{
			 params.put("rownum", Publish.SJSMHP_HOTDATASETCOUNT);
		}
		
		
		 params.put("is_delete", Publish.NORMAL);
		 List<lakeDatasetInfo> lakeDatasetInfoList=sqlSessionTemplate.selectList("Dataset.loadLatestDatasetList", params);
		return lakeDatasetInfoList;
	}
}
