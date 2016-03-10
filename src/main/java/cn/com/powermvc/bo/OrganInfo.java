package cn.com.powermvc.bo;

import org.apache.ibatis.type.Alias;

@Alias("OrganInfo")
public class OrganInfo extends BaseEntity {

	//联系地址
	private String address;
	//联系人
	private String contacts;
	//电子邮箱
	private String email;
	//EN名称
	private String enName;
	//机构简介
	private String mechanism;
	//机构类型：1-研究所（中心） ORGAN_TYPE
	//2-监测中心（点）
	//3-研究基地
	//4-数据库（平台）
	//5-期刊杂志社
	//6-协会
	private String organType;
	//CN名称
	private String name;
	//联系方式
	private String tele;
	//国家英文名称
    private String countryCName;
    //国家中文名称
    private String countryEName;
    //排序
    private String sort;
    //国家ID COUNTRY_ID
    private Long countryId;
    
    
    
    
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getContacts() {
		return contacts;
	}
	public void setContacts(String contacts) {
		this.contacts = contacts;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getEnName() {
		return enName;
	}
	public void setEnName(String enName) {
		this.enName = enName;
	}
	public String getMechanism() {
		return mechanism;
	}
	public void setMechanism(String mechanism) {
		this.mechanism = mechanism;
	}
	public String getOrganType() {
		return organType;
	}
	public void setOrganType(String organType) {
		this.organType = organType;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTele() {
		return tele;
	}
	public void setTele(String tele) {
		this.tele = tele;
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
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public Long getCountryId() {
		return countryId;
	}
	public void setCountryId(Long countryId) {
		this.countryId = countryId;
	}
    
    
}
