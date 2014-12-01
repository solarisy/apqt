package com.wismay.apqt.entity;

import java.util.Date;
import org.apache.commons.lang3.builder.ToStringBuilder;


public class MembershipApply {

	public MembershipApply() {
	}
	
	private Long id;
	private Date updateDate;
	private Date createDate;
	private Long createUser;
	private Long deleted;
	private String code;
	private Date registerDate;
	private String unitName;
	private String unitAddress;
	private String phone;
	private String zip;
	private String leadName;
	private String position;
	private String email;
	private String contectUserName;
	private String fax;
	private String baseInfo;
	private String membershipLevel;
	private String recommendOpinion;
	private String ratificationStatus;
	private String isSponsor;
    
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id=id;
	}
	public Date getUpdateDate(){
		return updateDate;
	}
	
	public void setUpdateDate(Date updateDate){
		this.updateDate=updateDate;
	}
	public Date getCreateDate(){
		return createDate;
	}
	
	public void setCreateDate(Date createDate){
		this.createDate=createDate;
	}
	public Long getCreateUser(){
		return createUser;
	}
	
	public void setCreateUser(Long createUser){
		this.createUser=createUser;
	}
	public Long getDeleted(){
		return deleted;
	}
	
	public void setDeleted(Long deleted){
		this.deleted=deleted;
	}
	public String getCode(){
		return code;
	}
	
	public void setCode(String code){
		this.code=code;
	}
	public Date getRegisterDate(){
		return registerDate;
	}
	
	public void setRegisterDate(Date registerDate){
		this.registerDate=registerDate;
	}
	public String getUnitName(){
		return unitName;
	}
	
	public void setUnitName(String unitName){
		this.unitName=unitName;
	}
	public String getUnitAddress(){
		return unitAddress;
	}
	
	public void setUnitAddress(String unitAddress){
		this.unitAddress=unitAddress;
	}
	public String getPhone(){
		return phone;
	}
	
	public void setPhone(String phone){
		this.phone=phone;
	}
	public String getZip(){
		return zip;
	}
	
	public void setZip(String zip){
		this.zip=zip;
	}
	public String getLeadName(){
		return leadName;
	}
	
	public void setLeadName(String leadName){
		this.leadName=leadName;
	}
	public String getPosition(){
		return position;
	}
	
	public void setPosition(String position){
		this.position=position;
	}
	public String getEmail(){
		return email;
	}
	
	public void setEmail(String email){
		this.email=email;
	}
	public String getContectUserName(){
		return contectUserName;
	}
	
	public void setContectUserName(String contectUserName){
		this.contectUserName=contectUserName;
	}
	public String getFax(){
		return fax;
	}
	
	public void setFax(String fax){
		this.fax=fax;
	}
	public String getBaseInfo(){
		return baseInfo;
	}
	
	public void setBaseInfo(String baseInfo){
		this.baseInfo=baseInfo;
	}
	public String getMembershipLevel(){
		return membershipLevel;
	}
	
	public void setMembershipLevel(String membershipLevel){
		this.membershipLevel=membershipLevel;
	}
	public String getRecommendOpinion(){
		return recommendOpinion;
	}
	
	public void setRecommendOpinion(String recommendOpinion){
		this.recommendOpinion=recommendOpinion;
	}
	public String getRatificationStatus(){
		return ratificationStatus;
	}
	
	public void setRatificationStatus(String ratificationStatus){
		this.ratificationStatus=ratificationStatus;
	}
	public String getIsSponsor(){
		return isSponsor;
	}
	
	public void setIsSponsor(String isSponsor){
		this.isSponsor=isSponsor;
	}
   
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
}