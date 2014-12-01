package com.wismay.apqt.entity;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.builder.ToStringBuilder;

public class Company {

	public Company() {

	}

	private Long id;
	private Date updateDate = new Date();
	private Date createDate;
	private Long createUser;
	private Long deleted = 1L;
	private String certcode;
	private Long auditStatus;
	private Long proxy;// 0：平台管理员创建的公司信息，否则是代理创建的公司信息
	private Long isProxy;// 是否是代理：0：不是；1：是
	private String authCode;// 授权码

	private String orgcode;
	private String nameCn;
	private String nameEn;
	private String registeredNumber;
	private String taxNumber;
	private String industry;
	private String unitPropertie;
	private Date foundedDate;
	private String businessScope;
	private String annualTurnover;
	private String employeeNumber;
	private String legalRepresentative;
	private String basicBank;
	private String basicBankAccount;
	private String registeredCapital;
	private String website;
	private String registeredAddress;
	private String contactsAddress;
	private String zip;
	private String contacts;
	private String contactsPhone;

	private String certificate;// '获得何种证书';
	private Date certificateDay;// '证书日期';
	private String certificateOrg;// '证书颁发机构';
	private String rewardCertificates;// '奖励证书';
	private Date rewardCertificatesDay;// '奖励证书颁发日期';
	private String rewardCertificatesOrg;// '奖励证书颁发机构';
	private String punishment;// '处罚';
	private Date punishmentDay;// '处罚日期';
	private String punishmentOrg;// '处罚机构';

	private Long pcount = 0L;// 个人数(查询时统计)

	private List<Long> auditStatusList;// 查询条件

	public Long getPcount() {
		return pcount;
	}

	public void setPcount(Long pcount) {
		this.pcount = pcount;
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

	public String getOrgcode() {
		return orgcode;
	}

	public void setOrgcode(String orgcode) {
		this.orgcode = orgcode;
	}

	public String getNameCn() {
		return nameCn;
	}

	public void setNameCn(String nameCn) {
		this.nameCn = nameCn;
	}

	public String getNameEn() {
		return nameEn;
	}

	public void setNameEn(String nameEn) {
		this.nameEn = nameEn;
	}

	public String getRegisteredNumber() {
		return registeredNumber;
	}

	public void setRegisteredNumber(String registeredNumber) {
		this.registeredNumber = registeredNumber;
	}

	public String getTaxNumber() {
		return taxNumber;
	}

	public void setTaxNumber(String taxNumber) {
		this.taxNumber = taxNumber;
	}

	public String getIndustry() {
		return industry;
	}

	public void setIndustry(String industry) {
		this.industry = industry;
	}

	public String getUnitPropertie() {
		return unitPropertie;
	}

	public void setUnitPropertie(String unitPropertie) {
		this.unitPropertie = unitPropertie;
	}

	public Date getFoundedDate() {
		return foundedDate;
	}

	public void setFoundedDate(Date foundedDate) {
		this.foundedDate = foundedDate;
	}

	public String getBusinessScope() {
		return businessScope;
	}

	public void setBusinessScope(String businessScope) {
		this.businessScope = businessScope;
	}

	public String getEmployeeNumber() {
		return employeeNumber;
	}

	public void setEmployeeNumber(String employeeNumber) {
		this.employeeNumber = employeeNumber;
	}

	public String getLegalRepresentative() {
		return legalRepresentative;
	}

	public void setLegalRepresentative(String legalRepresentative) {
		this.legalRepresentative = legalRepresentative;
	}

	public String getBasicBank() {
		return basicBank;
	}

	public void setBasicBank(String basicBank) {
		this.basicBank = basicBank;
	}

	public String getBasicBankAccount() {
		return basicBankAccount;
	}

	public void setBasicBankAccount(String basicBankAccount) {
		this.basicBankAccount = basicBankAccount;
	}

	public String getAnnualTurnover() {
		return annualTurnover;
	}

	public void setAnnualTurnover(String annualTurnover) {
		this.annualTurnover = annualTurnover;
	}

	public String getRegisteredCapital() {
		return registeredCapital;
	}

	public void setRegisteredCapital(String registeredCapital) {
		this.registeredCapital = registeredCapital;
	}

	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	public String getRegisteredAddress() {
		return registeredAddress;
	}

	public void setRegisteredAddress(String registeredAddress) {
		this.registeredAddress = registeredAddress;
	}

	public String getContactsAddress() {
		return contactsAddress;
	}

	public void setContactsAddress(String contactsAddress) {
		this.contactsAddress = contactsAddress;
	}

	public String getZip() {
		return zip;
	}

	public void setZip(String zip) {
		this.zip = zip;
	}

	public String getContacts() {
		return contacts;
	}

	public void setContacts(String contacts) {
		this.contacts = contacts;
	}

	public String getContactsPhone() {
		return contactsPhone;
	}

	public void setContactsPhone(String contactsPhone) {
		this.contactsPhone = contactsPhone;
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

	public List<Long> getAuditStatusList() {
		if (auditStatusList == null || auditStatusList.size() == 0) {
			auditStatusList = null;
		}
		return auditStatusList;
	}

	public void setAuditStatusList(List<Long> auditStatusList) {
		this.auditStatusList = auditStatusList;
	}

	public Long getProxy() {
		return proxy;
	}

	public void setProxy(Long proxy) {
		this.proxy = proxy;
	}

	public Long getIsProxy() {
		return isProxy;
	}

	public void setIsProxy(Long isProxy) {
		this.isProxy = isProxy;
	}

	public String getAuthCode() {
		return authCode;
	}

	public void setAuthCode(String authCode) {
		this.authCode = authCode;
	}

	public String getCertificate() {
		return certificate;
	}

	public void setCertificate(String certificate) {
		this.certificate = certificate;
	}

	public Date getCertificateDay() {
		return certificateDay;
	}

	public void setCertificateDay(Date certificateDay) {
		this.certificateDay = certificateDay;
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

	public String getPunishment() {
		return punishment;
	}

	public void setPunishment(String punishment) {
		this.punishment = punishment;
	}

	public Date getPunishmentDay() {
		return punishmentDay;
	}

	public void setPunishmentDay(Date punishmentDay) {
		this.punishmentDay = punishmentDay;
	}

	public String getPunishmentOrg() {
		return punishmentOrg;
	}

	public void setPunishmentOrg(String punishmentOrg) {
		this.punishmentOrg = punishmentOrg;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
}