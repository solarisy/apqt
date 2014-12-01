package com.wismay.apqt.entity;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.builder.ToStringBuilder;

public class Personal {

	public Personal() {
	}

	private Long id;
	private Date updateDate = new Date();
	private Date createDate;
	private Long createUser;
	private Long deleted = 1L;
	private String idNumber;
	private String name;
	private String sex;
	private String country;
	private String ethnic;
	private String unit;
	private String unitAddress;
	private String duty;
	private String height;
	private String blood;
	private String marriage;
	private String children;
	private String registeredAddress;
	private String address;
	private String zip;
	private String mobilephone;
	private String phone;
	private String qq;
	private String email;
	private String education;
	private String degree;
	private String certcode;
	private Long auditStatus;
	private Long proxy;
	private Long company;
	private String companyName;
	private String authCode;// 授权码

	private Date dutyDay;// '职务日期';
	private String jobTitle;// '职称';
	private String jobNumber;// '执业号';
	private Date birthday;// '出生时间';
	private Date educationDay;// '学历日期';
	private String educationSchool;// '学历学校';
	private String educationSchoolId;// '学历学校ID';
	private Date degreeDay;// '学位日期';
	private String degreeSchool;// '学位学校';
	private String degreeSchoolId;// '学位学校ID';
	private String resume;// '简历';
	private String certificate;// '获得何种证书';
	private Date certificateDay;// '证书日期';
	private String certificateOrg;// '证书颁发机构';
	private String rewardCertificates;// '奖励证书';
	private Date rewardCertificatesDay;// '奖励证书颁发日期';
	private String rewardCertificatesOrg;// '奖励证书颁发机构';
	private String punishment;// '处罚';
	private Date punishmentDay;// '处罚日期';
	private String punishmentOrg;// '处罚机构';
	private String website;// '个人网站';

	private List<Long> auditStatusList;// 查询条件

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Long getCreateUser() {
		return createUser;
	}

	public void setCreateUser(Long createUser) {
		this.createUser = createUser;
	}

	public Long getDeleted() {
		return deleted;
	}

	public void setDeleted(Long deleted) {
		this.deleted = deleted;
	}

	public String getIdNumber() {
		return idNumber;
	}

	public void setIdNumber(String idNumber) {
		this.idNumber = idNumber;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getEthnic() {
		return ethnic;
	}

	public void setEthnic(String ethnic) {
		this.ethnic = ethnic;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public String getDuty() {
		return duty;
	}

	public void setDuty(String duty) {
		this.duty = duty;
	}

	public String getHeight() {
		return height;
	}

	public void setHeight(String height) {
		this.height = height;
	}

	public String getBlood() {
		return blood;
	}

	public void setBlood(String blood) {
		this.blood = blood;
	}

	public String getMarriage() {
		return marriage;
	}

	public void setMarriage(String marriage) {
		this.marriage = marriage;
	}

	public String getChildren() {
		return children;
	}

	public void setChildren(String children) {
		this.children = children;
	}

	public String getUnitAddress() {
		return unitAddress;
	}

	public void setUnitAddress(String unitAddress) {
		this.unitAddress = unitAddress;
	}

	public String getRegisteredAddress() {
		return registeredAddress;
	}

	public void setRegisteredAddress(String registeredAddress) {
		this.registeredAddress = registeredAddress;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getZip() {
		return zip;
	}

	public void setZip(String zip) {
		this.zip = zip;
	}

	public String getMobilephone() {
		return mobilephone;
	}

	public void setMobilephone(String mobilephone) {
		this.mobilephone = mobilephone;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getEducation() {
		return education;
	}

	public void setEducation(String education) {
		this.education = education;
	}

	public String getDegree() {
		return degree;
	}

	public void setDegree(String degree) {
		this.degree = degree;
	}

	public String getCertcode() {
		return certcode;
	}

	public void setCertcode(String certcode) {
		this.certcode = certcode;
	}

	public Long getAuditStatus() {
		return auditStatus;
	}

	public void setAuditStatus(Long auditStatus) {
		this.auditStatus = auditStatus;
	}

	public Long getProxy() {
		return proxy;
	}

	public void setProxy(Long proxy) {
		this.proxy = proxy;
	}

	public Long getCompany() {
		return company;
	}

	public void setCompany(Long company) {
		this.company = company;
	}

	public List<Long> getAuditStatusList() {
		return auditStatusList;
	}

	public void setAuditStatusList(List<Long> auditStatusList) {
		this.auditStatusList = auditStatusList;
	}

	public String getAuthCode() {
		return authCode;
	}

	public void setAuthCode(String authCode) {
		this.authCode = authCode;
	}

	public String getJobTitle() {
		return jobTitle;
	}

	public void setJobTitle(String jobTitle) {
		this.jobTitle = jobTitle;
	}

	public String getJobNumber() {
		return jobNumber;
	}

	public void setJobNumber(String jobNumber) {
		this.jobNumber = jobNumber;
	}

	public String getEducationSchool() {
		return educationSchool;
	}

	public void setEducationSchool(String educationSchool) {
		this.educationSchool = educationSchool;
	}

	public String getEducationSchoolId() {
		return educationSchoolId;
	}

	public void setEducationSchoolId(String educationSchoolId) {
		this.educationSchoolId = educationSchoolId;
	}

	public String getDegreeSchool() {
		return degreeSchool;
	}

	public void setDegreeSchool(String degreeSchool) {
		this.degreeSchool = degreeSchool;
	}

	public String getResume() {
		return resume;
	}

	public void setResume(String resume) {
		this.resume = resume;
	}

	public String getCertificate() {
		return certificate;
	}

	public void setCertificate(String certificate) {
		this.certificate = certificate;
	}

	public String getCertificateOrg() {
		return certificateOrg;
	}

	public void setCertificateOrg(String certificateOrg) {
		this.certificateOrg = certificateOrg;
	}

	public String getRewardCertificates() {
		return rewardCertificates;
	}

	public void setRewardCertificates(String rewardCertificates) {
		this.rewardCertificates = rewardCertificates;
	}

	public String getPunishment() {
		return punishment;
	}

	public void setPunishment(String punishment) {
		this.punishment = punishment;
	}

	public String getPunishmentOrg() {
		return punishmentOrg;
	}

	public void setPunishmentOrg(String punishmentOrg) {
		this.punishmentOrg = punishmentOrg;
	}

	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	public Date getDutyDay() {
		return dutyDay;
	}

	public void setDutyDay(Date dutyDay) {
		this.dutyDay = dutyDay;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public Date getEducationDay() {
		return educationDay;
	}

	public void setEducationDay(Date educationDay) {
		this.educationDay = educationDay;
	}

	public Date getDegreeDay() {
		return degreeDay;
	}

	public void setDegreeDay(Date degreeDay) {
		this.degreeDay = degreeDay;
	}

	public Date getCertificateDay() {
		return certificateDay;
	}

	public void setCertificateDay(Date certificateDay) {
		this.certificateDay = certificateDay;
	}

	public String getDegreeSchoolId() {
		return degreeSchoolId;
	}

	public void setDegreeSchoolId(String degreeSchoolId) {
		this.degreeSchoolId = degreeSchoolId;
	}

	public Date getRewardCertificatesDay() {
		return rewardCertificatesDay;
	}

	public void setRewardCertificatesDay(Date rewardCertificatesDay) {
		this.rewardCertificatesDay = rewardCertificatesDay;
	}

	public String getRewardCertificatesOrg() {
		return rewardCertificatesOrg;
	}

	public void setRewardCertificatesOrg(String rewardCertificatesOrg) {
		this.rewardCertificatesOrg = rewardCertificatesOrg;
	}

	public Date getPunishmentDay() {
		return punishmentDay;
	}

	public void setPunishmentDay(Date punishmentDay) {
		this.punishmentDay = punishmentDay;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
}