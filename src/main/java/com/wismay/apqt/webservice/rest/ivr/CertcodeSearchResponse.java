package com.wismay.apqt.webservice.rest.ivr;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

import org.apache.commons.lang3.builder.ToStringBuilder;

/**
 * 对应请求POST请求的XML格式的消息体，xml格式如下:
 * 
 * <pre>
 * 
 * <?xml version="1.0" encoding="UTF-8"?>
 * <record>
 *   <flag>0</flag>
 *   <isError>0</isError>
 *   <hasAuth>0</hasAuth>
 *   <msg>********</msg>
 *   <from>***</from>
 * </record>
 * 
 * </pre>
 * 
 * @author Wang Peng
 *         2014-10-11
 * 
 */
@XmlRootElement(name = "record")
public class CertcodeSearchResponse {

	// 0公示信息；1授权信息
	private String flag = "0";

	// 0为查询正确，msg为查验的诚信信息；1为查询错误，此时，msg为错误原因文本
	private String isError = "0";

	// 仅对flag=0有效，0没有授权信息，1存在授权信息
	private String hasAuth = "0";

	// 当isError=0时为查询到的信息；当isError=1时，为错误原因文本
	private String msg;

	// 信息来源
	private String from;

	@XmlElement(name = "flag")
	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	@XmlElement(name = "isError")
	public String getIsError() {
		return isError;
	}

	public void setIsError(String isError) {
		this.isError = isError;
	}

	@XmlElement(name = "hasAuth")
	public String getHasAuth() {
		return hasAuth;
	}

	public void setHasAuth(String hasAuth) {
		this.hasAuth = hasAuth;
	}

	@XmlElement(name = "msg")
	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	@XmlElement(name = "from")
	public String getFrom() {
		return from;
	}

	public void setFrom(String from) {
		this.from = from;
	}

	/**
	 * 重新实现toString()函数方便在日志中打印DTO信息.
	 */
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
}
