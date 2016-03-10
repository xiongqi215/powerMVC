package cn.com.powermvc.bo;

import java.util.Date;

import cn.com.powermvc.common.Publish;
/**
 * 基础实体类
 * @author 熊颀
 *2016年1月3日 下午5:29:02
 */
public class BaseEntity {
	
	// id
   protected Long id;
   
   //创建时间
   protected Date createTime;
 
    //创建用户	
	protected String createUser;

	
	/**
	 * 记录状态标志位 正常(0) 已删除(1) 待审核(2) 锁定(3)
	 */
	
	protected String isDelete=Publish.NORMAL;
	
	//更新时间
	protected Date updateTime;

	//更新用户
	protected String updateUser;

    //乐观锁
	protected Integer version;


	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}


	public Date getCreateTime() {
		return createTime;
	}


	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}


	public String getCreateUser() {
		return createUser;
	}


	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}


	public String getIsDelete() {
		return isDelete;
	}


	public void setIsDelete(String isDelete) {
		this.isDelete = isDelete;
	}


	public Date getUpdateTime() {
		return updateTime;
	}


	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}


	public String getUpdateUser() {
		return updateUser;
	}


	public void setUpdateUser(String updateUser) {
		this.updateUser = updateUser;
	}


	public Integer getVersion() {
		return version;
	}


	public void setVersion(Integer version) {
		this.version = version;
	}
	
	
	
}
