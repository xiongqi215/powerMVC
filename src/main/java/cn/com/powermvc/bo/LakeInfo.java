package cn.com.powermvc.bo;

import javax.persistence.Column;

import org.apache.ibatis.type.Alias;


@Alias("LakeInfo")
public class LakeInfo extends BaseEntity {
	private String basinRange;
	//国家英文名称
    private String countryCName;
    //国家中文名称
    private String countryEName;
	private String lakeLength;
	private String lakeWidth;
	private String lakearea;
	private String lakecode;
	private String lakename;
	private String laketype;
	private String latitude;
	private String longitude;
	private String picAdd;
	private String shoreline;
	private String volume;
	private Long organId;
    public Long getOrganId() {
		return organId;
	}


	public void setOrganId(Long organId) {
		this.organId = organId;
	}


	// Constructors
    private String lakeTypeName;
    
	public LakeInfo() {
	}


	@Column(name="BASIN_RANGE")
	public String getBasinRange() {
		return this.basinRange;
	}

	public void setBasinRange(String basinRange) {
		this.basinRange = basinRange;
	}



	@Column(name="LAKE_LENGTH")
	public String getLakeLength() {
		return this.lakeLength;
	}

	public void setLakeLength(String lakeLength) {
		this.lakeLength = lakeLength;
	}


	@Column(name="LAKE_WIDTH")
	public String getLakeWidth() {
		return this.lakeWidth;
	}

	public void setLakeWidth(String lakeWidth) {
		this.lakeWidth = lakeWidth;
	}


	public String getLakearea() {
		return this.lakearea;
	}

	public void setLakearea(String lakearea) {
		this.lakearea = lakearea;
	}


	public String getLakecode() {
		return this.lakecode;
	}

	public void setLakecode(String lakecode) {
		this.lakecode = lakecode;
	}


	public String getLakename() {
		return this.lakename;
	}

	public void setLakename(String lakename) {
		this.lakename = lakename;
	}


	public String getLaketype() {
		return this.laketype;
	}

	public void setLaketype(String laketype) {
		this.laketype = laketype;
	}


	public String getLatitude() {
		return this.latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}


	public String getLongitude() {
		return this.longitude;
	}

	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}


	@Column(name="PIC_ADD")
	public String getPicAdd() {
		return this.picAdd;
	}

	public void setPicAdd(String picAdd) {
		this.picAdd = picAdd;
	}


	public String getShoreline() {
		return this.shoreline;
	}

	public void setShoreline(String shoreline) {
		this.shoreline = shoreline;
	}


	public String getVolume() {
		return this.volume;
	}

	public void setVolume(String volume) {
		this.volume = volume;
	}


	public String getCountryCName() {
		return countryCName;
	}


	public void setCountryCName(String countryCName) {
		this.countryCName = countryCName;
	}


	public String getCountryEName() {
		return countryEName;
	}


	public void setCountryEName(String countryEName) {
		this.countryEName = countryEName;
	}


	public String getLakeTypeName() {
		return lakeTypeName;
	}


	public void setLakeTypeName(String lakeTypeName) {
		this.lakeTypeName = lakeTypeName;
	}



	
}