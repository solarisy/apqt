package com.wismay.apqt.web.certification;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.imgscalr.Scalr;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.wismay.apqt.comm.Role;
import com.wismay.apqt.entity.Company;
import com.wismay.apqt.entity.Image;
import com.wismay.apqt.service.CompanyService;
import com.wismay.apqt.service.ImageService;
import com.wismay.apqt.service.account.AccountService;
import com.wismay.apqt.service.account.ShiroDbRealm.ShiroUser;

/**
 * 公司认证管理
 * 
 * @author Peter
 */
@Controller
@RequestMapping(value = "/cert/company")
public class CertificationCompanyController {

	@Value("#{settings['file.upload.directory']}")
	private String fileUploadDirectory;

	private static Logger logger = LoggerFactory.getLogger(AccountService.class);

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		SimpleDateFormat dateFormat2 = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat2, true));
	}

	@Autowired
	private CompanyService companyService;

	@Autowired
	private ImageService imageService;

	// 新增
	@RequestMapping(value = "create", method = RequestMethod.GET)
	public String toCreateForm(Model model) {
		model.addAttribute("action", "save");
		return "certification/company/companyForm";
	}

	// 新增保存
	@RequestMapping(value = "save", method = RequestMethod.POST)
	public String createSave(@ModelAttribute("company") Company company, RedirectAttributes redirectAttributes, Model model) {
		company.setCreateUser(getCurrentUser().id);
		company.setCreateDate(new Date());
		company.setProxy(getCurrentUser().getProxy());

		String role = getCurrentUser().getRoles();

		// 审核状态 0：未审核(代理提交)；1：未审核(平台管理员提交)；2：代理管理员审核通过；
		// 3：代理管理员审核不通过；4：平台管理员审核通过；5：平台管理员神不通过。
		if (role.contains(Role.proxy_admin) || role.contains(Role.proxy_user)) {
			company.setAuditStatus(0L);
		} else {
			company.setAuditStatus(1L);
		}

		companyService.save(company);
		return "redirect:/cert/company/imageForm/" + company.getId() + "/create";
	}

	// to 公司图片 Form
	@RequestMapping(value = "imageForm/{id}/{action}", method = RequestMethod.GET)
	public String saveImagesForm(@PathVariable("id") Long id, @PathVariable("action") String action, Model model) {
		Company company = new Company();
		company.setId(id);
		model.addAttribute("company", company);
		model.addAttribute("action", action);
		return "certification/company/companyImageForm";
	}

	// 审核列表
	@RequestMapping(value = "audit/list")
	public String auditList(Model model) {

		Company company = new Company();
		List<Long> status = new ArrayList<Long>();

		String role = getCurrentUser().getRoles();

		// 代理管理员，看到自己的代理人员提交的信息
		if (role.contains(Role.proxy_admin)) {
			company.setProxy(getCurrentUser().getProxy());

			// 审核状态 0：未审核(代理提交)；1：未审核(平台管理员提交)；2：代理管理员审核通过；
			// 3：代理管理员审核不通过；4：平台管理员审核通过；5：平台管理员神不通过。
			status.add(0L);// 未审核(代理提交)
		}
		// 平台管理员看到所有代理人员提交的信息 和非代理提交的信息（平台管理员，超管也可以提交公司信息）
		else {
			status.add(2L);// 2：代理管理员审核通过；
			status.add(1L);// 1：未审核(平台管理员提交 或超管提交)；
		}

		company.setAuditStatusList(status);
		model.addAttribute("list", companyService.search(company));

		return "certification/company/companyAuditList";
	}

	// to 审核页面
	@RequestMapping(value = "audit/{id}", method = RequestMethod.GET)
	public String audit(@PathVariable("id") Long id, Model model) {

		model.addAttribute("company", companyService.getById(id));

		Image image = new Image();
		image.setTableId(id);
		image.setTableName("t_company");
		model.addAttribute("imageList", imageService.search(image));

		return "certification/company/companyAudit";
	}

	// 审核保存
	@RequestMapping(value = "audit/save", method = RequestMethod.POST)
	public String auditSave(@Valid @ModelAttribute("company") Company company, Model model) {
		String role = getCurrentUser().getRoles();
		// 前端使用checkbox，选择为通过=1，否则是null，如果是null，说明是审核不通过。
		if (company.getAuditStatus() == null || company.getAuditStatus() == 0) {
			// 审核状态 0：未审核(代理提交)；1：未审核(平台管理员提交)；2：代理管理员审核通过；
			// 3：代理管理员审核不通过；4：平台管理员审核通过；5：平台管理员神不通过。
			if (role.contains(Role.proxy_admin)) {
				company.setAuditStatus(3L);// 审核不通过
			} else {
				company.setAuditStatus(5L);// 审核不通过
			}
		} else {
			if (role.contains(Role.proxy_admin)) {
				company.setAuditStatus(2L);// 审核不通过
			} else {
				company.setAuditStatus(4L);// 审核不通过
			}
		}
		companyService.update(company);
		model.addAttribute("company", companyService.getById(company.getId()));

		return "certification/company/companyAuditResult";
	}

	/**
	 * 公司列表
	 * 
	 * @param model
	 * @return
	 *         2014-8-24
	 *         Thinkpad
	 */
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String list(Model model) {
		Company company = new Company();
		List<Long> status = new ArrayList<Long>();

		String role = getCurrentUser().getRoles();

		// 代理管理员、代理人员:看到自己的代理人员提交的信息
		if (role.contains(Role.proxy_admin) || role.contains(Role.proxy_user)) {
			company.setProxy(getCurrentUser().getProxy());
		}

		// 审核状态 0：未审核(代理提交)；1：未审核(平台管理员提交)；2：代理管理员审核通过；
		// 3：代理管理员审核不通过；4：平台管理员审核通过；5：平台管理员神不通过。
		status.add(2L);// 未审核(代理提交)
		status.add(3L);
		status.add(4L);
		status.add(5L);

		company.setAuditStatusList(status);
		model.addAttribute("list", companyService.search(company));
		return "certification/company/companyList";
	}

	// 详情 （公司列表页面进入）
	@RequestMapping(value = "detail/{id}/{action}", method = RequestMethod.GET)
	public String detail(@PathVariable("id") Long id, @PathVariable("action") String action, Model model) {
		model.addAttribute("company", companyService.getById(id));

		Image image = new Image();
		image.setTableId(id);
		image.setTableName("t_company");
		model.addAttribute("imageList", imageService.search(image));
		model.addAttribute("action", action);

		return "certification/company/companyDetail";
	}

	// 详情 （公司审核列表页面进入）
	@RequestMapping(value = "detail-audit/{id}/{action}", method = RequestMethod.GET)
	public String detailAudit(@PathVariable("id") Long id, @PathVariable("action") String action, Model model) {
		model.addAttribute("company", companyService.getById(id));

		Image image = new Image();
		image.setTableId(id);
		image.setTableName("t_company");
		model.addAttribute("imageList", imageService.search(image));
		model.addAttribute("action", action);

		return "certification/company/companyDetail-audit";
	}

	// 诚信码
	@RequestMapping(value = "certcode/{id}", method = RequestMethod.GET)
	public String certcodeFrom(@PathVariable("id") Long id, Model model) {
		model.addAttribute("company", companyService.getById(id));
		return "certification/company/certcodeSection";
	}

	// 诚信码 save
	@RequestMapping(value = "certcode/save")
	public String saveCertcode(@ModelAttribute("company") Company company, RedirectAttributes redirectAttributes) {
		companyService.update(company);
		redirectAttributes.addFlashAttribute("message", "诚信码设置成功");
		return "redirect:/cert/company/list";
	}

	// 编辑
	@RequestMapping(value = "update/{id}", method = RequestMethod.GET)
	public String updateForm(@PathVariable("id") Long id, Model model) {
		model.addAttribute("company", companyService.getById(id));
		model.addAttribute("action", "update");
		return "certification/company/companyForm";
	}

	// 编辑保存
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String updateSave(@Valid @ModelAttribute("company") Company company, RedirectAttributes redirectAttributes) {
		companyService.update(company);
		redirectAttributes.addFlashAttribute("message", "更新成功");

		return "redirect:/cert/company/imageForm/" + company.getId() + "/update";
	}

	@RequestMapping(value = "delete/{id}", method = RequestMethod.GET)
	public String delete(@PathVariable("id") Long id, RedirectAttributes redirectAttributes) {
		companyService.delete(id);
		redirectAttributes.addFlashAttribute("message", "删除成功");
		return "redirect:/cert/company/list";
	}

	// 上传图片
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> upload(MultipartHttpServletRequest request, HttpServletResponse response) {
		logger.debug("uploadPost called");
		Iterator<String> itr = request.getFileNames();
		String str_id = request.getParameter("id");
		Long table_id = 0L;
		if (StringUtils.isNotEmpty(str_id)) {
			table_id = Long.parseLong(str_id);
		}
		MultipartFile mpf;
		List<Image> list = new LinkedList<Image>();

		while (itr.hasNext()) {
			mpf = request.getFile(itr.next());
			logger.debug("Uploading {}", mpf.getOriginalFilename());

			String newFilenameBase = UUID.randomUUID().toString();
			String originalFileExtension = mpf.getOriginalFilename().substring(mpf.getOriginalFilename().lastIndexOf("."));
			String newFilename = newFilenameBase + originalFileExtension;
			// String storageDirectory = fileUploadDirectory;
			String storageDirectory = getImageDir(request);// 绝对路径

			String contentType = mpf.getContentType();

			File newFile = new File(storageDirectory + File.separator + newFilename);
			try {
				mpf.transferTo(newFile);

				BufferedImage thumbnail = Scalr.resize(ImageIO.read(newFile), 290);
				String thumbnailFilename = newFilenameBase + "-thumbnail.png";
				File thumbnailFile = new File(storageDirectory + File.separator + thumbnailFilename);
				ImageIO.write(thumbnail, "png", thumbnailFile);

				Image image = new Image();
				image.setName(mpf.getOriginalFilename());
				image.setSize(mpf.getSize());
				image.setThumbnailFilename(thumbnailFilename);
				image.setThumbnailSize(thumbnailFile.length());
				image.setNewFilename(newFilename);
				image.setContentType(contentType);
				image.setCreateDate(new Date());
				image.setUpdateDate(new Date());
				image.setCreateUser(getCurrentUser().getId());
				image.setTableId(table_id);
				image.setTableName("t_company");

				imageService.save(image);

				image.setUrl(image.getNewFilename());
				image.setThumbnailUrl(image.getThumbnailFilename());
				image.setDeleteUrl("/delete/" + image.getId());
				image.setDeleteType("DELETE");

				list.add(image);

			} catch (IOException e) {
				logger.error("Could not upload file " + mpf.getOriginalFilename(), e);
			}

		}

		Map<String, Object> files = new HashMap<String, Object>();
		files.put("files", list);
		return files;
	}

	// 查询原有的图片
	@RequestMapping(value = "images/{tableId}", method = RequestMethod.GET)
	@ResponseBody
	public Map imageList(@PathVariable("tableId") Long tableId) {
		logger.debug("uploadGet called");
		Image e = new Image();
		e.setTableId(tableId);
		e.setTableName("t_company");
		List<Image> list = imageService.search(e);

		for (Image image : list) {
			image.setUrl(image.getNewFilename());
			image.setThumbnailUrl(image.getThumbnailFilename());
			image.setDeleteUrl("cert/company/delete/image/" + image.getId());
			image.setDeleteType("DELETE");
		}
		Map<String, Object> files = new HashMap<String, Object>();
		files.put("files", list);
		logger.debug("Returning: {}", files);
		return files;
	}

	@RequestMapping(value = "delete/image/{id}", method = RequestMethod.DELETE)
	@ResponseBody
	public List<Map<String, Object>> deleteImage(@PathVariable("id") String id, HttpServletRequest request) {
		// Image image = imageService.getById(id);
		// 暂时不删除文件
		// File imageFile = new File(getImageDir(request) + File.separator + image.getNewFilename());
		// imageFile.delete();
		// File thumbnailFile = new File(getImageDir(request) + File.separator + image.getThumbnailFilename());
		// thumbnailFile.delete();

		imageService.delete(id);

		List<Map<String, Object>> results = new ArrayList<Map<String, Object>>();
		Map<String, Object> success = new HashMap<String, Object>();
		success.put("success", true);
		results.add(success);
		return results;
	}

	private String getImageDir(MultipartHttpServletRequest request) {
		return request.getSession().getServletContext().getRealPath("") + File.separator + fileUploadDirectory;// E:\Tomcat\webapps\TEST
	}

	public ShiroUser getCurrentUser() {
		ShiroUser user = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
		return user;
	}

}
