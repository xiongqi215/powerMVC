package cn.com.powermvc.bo;


import java.math.BigDecimal;

import org.apache.ibatis.type.Alias;


@Alias("FunctionInfo")
public class FunctionInfo extends BaseEntity {

	
	//菜单编码
	private String funCode;  

	//菜单名称
	private String funNameCh;
	
	 //菜单URL
	private String url;
	
	private String funNameEn; 




	 //父级菜单
	private FunctionInfo parent; 

	private BigDecimal sindex;
   
	 //父级菜单ID
	private Long parentId;
	
	//菜单类型 web前台，manager后台
	private String functionType;

	public FunctionInfo() {
	}

	
	public String getFunCode() {
		return this.funCode;
	}

	public void setFunCode(String funCode) {
		this.funCode = funCode;
	}
	

	
	
	public FunctionInfo getParent() {
		return parent;
	}

	public void setParent(FunctionInfo parent) {
		this.parent = parent;
	}



	public BigDecimal getSindex() {
		return this.sindex;
	}

	public void setSindex(BigDecimal sindex) {
		this.sindex = sindex;
	}

	

	public String getUrl() {
		return this.url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	
	
	public Long getParentId() {
		if(parentId==null){
			parentId=new Long("0");
		}
		return parentId;
	}


	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}


	public String getFunNameCh() {
		return this.funNameCh;
	}

	public void setFunNameCh(String funNameCh) {
		this.funNameCh = funNameCh;
	}


	public String getFunNameEn() {
		return this.funNameEn;
	}

	public void setFunNameEn(String funNameEn) {
		this.funNameEn = funNameEn;
	}


	public String getFunctionType() {
		return functionType;
	}


	public void setFunctionType(String functionType) {
		this.functionType = functionType;
	}
	
	
}