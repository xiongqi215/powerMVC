package cn.com.powermvc.bo;

import org.apache.ibatis.type.Alias;

@Alias("lakeDatasetInfo")
public class lakeDatasetInfo {
	
	private Long lakeId;  
	private String lakeDatasetTitle;
	private String lakeDatasetPic;
	private String lakeDatasetDesc;
	public String getLakeDatasetTitle() {
		return lakeDatasetTitle;
	}
	public void setLakeDatasetTitle(String lakeDatasetTitle) {
		this.lakeDatasetTitle = lakeDatasetTitle;
	}
	public String getLakeDatasetPic() {
		return lakeDatasetPic;
	}
	public void setLakeDatasetPic(String lakeDatasetPic) {
		this.lakeDatasetPic = lakeDatasetPic;
	}
	public String getLakeDatasetDesc() {
		return lakeDatasetDesc;
	}
	public void setLakeDatasetDesc(String lakeDatasetDesc) {
		this.lakeDatasetDesc = lakeDatasetDesc;
	}
	public Long getlakeId() {
		return lakeId;
	}
	public void setlakeId(Long lakeId) {
		this.lakeId = lakeId;
	}
}
