package cn.com.powermvc.service;

import java.util.List;

import cn.com.powermvc.bo.lakeDatasetInfo;
/**
 * 数据集服务层接口
 * @author 熊颀
 *2016年1月3日 下午5:32:39
 */
public interface DatasetService {
	/**
	 * 查询最新数据集
	 * @author 熊颀
	 * @return
	 * @throws Exception
	 * 2016年1月6日
	 */
	public  List<lakeDatasetInfo> getLatestDatasetList() 
			throws Exception;

	
	/**
	 * 查询4条热门数据集或3条推荐数据集
	 * @author 熊颀
	 * @param dataStatus
	 * @return
	 * @throws Exception
	 * 2016年1月6日
	 */
	public List<lakeDatasetInfo> getHotRecDatasetList(Integer dataStatus) throws Exception;
}