package cn.com.powermvc.bo;

import java.lang.Long;
import java.util.List;

import org.apache.ibatis.type.Alias;

@Alias("RoleInfo")
public class RoleInfo extends BaseEntity  {
	/**
	 * 角色名称
	 */
	private String name;
	/**
	 * 排序字段
	 */
	private Long sindex;
	/**
	 * 角色描述
	 */
	private String description;
	
	/**
	 * 中文功能菜单字符串
	 */
	private String funCNameStr;
	
	/**
	 * 英文功能菜单字符串
	 */
	private String funENameStr;
	
	/**
	 * 关联资源
	 */
	private List<FunctionInfo> tfunctions;

	public RoleInfo() {
	}

	
	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Long getSindex() {
		return this.sindex;
	}

	public void setSindex(Long sindex) {
		this.sindex = sindex;
	}

	public List<FunctionInfo> getTFunctions() {
		return tfunctions;
	}

	public void setTFunctions(List<FunctionInfo> tfunctions) {
		this.tfunctions = tfunctions;
	}


	public String getFunCNameStr() {
		return funCNameStr;
	}


	public void setFunCNameStr(String funCNameStr) {
		this.funCNameStr = funCNameStr;
	}


	public String getFunENameStr() {
		return funENameStr;
	}


	public void setFunENameStr(String funENameStr) {
		this.funENameStr = funENameStr;
	}
	
	

//	public String getFunNameString() {
//	List<TFunction> ms = Lists.newArrayList();
//		for (TFunction tFunction : tfunctions) {
//			ms.add(tFunction);
//		}
//		return ConvertUtils.convertElementPropertyToString(ms, "funNameCh", ", ");
//	}



	

}