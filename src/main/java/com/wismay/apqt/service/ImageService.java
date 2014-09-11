package com.wismay.apqt.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wismay.apqt.entity.Image;
import com.wismay.apqt.repository.ImageDao;

/**
 * 
 * 
 * @author Peter
 */
// Spring Service Bean的标识.
@Component
public class ImageService {

	private static Logger logger = LoggerFactory.getLogger(ImageService.class);

	@Autowired
	private ImageDao imageDao;

	public Image getById(String uuid) {
		return imageDao.getById(uuid);
	}

	public List<Image> search(Image image) {
		return imageDao.search(image);
	}

	public void save(Image image) {
		imageDao.save(image);
	}

	public void update(Image image) {
		imageDao.update(image);
	}

	/**
	 * 软删除
	 */
	public void delete(String uuid) {
		imageDao.delete(uuid);
	}
}
