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

import com.wismay.apqt.comm.AuditStatus;
import com.wismay.apqt.comm.DeletedFlag;
import com.wismay.apqt.comm.Role;
import com.wismay.apqt.entity.Company;
import com.wismay.apqt.entity.Image;
import com.wismay.apqt.entity.Personal;
import com.wismay.apqt.service.CompanyService;
import com.wismay.apqt.service.ImageService;
import com.wismay.apqt.service.PersonalService;
import com.wismay.apqt.service.account.AccountService;
import com.wismay.apqt.service.account.ShiroDbRealm.ShiroUser;

/**
 * 个人认证管理
 * 
 * @author Peter
 */
@Controller
@RequestMapping(value = "/cert/personal")
public class CertificationPersonalController {

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
	private PersonalService personalService;

	@Autowired
	private ImageService imageService;

	/**
	 * 公司列表
	 * 
	 * @param model
	 * @return
	 *         2014-8-24
	 *         Thinkpad
	 */
	@RequestMapping(value = "listCompany", method = RequestMethod.GET)
	public String listCompany(Model model) {
		Company company = new Company();
		List<Long> status = new ArrayList<Long>();

		String role = getCurrentUser().getRoles();

		// 代理管理员、代理人员:看到自己的代理人员提交的信息
		if (role.contains(Role.proxy_admin) || role.contains(Role.proxy_user)) {
			company.setProxy(getCurrentUser().getProxy());
		}

		// 审核状态 0：未审核(代理提交)；1：未审核(平台管理员提交)；2：代理管理员审核通过；
		// 3：代理管理员审核不通过；4：平台管理员审核通过；5：平台管理员神不通过。
		status.add(4L);
		company.setAuditStatusList(status);

		company.setIsProxy(null);// 代理和公司都查询

		model.addAttribute("list", companyService.search(company));
		return "certification/personal/personalCompanyList";
	}

	// to 新增 页面
	@RequestMapping(value = "create", method = RequestMethod.GET)
	public String toCreateForm(Model model) {

		// 新增页面选择个人所属公司，平台管理员则可以选择所有审核通过的公司，代理只能选择自己代理的公司
		Company company = new Company();
		List<Long> status = new ArrayList<Long>();

		String role = getCurrentUser().getRoles();

		// 代理管理员、代理人员:看到自己的代理人员提交的信息
		if (role.contains(Role.proxy_admin) || role.contains(Role.proxy_user)) {
			company.setProxy(getCurrentUser().getProxy());
		} else {
			company.setProxy(null);
		}

		// 1：审核通过
		status.add(1L);
		company.setAuditStatusList(status);

		company.setIsProxy(null);// 代理和公司都查询

		model.addAttribute("companyList", companyService.search(company));
		model.addAttribute("action", "create");
		return "certification/personal/personalForm";
	}

	// 保存个人基本信息
	@RequestMapping(value = "create", method = RequestMethod.POST)
	public String createSave(@ModelAttribute("personal") Personal personal, RedirectAttributes redirectAttributes, Model model) {
		personal.setCreateUser(getCurrentUser().id);
		personal.setCreateDate(new Date());
		personal.setProxy(getCurrentUser().getProxy() == null ? 0L : getCurrentUser().getProxy());
		personal.setAuthCode("123456");
		personal.setAuditStatus(0L);
		personal.setDeleted(DeletedFlag.USED);

		personalService.save(personal);

		return "redirect:/cert/personal/imageForm/" + personal.getId() + "/create";
	}

	// to 个人图片 Form
	@RequestMapping(value = "imageForm/{id}/{action}", method = RequestMethod.GET)
	public String saveImagesForm(@PathVariable("id") Long id, @PathVariable("action") String action, Model model) {
		Personal personal = new Personal();
		personal.setId(id);
		model.addAttribute("personal", personal);
		model.addAttribute("action", action);
		return "certification/personal/personalImageForm";
	}

	// 审核列表
	@RequestMapping(value = "audit/list")
	public String auditList(Model model) {

		Personal personal = new Personal();
		List<Long> status = new ArrayList<Long>();

		String role = getCurrentUser().getRoles();

		// 代理管理员和代理人员看到自己提交的信息
		if (role.contains(Role.proxy_admin) || role.contains(Role.proxy_user)) {
			personal.setProxy(getCurrentUser().getProxy());
		} else {
			personal.setProxy(null);
		}

		status.add(2L);// 2：审核不通过；
		status.add(0L);// 0：未审核

		personal.setAuditStatusList(status);
		model.addAttribute("list", personalService.search(personal));

		return "certification/personal/personalAuditList";
	}

	// to 审核页面
	@RequestMapping(value = "audit/{id}", method = RequestMethod.GET)
	public String audit(@PathVariable("id") Long id, Model model) {

		model.addAttribute("personal", personalService.getById(id));

		Image image = new Image();
		image.setTableId(id);
		image.setTableName("t_personal");
		model.addAttribute("imageList", imageService.search(image));

		return "certification/personal/personalAudit";
	}

	// 审核保存
	@RequestMapping(value = "audit/save", method = RequestMethod.POST)
	public String auditSave(@Valid @ModelAttribute("personal") Personal personal, Model model) {
		String role = getCurrentUser().getRoles();
		// 前端使用checkbox，选择为通过=1，否则是null，如果是null，说明是审核不通过。
		if (personal.getAuditStatus() == null || personal.getAuditStatus() == 0) {
			personal.setAuditStatus(2L);// 审核不通过
		} else {
			personal.setAuditStatus(1L);// 审核通过
		}
		personalService.updateAudit(personal);
		model.addAttribute("personal", personalService.getById(personal.getId()));

		return "certification/personal/personalAuditResult";
	}

	/**
	 * 个人列表
	 * 
	 * @param model
	 * @return
	 *         2014-8-24
	 *         Thinkpad
	 */
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String list(Model model) {
		Personal personal = new Personal();
		List<Long> status = new ArrayList<Long>();

		String role = getCurrentUser().getRoles();

		// 代理管理员、代理人员:看到自己代理的公司
		if (role.contains(Role.proxy_admin) || role.contains(Role.proxy_user)) {
			personal.setProxy(getCurrentUser().getProxy());
		}

		// 审核状态 0：未审核；1：审核通过；2：审核不通过
		status.add(1L);

		personal.setAuditStatusList(status);
		model.addAttribute("list", personalService.search(personal));
		return "certification/personal/personalList";
	}

	// 详情(个人列表页面进入)
	@RequestMapping(value = "detail/{id}/{action}", method = RequestMethod.GET)
	public String detail(@PathVariable("id") Long id, @PathVariable("action") String action, Model model) {
		model.addAttribute("personal", personalService.getById(id));

		Image image = new Image();
		image.setTableId(id);
		image.setTableName("t_personal");
		model.addAttribute("imageList", imageService.search(image));
		model.addAttribute("action", action);

		return "certification/personal/personalDetail";
	}

	// 详情（个人审核列表页面进入）
	@RequestMapping(value = "detail-audit/{id}/{action}", method = RequestMethod.GET)
	public String detailAudit(@PathVariable("id") Long id, @PathVariable("action") String action, Model model) {
		model.addAttribute("personal", personalService.getById(id));

		Image image = new Image();
		image.setTableId(id);
		image.setTableName("t_personal");
		model.addAttribute("imageList", imageService.search(image));
		model.addAttribute("action", action);

		return "certification/personal/personalDetail-audit";
	}

	// 详情（查询接口页面进入）
	@RequestMapping(value = "detail-search/{id}", method = RequestMethod.GET)
	public String detailSearch(@PathVariable("id") Long id, Model model) {
		model.addAttribute("personal", personalService.getById(id));

		Image image = new Image();
		image.setTableId(id);
		image.setTableName("t_personal");
		model.addAttribute("imageList", imageService.search(image));

		return "search/personalDetail";
	}

	// 详情（我的客户页面进入）
	@RequestMapping(value = "detail-mycustomer/{id}/{companyId}", method = RequestMethod.GET)
	public String detailMyCustomer(@PathVariable("id") Long id, @PathVariable("companyId") Long companyId, Model model) {
		model.addAttribute("personal", personalService.getById(id));

		Image image = new Image();
		image.setTableId(id);
		image.setTableName("t_personal");
		model.addAttribute("imageList", imageService.search(image));
		model.addAttribute("companyId", companyId);

		return "customer/personalDetail";
	}

	// 诚信信用码
	@RequestMapping(value = "certcode/{id}", method = RequestMethod.GET)
	public String certcodeFrom(@PathVariable("id") Long id, Model model) {
		model.addAttribute("personal", personalService.getById(id));
		return "certification/personal/certcodeSection";
	}

	// 诚信信用码 save
	@RequestMapping(value = "certcode/save")
	public String saveCertcode(@ModelAttribute("personal") Personal personal, RedirectAttributes redirectAttributes) {
		personalService.update(personal);
		redirectAttributes.addFlashAttribute("message", "诚信信用码设置成功");
		return "redirect:/cert/personal/list";
	}

	// 编辑
	@RequestMapping(value = "update/{id}", method = RequestMethod.GET)
	public String updateForm(@PathVariable("id") Long id, Model model) {
		// 编辑页面选择个人所属公司，平台管理员则可以选择所有审核通过的公司，代理只能选择自己和自己代理的公司
		Company company = new Company();
		List<Long> status = new ArrayList<Long>();
		String role = getCurrentUser().getRoles();
		// 代理管理员、代理人员:看到自己的代理人员提交的信息
		if (role.contains(Role.proxy_admin) || role.contains(Role.proxy_user)) {
			company.setProxy(getCurrentUser().getProxy());
		} else {
			company.setProxy(null);
		}
		// 1：审核通过
		status.add(AuditStatus.PASS);
		company.setAuditStatusList(status);
		company.setIsProxy(null);// 代理和公司都查询

		model.addAttribute("companyList", companyService.search(company));

		model.addAttribute("personal", personalService.getById(id));
		model.addAttribute("action", "update");
		return "certification/personal/personalForm";
	}

	// 编辑保存
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String updateSave(@Valid @ModelAttribute("personal") Personal personal, RedirectAttributes redirectAttributes) {
		personalService.update(personal);
		return "redirect:/cert/personal/imageForm/" + personal.getId() + "/update";
	}

	// 审核通过后 编辑
	@RequestMapping(value = "pass/update/{id}", method = RequestMethod.GET)
	public String updatePassForm(@PathVariable("id") Long id, Model model) {
		// 编辑页面选择个人所属公司，平台管理员则可以选择所有审核通过的公司，代理只能选择自己和自己代理的公司
		Company company = new Company();
		List<Long> status = new ArrayList<Long>();
		String role = getCurrentUser().getRoles();
		// 代理管理员、代理人员:看到自己的代理人员提交的信息
		if (role.contains(Role.proxy_admin) || role.contains(Role.proxy_user)) {
			company.setProxy(getCurrentUser().getProxy());
		} else {
			company.setProxy(null);
		}
		// 1：审核通过
		status.add(AuditStatus.PASS);
		company.setAuditStatusList(status);
		company.setIsProxy(null);// 代理和公司都查询

		model.addAttribute("companyList", companyService.search(company));

		model.addAttribute("personal", personalService.getById(id));
		model.addAttribute("action", "update");
		return "certification/personal/personalPassForm";
	}

	// 审核通过后的编辑保存
	@RequestMapping(value = "pass/update", method = RequestMethod.POST)
	public String updatePassSave(@Valid @ModelAttribute("personal") Personal personal, RedirectAttributes redirectAttributes) {
		personal.setAuditStatus(AuditStatus.NONE);// 审核通过后编辑，需要将审核状态修改为“未审核”
		personalService.update(personal);
		return "redirect:/cert/personal/pass/imageForm/" + personal.getId() + "/update";
	}

	// to 个人图片 Form
	@RequestMapping(value = "pass/imageForm/{id}/{action}", method = RequestMethod.GET)
	public String saveImagesPassForm(@PathVariable("id") Long id, @PathVariable("action") String action, Model model) {
		Personal personal = new Personal();
		personal.setId(id);
		model.addAttribute("personal", personal);
		model.addAttribute("action", action);
		return "certification/personal/personalImagePassForm";
	}

	@RequestMapping(value = "delete/{id}", method = RequestMethod.GET)
	public String delete(@PathVariable("id") Long id, RedirectAttributes redirectAttributes) {
		personalService.delete(id);
		redirectAttributes.addFlashAttribute("message", "删除成功");
		return "redirect:/cert/personal/list";
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
				image.setTableName("t_personal");

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
		e.setTableName("t_personal");
		List<Image> list = imageService.search(e);

		for (Image image : list) {
			image.setUrl(image.getNewFilename());
			image.setThumbnailUrl(image.getThumbnailFilename());
			image.setDeleteUrl("cert/personal/delete/image/" + image.getId());
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
