package cn.com.powermvc.bo;

import org.apache.ibatis.type.Alias;

@Alias("member")
public class Member  {
	private Long id;
	private String address;
	private String contacts;
	private String email;
	private String enName;
	private String login;
	private String mechanism;
	private String memberType;
	private String name;
	private String password;
	private String tele;
    private String countryCName;
    private String countryEName;
    private String sort;
    
    public String getSort() {
		return sort;
	}


	public void setSort(String sort) {
		this.sort = sort;
	}


	public Member() {
	}


	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}


	public String getContacts() {
		return this.contacts;
	}

	public void setContacts(String contacts) {
		this.contacts = contacts;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}


	public String getEnName() {
		return this.enName;
	}

	public void setEnName(String enName) {
		this.enName = enName;
	}


	public String getLogin() {
		return this.login;
	}

	public void setLogin(String login) {
		this.login = login;
	}


	public String getMechanism() {
		return this.mechanism;
	}

	public void setMechanism(String mechanism) {
		this.mechanism = mechanism;
	}


	public String getMemberType() {
		return this.memberType;
	}

	public void setMemberType(String memberType) {
		this.memberType = memberType;
	}


	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}


	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}


	public String getTele() {
		return this.tele;
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


	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}

}