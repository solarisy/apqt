/*
 * The MIT License
 *
 * Copyright 2013 jdmr.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */
package com.wismay.apqt.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonIgnore;

/**
 * 
 * @author peter
 */
public class Image implements Serializable {
	private static final long serialVersionUID = 1L;
	private String id;
	private Date updateDate;
	private Date createDate;
	private Long createUser;
	private Long deleted = 1L;
	private String tableName;
	private Long tableId;
	private Long sequence;
	private String name;
	private Long size;
	private String thumbnailFilename;
	private Long thumbnailSize;
	private String newFilename;
	private String contentType;
	@Transient
	private String url;
	@Transient
	private String thumbnailUrl;
	@Transient
	private String deleteUrl;
	@Transient
	private String deleteType;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Image() {
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

	@JsonIgnore
	public Long getCreateUser() {
		return createUser;
	}

	public void setCreateUser(Long createUser) {
		this.createUser = createUser;
	}

	@JsonIgnore
	public Long getDeleted() {
		return deleted;
	}

	public void setDeleted(Long deleted) {
		this.deleted = deleted;
	}

	@JsonIgnore
	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	@JsonIgnore
	public Long getTableId() {
		return tableId;
	}

	public void setTableId(Long tableId) {
		this.tableId = tableId;
	}

	public Long getSequence() {
		return sequence;
	}

	public void setSequence(Long sequence) {
		this.sequence = sequence;
	}

	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name
	 *            the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @return the thumbnailFilename
	 */
	@JsonIgnore
	public String getThumbnailFilename() {
		return thumbnailFilename;
	}

	/**
	 * @param thumbnailFilename
	 *            the thumbnailFilename to set
	 */
	public void setThumbnailFilename(String thumbnailFilename) {
		this.thumbnailFilename = thumbnailFilename;
	}

	/**
	 * @return the newFilename
	 */
	@JsonIgnore
	public String getNewFilename() {
		return newFilename;
	}

	/**
	 * @param newFilename
	 *            the newFilename to set
	 */
	public void setNewFilename(String newFilename) {
		this.newFilename = newFilename;
	}

	/**
	 * @return the contentType
	 */
	@JsonIgnore
	public String getContentType() {
		return contentType;
	}

	/**
	 * @param contentType
	 *            the contentType to set
	 */
	public void setContentType(String contentType) {
		this.contentType = contentType;
	}

	/**
	 * @return the size
	 */
	public Long getSize() {
		return size;
	}

	/**
	 * @param size
	 *            the size to set
	 */
	public void setSize(Long size) {
		this.size = size;
	}

	/**
	 * @return the thumbnailSize
	 */
	public Long getThumbnailSize() {
		return thumbnailSize;
	}

	/**
	 * @param thumbnailSize
	 *            the thumbnailSize to set
	 */
	public void setThumbnailSize(Long thumbnailSize) {
		this.thumbnailSize = thumbnailSize;
	}

	/**
	 * @return the url
	 */
	public String getUrl() {
		return url;
	}

	/**
	 * @param url
	 *            the url to set
	 */
	public void setUrl(String url) {
		this.url = url;
	}

	/**
	 * @return the thumbnailUrl
	 */
	public String getThumbnailUrl() {
		return thumbnailUrl;
	}

	/**
	 * @param thumbnailUrl
	 *            the thumbnailUrl to set
	 */
	public void setThumbnailUrl(String thumbnailUrl) {
		this.thumbnailUrl = thumbnailUrl;
	}

	/**
	 * @return the deleteUrl
	 */
	public String getDeleteUrl() {
		return deleteUrl;
	}

	/**
	 * @param deleteUrl
	 *            the deleteUrl to set
	 */
	public void setDeleteUrl(String deleteUrl) {
		this.deleteUrl = deleteUrl;
	}

	/**
	 * @return the deleteType
	 */
	public String getDeleteType() {
		return deleteType;
	}

	/**
	 * @param deleteType
	 *            the deleteType to set
	 */
	public void setDeleteType(String deleteType) {
		this.deleteType = deleteType;
	}

	@Override
	public String toString() {
		return "Image{" + "name=" + name + ", thumbnailFilename=" + thumbnailFilename + ", newFilename=" + newFilename + ", contentType=" + contentType + ", url=" + url + ", thumbnailUrl="
				+ thumbnailUrl + ", deleteUrl=" + deleteUrl + ", deleteType=" + deleteType + '}';
	}

}
