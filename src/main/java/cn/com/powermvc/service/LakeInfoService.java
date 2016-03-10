package cn.com.powermvc.service;

import java.util.List;

import cn.com.powermvc.bo.LakeInfo;
import cn.com.powermvc.common.ext.mybatis.Page;
/**
 * 湖泊服务层接口
 * @author 熊颀
 *2016年1月3日 下午5:35:19
 */
public interface LakeInfoService {
	/**
	 * 查询湖泊列表（分页）
	 * @param page
	 * @param organId
	 * @return
	 * @throws Exception
	 */
	public Page<LakeInfo> getLakeInfoListByOrgan(Page<LakeInfo> page,Long organId) throws Exception;
	/**
	 * 保存湖泊
	 * @param lake
	 * @throws Exception
	 */
	public void saveLake(LakeInfo lake) throws Exception;
    /**
     * 通过ID查询湖泊
     * @param id
     * @return
     * @throws Exception
     */
	public LakeInfo getLakeById(Long id) throws Exception;
    
	/**
	 * 根据ID删除湖泊
	 * @param id
	 * @throws Exception
	 */
	public void deleteLakeById(Long id) throws Exception;
    
	
	/**
	 * 获取所有湖泊
	 * @return
	 * @throws Exception
	 */
	public List<LakeInfo> getAll() throws Exception;
}