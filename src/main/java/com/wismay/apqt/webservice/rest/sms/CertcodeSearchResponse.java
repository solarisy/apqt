package com.wismay.apqt.webservice.rest.sms;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

import org.apache.commons.lang3.builder.ToStringBuilder;

/**
 * 对应请求POST响应的XML格式的消息体，xml格式如下:
 * 
 * <pre>
 *  <?xml version="1.0" encoding="gb2312"?>
 * <SmsMessage>
 *   <MessageID></MessageID> 
 *   <Mobile></Mobile> 
 *   <Message></Message> 
 *   <MobaddrName></MobaddrName> 
 *   <ServiceType></ServiceType> 
 *   <ServiceLevel></ServiceLevel> 
 *   <ServiceRequireType></ServiceRequireType> 
 *   <ServiceRequireinfo></ServiceRequireinfo> 
 *   <ServiceAccessType></ServiceAccessType> 
 *   <ServiceAccessInfo></ServiceAccessInfo> 
 *   <MessageFmt></MessageFmt> 
 *   <ServiceCode></ServiceCode> 
 *   <SmsSubServiceCode></SmsSubServiceCode> 
 *   <WAPPUSHURL></WAPPUSHURL> 
 *   <LinkID></LinkID> 
 * </SmsMessage>
 * 
 * </pre>
 * 
 * @author Wang Peng
 *         2014-9-16
 * 
 */
@XmlRootElement(name = "SmsMessage")
public class CertcodeSearchResponse {
	private String messageID = "";
	private String mobile = "";
	private String message = "";
	private String mobaddrName = "";
	private String serviceType = "";
	private String serviceLevel = "";
	private String serviceRequireType = "";
	private String serviceRequireinfo = "";
	private String serviceAccessType = "SMS";
	private String serviceAccessInfo = "";
	private String messageFmt = "15";
	private String serviceCode = "";
	private String smsSubServiceCode = "";
	private String wAPPUSHURL = "";
	private String linkID = "";

	@XmlElement(name = "MessageID")
	public String getMessageID() {
		return messageID;
	}

	public void setMessageID(String messageID) {
		this.messageID = messageID;
	}

	@XmlElement(name = "Mobile")
	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	@XmlElement(name = "Message")
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	@XmlElement(name = "MobaddrName")
	public String getMobaddrName() {
		return mobaddrName;
	}

	public void setMobaddrName(String mobaddrName) {
		this.mobaddrName = mobaddrName;
	}

	@XmlElement(name = "ServiceType")
	public String getServiceType() {
		return serviceType;
	}

	public void setServiceType(String serviceType) {
		this.serviceType = serviceType;
	}

	@XmlElement(name = "ServiceLevel")
	public String getServiceLevel() {
		return serviceLevel;
	}

	public void setServiceLevel(String serviceLevel) {
		this.serviceLevel = serviceLevel;
	}

	@XmlElement(name = "ServiceRequireType")
	public String getServiceRequireType() {
		return serviceRequireType;
	}

	public void setServiceRequireType(String serviceRequireType) {
		this.serviceRequireType = serviceRequireType;
	}

	@XmlElement(name = "ServiceRequireinfo")
	public String getServiceRequireinfo() {
		return serviceRequireinfo;
	}

	public void setServiceRequireinfo(String serviceRequireinfo) {
		this.serviceRequireinfo = serviceRequireinfo;
	}

	@XmlElement(name = "ServiceAccessType")
	public String getServiceAccessType() {
		return serviceAccessType;
	}

	public void setServiceAccessType(String serviceAccessType) {
		this.serviceAccessType = serviceAccessType;
	}

	@XmlElement(name = "ServiceAccessInfo")
	public String getServiceAccessInfo() {
		return serviceAccessInfo;
	}

	public void setServiceAccessInfo(String serviceAccessInfo) {
		this.serviceAccessInfo = serviceAccessInfo;
	}

	@XmlElement(name = "MessageFmt")
	public String getMessageFmt() {
		return messageFmt;
	}

	public void setMessageFmt(String messageFmt) {
		this.messageFmt = messageFmt;
	}

	@XmlElement(name = "ServiceCode")
	public String getServiceCode() {
		return serviceCode;
	}

	public void setServiceCode(String serviceCode) {
		this.serviceCode = serviceCode;
	}

	@XmlElement(name = "SmsSubServiceCode")
	public String getSmsSubServiceCode() {
		return smsSubServiceCode;
	}

	public void setSmsSubServiceCode(String smsSubServiceCode) {
		this.smsSubServiceCode = smsSubServiceCode;
	}

	@XmlElement(name = "WAPPUSHURL")
	public String getwAPPUSHURL() {
		return wAPPUSHURL;
	}

	public void setwAPPUSHURL(String wAPPUSHURL) {
		this.wAPPUSHURL = wAPPUSHURL;
	}

	@XmlElement(name = "LinkID")
	public String getLinkID() {
		return linkID;
	}

	public void setLinkID(String linkID) {
		this.linkID = linkID;
	}

	/**
	 * 重新实现toString()函数方便在日志中打印DTO信息.
	 */
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
}
