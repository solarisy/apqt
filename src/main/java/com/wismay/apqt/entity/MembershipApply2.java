package com.wismay.apqt.entity;

import java.util.Date;
import org.apache.commons.lang3.builder.ToStringBuilder;


public class MembershipApply2 {

	public MembershipApply2() {
	}
	
	private Long id; //
	private Date updateDate; //
	private Date createDate; //
	private Long createUser; //
	private Long deleted; //删除标识 1：使用；0：删除；
	private String code; //档案编号
	private String unitName; //单位名称(全称)
	private String unitRegNumber; //注册机关及文号
	private String unitProperty; //单位性质
	private String unitAddress; //单位地址
	private String unitZip; //邮编
	private String unitGoverning; //是否申请理事单位
	private String unitUrl; //单位网址
	private String ceoName; //负责人姓名
	private String ceoSex; //性别
	private String ceoAge; //年龄
	private String ceoEducation; //学历
	private String ceoJobTitle; //职称
	private String ceoEthnic; //民族
	private String ceoIdNumber; //身份证号
	private String ceoPosition; //职务
	private String ceoPhone; //电话
	private String ceoMobilePhone; //手机
	private Date cvStart; //个人简历_起
	private Date cvEnd; //个人简历_止
	private String cvUnit; //个人简历_单位
	private String cvPosition; //个人简历_职务/职称
	private String cvPartTime; //个人简历_主要兼职
	private Date cvStart2; //个人简历_起2
	private Date cvEnd2; //个人简历_止2
	private String cvUnit2; //个人简历_单位2
	private String cvPosition2; //个人简历_职务/职称2
	private String cvPartTime2; //个人简历_主要兼职2
	private Date cvStart3; //个人简历_起3
	private Date cvEnd3; //个人简历_止3
	private String cvUnit3; //个人简历_单位3
	private String cvPosition3; //个人简历_职务/职称3
	private String cvPartTime3; //个人简历_主要兼职3
	private Date cvStart4; //个人简历_起4
	private Date cvEnd4; //个人简历_止4
	private String cvUnit4; //个人简历_单位4
	private String cvPosition4; //个人简历_职务/职称4
	private String cvPartTime4; //个人简历_主要兼职4
	private Date cvStart5; //个人简历_起5
	private Date cvEnd5; //个人简历_止5
	private String cvUnit5; //个人简历_单位5
	private String cvPosition5; //个人简历_职务/职称5
	private String cvPartTime5; //个人简历_主要兼职5
	private Date cvStart6; //个人简历_起6
	private Date cvEnd6; //个人简历_止6
	private String cvUnit6; //个人简历_单位6
	private String cvPosition6; //个人简历_职务/职称6
	private String cvPartTime6; //个人简历_主要兼职6
	private Date cvStart7; //个人简历_起7
	private Date cvEnd7; //个人简历_止7
	private String cvUnit7; //个人简历_单位7
	private String cvPosition7; //个人简历_职务/职称7
	private String cvPartTime7; //个人简历_主要兼职7
	private String contectsName; //联系人姓名
	private String contectsPosition; //联系人职务
	private String contectsMobilePhone; //联系人手机
	private String contectsPhone; //联系人电话
	private String contectsFax; //联系人传真
	private String contectsEmail; //联系人Email
	private String unitSummary; //单位简介包括发展概况、主要业务及其规模等
	private String unitProduct; //主要产品及特点
	private String unitAnnualTurnover; //年营业额
	private String unitIdea; //对协会有何希望及要求
	private String approvalComments; //审批意见
	private String approvalUserName; //审批人姓名
	private Long approvalUserId; //审批人Id
	private Date approvalDate; //审批日期
    
    /**
     *
     **/
	public Long getId(){
		return id;
	}
	
	/**
	 *
	 **/
	public void setId(Long id){
		this.id=id;
	}
    /**
     *
     **/
	public Date getUpdateDate(){
		return updateDate;
	}
	
	/**
	 *
	 **/
	public void setUpdateDate(Date updateDate){
		this.updateDate=updateDate;
	}
    /**
     *
     **/
	public Date getCreateDate(){
		return createDate;
	}
	
	/**
	 *
	 **/
	public void setCreateDate(Date createDate){
		this.createDate=createDate;
	}
    /**
     *
     **/
	public Long getCreateUser(){
		return createUser;
	}
	
	/**
	 *
	 **/
	public void setCreateUser(Long createUser){
		this.createUser=createUser;
	}
    /**
     *删除标识 1：使用；0：删除；
     **/
	public Long getDeleted(){
		return deleted;
	}
	
	/**
	 *删除标识 1：使用；0：删除；
	 **/
	public void setDeleted(Long deleted){
		this.deleted=deleted;
	}
    /**
     *档案编号
     **/
	public String getCode(){
		return code;
	}
	
	/**
	 *档案编号
	 **/
	public void setCode(String code){
		this.code=code;
	}
    /**
     *单位名称(全称)
     **/
	public String getUnitName(){
		return unitName;
	}
	
	/**
	 *单位名称(全称)
	 **/
	public void setUnitName(String unitName){
		this.unitName=unitName;
	}
    /**
     *注册机关及文号
     **/
	public String getUnitRegNumber(){
		return unitRegNumber;
	}
	
	/**
	 *注册机关及文号
	 **/
	public void setUnitRegNumber(String unitRegNumber){
		this.unitRegNumber=unitRegNumber;
	}
    /**
     *单位性质
     **/
	public String getUnitProperty(){
		return unitProperty;
	}
	
	/**
	 *单位性质
	 **/
	public void setUnitProperty(String unitProperty){
		this.unitProperty=unitProperty;
	}
    /**
     *单位地址
     **/
	public String getUnitAddress(){
		return unitAddress;
	}
	
	/**
	 *单位地址
	 **/
	public void setUnitAddress(String unitAddress){
		this.unitAddress=unitAddress;
	}
    /**
     *邮编
     **/
	public String getUnitZip(){
		return unitZip;
	}
	
	/**
	 *邮编
	 **/
	public void setUnitZip(String unitZip){
		this.unitZip=unitZip;
	}
    /**
     *是否申请理事单位
     **/
	public String getUnitGoverning(){
		return unitGoverning;
	}
	
	/**
	 *是否申请理事单位
	 **/
	public void setUnitGoverning(String unitGoverning){
		this.unitGoverning=unitGoverning;
	}
    /**
     *单位网址
     **/
	public String getUnitUrl(){
		return unitUrl;
	}
	
	/**
	 *单位网址
	 **/
	public void setUnitUrl(String unitUrl){
		this.unitUrl=unitUrl;
	}
    /**
     *负责人姓名
     **/
	public String getCeoName(){
		return ceoName;
	}
	
	/**
	 *负责人姓名
	 **/
	public void setCeoName(String ceoName){
		this.ceoName=ceoName;
	}
    /**
     *性别
     **/
	public String getCeoSex(){
		return ceoSex;
	}
	
	/**
	 *性别
	 **/
	public void setCeoSex(String ceoSex){
		this.ceoSex=ceoSex;
	}
    /**
     *年龄
     **/
	public String getCeoAge(){
		return ceoAge;
	}
	
	/**
	 *年龄
	 **/
	public void setCeoAge(String ceoAge){
		this.ceoAge=ceoAge;
	}
    /**
     *学历
     **/
	public String getCeoEducation(){
		return ceoEducation;
	}
	
	/**
	 *学历
	 **/
	public void setCeoEducation(String ceoEducation){
		this.ceoEducation=ceoEducation;
	}
    /**
     *职称
     **/
	public String getCeoJobTitle(){
		return ceoJobTitle;
	}
	
	/**
	 *职称
	 **/
	public void setCeoJobTitle(String ceoJobTitle){
		this.ceoJobTitle=ceoJobTitle;
	}
    /**
     *民族
     **/
	public String getCeoEthnic(){
		return ceoEthnic;
	}
	
	/**
	 *民族
	 **/
	public void setCeoEthnic(String ceoEthnic){
		this.ceoEthnic=ceoEthnic;
	}
    /**
     *身份证号
     **/
	public String getCeoIdNumber(){
		return ceoIdNumber;
	}
	
	/**
	 *身份证号
	 **/
	public void setCeoIdNumber(String ceoIdNumber){
		this.ceoIdNumber=ceoIdNumber;
	}
    /**
     *职务
     **/
	public String getCeoPosition(){
		return ceoPosition;
	}
	
	/**
	 *职务
	 **/
	public void setCeoPosition(String ceoPosition){
		this.ceoPosition=ceoPosition;
	}
    /**
     *电话
     **/
	public String getCeoPhone(){
		return ceoPhone;
	}
	
	/**
	 *电话
	 **/
	public void setCeoPhone(String ceoPhone){
		this.ceoPhone=ceoPhone;
	}
    /**
     *手机
     **/
	public String getCeoMobilePhone(){
		return ceoMobilePhone;
	}
	
	/**
	 *手机
	 **/
	public void setCeoMobilePhone(String ceoMobilePhone){
		this.ceoMobilePhone=ceoMobilePhone;
	}
    /**
     *个人简历_起
     **/
	public Date getCvStart(){
		return cvStart;
	}
	
	/**
	 *个人简历_起
	 **/
	public void setCvStart(Date cvStart){
		this.cvStart=cvStart;
	}
    /**
     *个人简历_止
     **/
	public Date getCvEnd(){
		return cvEnd;
	}
	
	/**
	 *个人简历_止
	 **/
	public void setCvEnd(Date cvEnd){
		this.cvEnd=cvEnd;
	}
    /**
     *个人简历_单位
     **/
	public String getCvUnit(){
		return cvUnit;
	}
	
	/**
	 *个人简历_单位
	 **/
	public void setCvUnit(String cvUnit){
		this.cvUnit=cvUnit;
	}
    /**
     *个人简历_职务/职称
     **/
	public String getCvPosition(){
		return cvPosition;
	}
	
	/**
	 *个人简历_职务/职称
	 **/
	public void setCvPosition(String cvPosition){
		this.cvPosition=cvPosition;
	}
    /**
     *个人简历_主要兼职
     **/
	public String getCvPartTime(){
		return cvPartTime;
	}
	
	/**
	 *个人简历_主要兼职
	 **/
	public void setCvPartTime(String cvPartTime){
		this.cvPartTime=cvPartTime;
	}
    /**
     *个人简历_起2
     **/
	public Date getCvStart2(){
		return cvStart2;
	}
	
	/**
	 *个人简历_起2
	 **/
	public void setCvStart2(Date cvStart2){
		this.cvStart2=cvStart2;
	}
    /**
     *个人简历_止2
     **/
	public Date getCvEnd2(){
		return cvEnd2;
	}
	
	/**
	 *个人简历_止2
	 **/
	public void setCvEnd2(Date cvEnd2){
		this.cvEnd2=cvEnd2;
	}
    /**
     *个人简历_单位2
     **/
	public String getCvUnit2(){
		return cvUnit2;
	}
	
	/**
	 *个人简历_单位2
	 **/
	public void setCvUnit2(String cvUnit2){
		this.cvUnit2=cvUnit2;
	}
    /**
     *个人简历_职务/职称2
     **/
	public String getCvPosition2(){
		return cvPosition2;
	}
	
	/**
	 *个人简历_职务/职称2
	 **/
	public void setCvPosition2(String cvPosition2){
		this.cvPosition2=cvPosition2;
	}
    /**
     *个人简历_主要兼职2
     **/
	public String getCvPartTime2(){
		return cvPartTime2;
	}
	
	/**
	 *个人简历_主要兼职2
	 **/
	public void setCvPartTime2(String cvPartTime2){
		this.cvPartTime2=cvPartTime2;
	}
    /**
     *个人简历_起3
     **/
	public Date getCvStart3(){
		return cvStart3;
	}
	
	/**
	 *个人简历_起3
	 **/
	public void setCvStart3(Date cvStart3){
		this.cvStart3=cvStart3;
	}
    /**
     *个人简历_止3
     **/
	public Date getCvEnd3(){
		return cvEnd3;
	}
	
	/**
	 *个人简历_止3
	 **/
	public void setCvEnd3(Date cvEnd3){
		this.cvEnd3=cvEnd3;
	}
    /**
     *个人简历_单位3
     **/
	public String getCvUnit3(){
		return cvUnit3;
	}
	
	/**
	 *个人简历_单位3
	 **/
	public void setCvUnit3(String cvUnit3){
		this.cvUnit3=cvUnit3;
	}
    /**
     *个人简历_职务/职称3
     **/
	public String getCvPosition3(){
		return cvPosition3;
	}
	
	/**
	 *个人简历_职务/职称3
	 **/
	public void setCvPosition3(String cvPosition3){
		this.cvPosition3=cvPosition3;
	}
    /**
     *个人简历_主要兼职3
     **/
	public String getCvPartTime3(){
		return cvPartTime3;
	}
	
	/**
	 *个人简历_主要兼职3
	 **/
	public void setCvPartTime3(String cvPartTime3){
		this.cvPartTime3=cvPartTime3;
	}
    /**
     *个人简历_起4
     **/
	public Date getCvStart4(){
		return cvStart4;
	}
	
	/**
	 *个人简历_起4
	 **/
	public void setCvStart4(Date cvStart4){
		this.cvStart4=cvStart4;
	}
    /**
     *个人简历_止4
     **/
	public Date getCvEnd4(){
		return cvEnd4;
	}
	
	/**
	 *个人简历_止4
	 **/
	public void setCvEnd4(Date cvEnd4){
		this.cvEnd4=cvEnd4;
	}
    /**
     *个人简历_单位4
     **/
	public String getCvUnit4(){
		return cvUnit4;
	}
	
	/**
	 *个人简历_单位4
	 **/
	public void setCvUnit4(String cvUnit4){
		this.cvUnit4=cvUnit4;
	}
    /**
     *个人简历_职务/职称4
     **/
	public String getCvPosition4(){
		return cvPosition4;
	}
	
	/**
	 *个人简历_职务/职称4
	 **/
	public void setCvPosition4(String cvPosition4){
		this.cvPosition4=cvPosition4;
	}
    /**
     *个人简历_主要兼职4
     **/
	public String getCvPartTime4(){
		return cvPartTime4;
	}
	
	/**
	 *个人简历_主要兼职4
	 **/
	public void setCvPartTime4(String cvPartTime4){
		this.cvPartTime4=cvPartTime4;
	}
    /**
     *个人简历_起5
     **/
	public Date getCvStart5(){
		return cvStart5;
	}
	
	/**
	 *个人简历_起5
	 **/
	public void setCvStart5(Date cvStart5){
		this.cvStart5=cvStart5;
	}
    /**
     *个人简历_止5
     **/
	public Date getCvEnd5(){
		return cvEnd5;
	}
	
	/**
	 *个人简历_止5
	 **/
	public void setCvEnd5(Date cvEnd5){
		this.cvEnd5=cvEnd5;
	}
    /**
     *个人简历_单位5
     **/
	public String getCvUnit5(){
		return cvUnit5;
	}
	
	/**
	 *个人简历_单位5
	 **/
	public void setCvUnit5(String cvUnit5){
		this.cvUnit5=cvUnit5;
	}
    /**
     *个人简历_职务/职称5
     **/
	public String getCvPosition5(){
		return cvPosition5;
	}
	
	/**
	 *个人简历_职务/职称5
	 **/
	public void setCvPosition5(String cvPosition5){
		this.cvPosition5=cvPosition5;
	}
    /**
     *个人简历_主要兼职5
     **/
	public String getCvPartTime5(){
		return cvPartTime5;
	}
	
	/**
	 *个人简历_主要兼职5
	 **/
	public void setCvPartTime5(String cvPartTime5){
		this.cvPartTime5=cvPartTime5;
	}
    /**
     *个人简历_起6
     **/
	public Date getCvStart6(){
		return cvStart6;
	}
	
	/**
	 *个人简历_起6
	 **/
	public void setCvStart6(Date cvStart6){
		this.cvStart6=cvStart6;
	}
    /**
     *个人简历_止6
     **/
	public Date getCvEnd6(){
		return cvEnd6;
	}
	
	/**
	 *个人简历_止6
	 **/
	public void setCvEnd6(Date cvEnd6){
		this.cvEnd6=cvEnd6;
	}
    /**
     *个人简历_单位6
     **/
	public String getCvUnit6(){
		return cvUnit6;
	}
	
	/**
	 *个人简历_单位6
	 **/
	public void setCvUnit6(String cvUnit6){
		this.cvUnit6=cvUnit6;
	}
    /**
     *个人简历_职务/职称6
     **/
	public String getCvPosition6(){
		return cvPosition6;
	}
	
	/**
	 *个人简历_职务/职称6
	 **/
	public void setCvPosition6(String cvPosition6){
		this.cvPosition6=cvPosition6;
	}
    /**
     *个人简历_主要兼职6
     **/
	public String getCvPartTime6(){
		return cvPartTime6;
	}
	
	/**
	 *个人简历_主要兼职6
	 **/
	public void setCvPartTime6(String cvPartTime6){
		this.cvPartTime6=cvPartTime6;
	}
    /**
     *个人简历_起7
     **/
	public Date getCvStart7(){
		return cvStart7;
	}
	
	/**
	 *个人简历_起7
	 **/
	public void setCvStart7(Date cvStart7){
		this.cvStart7=cvStart7;
	}
    /**
     *个人简历_止7
     **/
	public Date getCvEnd7(){
		return cvEnd7;
	}
	
	/**
	 *个人简历_止7
	 **/
	public void setCvEnd7(Date cvEnd7){
		this.cvEnd7=cvEnd7;
	}
    /**
     *个人简历_单位7
     **/
	public String getCvUnit7(){
		return cvUnit7;
	}
	
	/**
	 *个人简历_单位7
	 **/
	public void setCvUnit7(String cvUnit7){
		this.cvUnit7=cvUnit7;
	}
    /**
     *个人简历_职务/职称7
     **/
	public String getCvPosition7(){
		return cvPosition7;
	}
	
	/**
	 *个人简历_职务/职称7
	 **/
	public void setCvPosition7(String cvPosition7){
		this.cvPosition7=cvPosition7;
	}
    /**
     *个人简历_主要兼职7
     **/
	public String getCvPartTime7(){
		return cvPartTime7;
	}
	
	/**
	 *个人简历_主要兼职7
	 **/
	public void setCvPartTime7(String cvPartTime7){
		this.cvPartTime7=cvPartTime7;
	}
    /**
     *联系人姓名
     **/
	public String getContectsName(){
		return contectsName;
	}
	
	/**
	 *联系人姓名
	 **/
	public void setContectsName(String contectsName){
		this.contectsName=contectsName;
	}
    /**
     *联系人职务
     **/
	public String getContectsPosition(){
		return contectsPosition;
	}
	
	/**
	 *联系人职务
	 **/
	public void setContectsPosition(String contectsPosition){
		this.contectsPosition=contectsPosition;
	}
    /**
     *联系人手机
     **/
	public String getContectsMobilePhone(){
		return contectsMobilePhone;
	}
	
	/**
	 *联系人手机
	 **/
	public void setContectsMobilePhone(String contectsMobilePhone){
		this.contectsMobilePhone=contectsMobilePhone;
	}
    /**
     *联系人电话
     **/
	public String getContectsPhone(){
		return contectsPhone;
	}
	
	/**
	 *联系人电话
	 **/
	public void setContectsPhone(String contectsPhone){
		this.contectsPhone=contectsPhone;
	}
    /**
     *联系人传真
     **/
	public String getContectsFax(){
		return contectsFax;
	}
	
	/**
	 *联系人传真
	 **/
	public void setContectsFax(String contectsFax){
		this.contectsFax=contectsFax;
	}
    /**
     *联系人Email
     **/
	public String getContectsEmail(){
		return contectsEmail;
	}
	
	/**
	 *联系人Email
	 **/
	public void setContectsEmail(String contectsEmail){
		this.contectsEmail=contectsEmail;
	}
    /**
     *单位简介包括发展概况、主要业务及其规模等
     **/
	public String getUnitSummary(){
		return unitSummary;
	}
	
	/**
	 *单位简介包括发展概况、主要业务及其规模等
	 **/
	public void setUnitSummary(String unitSummary){
		this.unitSummary=unitSummary;
	}
    /**
     *主要产品及特点
     **/
	public String getUnitProduct(){
		return unitProduct;
	}
	
	/**
	 *主要产品及特点
	 **/
	public void setUnitProduct(String unitProduct){
		this.unitProduct=unitProduct;
	}
    /**
     *年营业额
     **/
	public String getUnitAnnualTurnover(){
		return unitAnnualTurnover;
	}
	
	/**
	 *年营业额
	 **/
	public void setUnitAnnualTurnover(String unitAnnualTurnover){
		this.unitAnnualTurnover=unitAnnualTurnover;
	}
    /**
     *对协会有何希望及要求
     **/
	public String getUnitIdea(){
		return unitIdea;
	}
	
	/**
	 *对协会有何希望及要求
	 **/
	public void setUnitIdea(String unitIdea){
		this.unitIdea=unitIdea;
	}
    /**
     *审批意见
     **/
	public String getApprovalComments(){
		return approvalComments;
	}
	
	/**
	 *审批意见
	 **/
	public void setApprovalComments(String approvalComments){
		this.approvalComments=approvalComments;
	}
    /**
     *审批人姓名
     **/
	public String getApprovalUserName(){
		return approvalUserName;
	}
	
	/**
	 *审批人姓名
	 **/
	public void setApprovalUserName(String approvalUserName){
		this.approvalUserName=approvalUserName;
	}
    /**
     *审批人Id
     **/
	public Long getApprovalUserId(){
		return approvalUserId;
	}
	
	/**
	 *审批人Id
	 **/
	public void setApprovalUserId(Long approvalUserId){
		this.approvalUserId=approvalUserId;
	}
    /**
     *审批日期
     **/
	public Date getApprovalDate(){
		return approvalDate;
	}
	
	/**
	 *审批日期
	 **/
	public void setApprovalDate(Date approvalDate){
		this.approvalDate=approvalDate;
	}
   
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
}