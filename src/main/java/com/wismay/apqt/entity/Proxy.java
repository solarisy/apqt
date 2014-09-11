package com.wismay.apqt.entity;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.builder.ToStringBuilder;

public class Proxy {

	public Proxy() {
	}

	private Long id;
	private Date updateDate = new Date();
	private Date createDate;
	private Long createUser;
	private Long deleted = 1L;
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
	private String employeeNumber = "0";
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
	private String certcode;
	private Long auditStatus;

	private List<Long> auditStatusList;// 查询条件

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

	public String getAnnualTurnover() {
		return annualTurnover;
	}

	public void setAnnualTurnover(String annualTurnover) {
		this.annualTurnover = annualTurnover;
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
		return auditStatusList;
	}

	public void setAuditStatusList(List<Long> auditStatusList) {
		this.auditStatusList = auditStatusList;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
}