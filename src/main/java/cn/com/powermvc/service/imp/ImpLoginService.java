package cn.com.powermvc.service.imp;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import cn.com.powermvc.bo.Member;
import cn.com.powermvc.bo.UserInfo;
import cn.com.powermvc.common.Publish;
import cn.com.powermvc.common.util.Encrypt;
import cn.com.powermvc.service.LoginService;
@Service("LoginService")
public class ImpLoginService implements LoginService{

	@Resource
	private SqlSessionTemplate sqlSessionTemplate;
	
	public UserInfo protalLogin(String loginName,String pwd) throws Exception {
		 Map<String,Object> params=new HashMap<String,Object>();
		 params.put("loginName", loginName);
		 params.put("password", pwd);
		 params.put("isDelete", Publish.NORMAL);
		 params.put("userType", Publish.NORMAL_USER);
		 UserInfo user=sqlSessionTemplate.selectOne("user.checkUserLogin", params);
		return user;
	}
   
	/**
	 * 后台用户登录
	 * @return
	 * @throws Exception
	 */
	@Override
	public UserInfo LoginMgmt(String loginName, String pwd) throws Exception {
		
		 Map<String,Object> params=new HashMap<String,Object>();
		 params.put("loginName", loginName);
		 params.put("password", Encrypt.e(pwd));
		 params.put("is_delete", Publish.NORMAL);
		 //只有用户类型为管理员的用户允许登录后台
		 params.put("userType", Publish.ADMIN_USER);
		 UserInfo user=sqlSessionTemplate.selectOne("mgmt.checkUserLogin", params);
		
		
		return user;
	}

}
