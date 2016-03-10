package cn.com.powermvc.bo;

import java.math.BigDecimal;

import org.apache.ibatis.type.Alias;

import cn.com.powermvc.common.Publish;

@Alias("UserInfo")
public class UserInfo extends BaseEntity {

	// 登录名
	private String loginName;
	// 登录密码
	private String password;
	// 序号
	private BigDecimal sindex;
	// 固定电话号码
	private String phone;
	// 手机号码
	private String telephone;
	// 用户名
	private String userName;
	// 用户角色
	private RoleInfo roleInfo;
	//所属机构
	private OrganInfo organInfo;
	//所属机构ID
	private Long organId;
	// 用户类型
	private String userType = Publish.NORMAL_USER;

	public UserInfo() {
	}

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public BigDecimal getSindex() {
		return sindex;
	}

	public void setSindex(BigDecimal sindex) {
		this.sindex = sindex;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public RoleInfo getRoleInfo() {
		return roleInfo;
	}

	public void setRoleInfo(RoleInfo roleInfo) {
		this.roleInfo = roleInfo;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public OrganInfo getOrganInfo() {
		return organInfo;
	}

	public void setOrganInfo(OrganInfo organInfo) {
		this.organInfo = organInfo;
	}

	public Long getOrganId() {
		return organId;
	}

	public void setOrganId(Long organId) {
		this.organId = organId;
	}

}
