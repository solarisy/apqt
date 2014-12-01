package com.wismay.apqt.webservice.rest.sms;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

import org.apache.commons.lang3.builder.ToStringBuilder;

/**
 * 对应请求POST请求的XML格式的消息体，xml格式如下:
 * 
 * <pre>
 *  <?xml version="1.0" encoding="gb2312"?>
 * <SmsMessage>
 *   <MessageID></MessageID> 
 *   <Mobile></Mobile> 
 *   <Message></Message> 
 *   <MobaddrName></MobaddrName> 
 *   <MobaddrCode></MobaddrCode> 
 *   <ReceiveDate></ReceiveDate> 
 *   <ServiceRequireType></ServiceRequireType> 
 *   <ServiceRequireinfo></ServiceRequireinfo> 
 *   <SmsServiceCode></SmsServiceCode> 
 *   <SmsSubServiceCode></SmsSubServiceCode> 
 *   <Telcom></Telcom> 
 *   <Protocolname></Protocolname> 
 *   <MobileAttachId></MobileAttachId> 
 *   <MobileAttach></MobileAttach> 
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
public class CertcodeSearchRequest {

	private String messageID;
	private String mobile;
	private String message;
	private String mobaddrName;
	private String mobaddrCode;
	private String receiveDate;
	private String serviceRequireType;
	private String serviceRequireinfo;
	private String smsServiceCode;
	private String smsSubServiceCode;
	private String telcom;
	private String protocolname;
	private String mobileAttachId;
	private String mobileAttach;
	private String linkID;

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

	@XmlElement(name = "MobaddrCode")
	public String getMobaddrCode() {
		return mobaddrCode;
	}

	public void setMobaddrCode(String mobaddrCode) {
		this.mobaddrCode = mobaddrCode;
	}

	@XmlElement(name = "ReceiveDate")
	public String getReceiveDate() {
		return receiveDate;
	}

	public void setReceiveDate(String receiveDate) {
		this.receiveDate = receiveDate;
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

	@XmlElement(name = "SmsServiceCode")
	public String getSmsServiceCode() {
		return smsServiceCode;
	}

	public void setSmsServiceCode(String smsServiceCode) {
		this.smsServiceCode = smsServiceCode;
	}

	@XmlElement(name = "SmsSubServiceCode")
	public String getSmsSubServiceCode() {
		return smsSubServiceCode;
	}

	public void setSmsSubServiceCode(String smsSubServiceCode) {
		this.smsSubServiceCode = smsSubServiceCode;
	}

	@XmlElement(name = "Telcom")
	public String getTelcom() {
		return telcom;
	}

	public void setTelcom(String telcom) {
		this.telcom = telcom;
	}

	@XmlElement(name = "Protocolname")
	public String getProtocolname() {
		return protocolname;
	}

	public void setProtocolname(String protocolname) {
		this.protocolname = protocolname;
	}

	@XmlElement(name = "MobileAttachId")
	public String getMobileAttachId() {
		return mobileAttachId;
	}

	public void setMobileAttachId(String mobileAttachId) {
		this.mobileAttachId = mobileAttachId;
	}

	@XmlElement(name = "MobileAttach")
	public String getMobileAttach() {
		return mobileAttach;
	}

	public void setMobileAttach(String mobileAttach) {
		this.mobileAttach = mobileAttach;
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
