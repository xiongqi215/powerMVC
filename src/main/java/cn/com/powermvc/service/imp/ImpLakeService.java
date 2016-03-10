package cn.com.powermvc.service.imp;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.com.powermvc.bo.LakeInfo;
import cn.com.powermvc.common.Publish;
import cn.com.powermvc.common.ext.mybatis.Page;
import cn.com.powermvc.common.ext.mybatis.SqlSessionClient;
import cn.com.powermvc.service.LakeInfoService;
/**
 * 湖泊服务层
 * @author 熊颀
 *2016年1月3日 下午5:35:19
 */
@Service
public class ImpLakeService implements LakeInfoService {
    @Resource
    private SqlSessionClient sqlSessionClient;
	@Override
	public Page<LakeInfo> getLakeInfoListByOrgan(Page<LakeInfo> page,Long organId) throws Exception {
		Map<String,Object> params=new HashMap<String,Object>();
		 params.put("organId", organId);
		 params.put("isDelete", Publish.NORMAL);
		return (Page<LakeInfo>) sqlSessionClient.selectPage(page, "lake.getLakeByOrganId",params);
	}

	@Override
	public void saveLake(LakeInfo lake) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public LakeInfo getLakeById(Long id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteLakeById(Long id) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<LakeInfo> getAll() throws Exception {
		return null;
	}

}
