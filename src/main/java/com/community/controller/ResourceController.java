package com.community.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.community.domain.Resource;
import com.community.domain.ResourceDownload;
import com.community.service.ResourceDownloadService;
import com.community.service.ResourceService;
import com.community.service.UserService;
import com.community.web.Common;
import com.community.web.Constants;
import com.community.web.ResourceTab;

@SessionAttributes("myUid")
@Controller
public class ResourceController {
	private static final Logger logger = LoggerFactory
			.getLogger(ResourceController.class);

	@Autowired
	private UserService userService;
	@Autowired
	private ResourceDownloadService resourceDownloadService;
	@Autowired
	private ResourceService resourceService;

	private static String SAVE_UPLOAD_FILE_PATH;

	private static final String FILE_PATH = "resources" + File.separator
			+ "upload" + File.separator;

	private static final ThreadLocal<SimpleDateFormat> yyyyMMddHHmmssSSS = new ThreadLocal<SimpleDateFormat>() {
		protected SimpleDateFormat initialValue() {
			return new SimpleDateFormat("yyyyMMddHHmmssSSS");
		}
	};

	@RequestMapping(value = "/resource", method = RequestMethod.GET)
	public String resource(
			Model model,
			HttpServletRequest request,
			@RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
			@ModelAttribute("myUid") Long myUid) {
		model.addAttribute(Constants.TAB, ResourceTab.DOWOLOADED);
		setDownloadedResource(model, myUid, page);
		request.setAttribute(Constants.USER,
				userService.getUserById(myUid, myUid));
		request.setAttribute(Constants.CURRENT_URL,
				Common.getCurrentURL(request));
		return "resource";
	}

	@RequestMapping(value = "/download/{rid}", method = RequestMethod.GET)
	public ResponseEntity<byte[]> download(
			Model model,
			HttpServletRequest request,
			HttpServletResponse response,
			@PathVariable("rid") Long rid,
			@RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
			@ModelAttribute("myUid") Long myUid) {
		if (SAVE_UPLOAD_FILE_PATH == null) {
			SAVE_UPLOAD_FILE_PATH = request.getServletContext()
					.getRealPath("/") + FILE_PATH;
			File file = new File(SAVE_UPLOAD_FILE_PATH);
			if (!file.exists()) {
				file.mkdirs();
			}
		}

		HttpHeaders headers = new HttpHeaders();
		byte[] bytes = new byte[0];
		HttpStatus httpState = HttpStatus.NOT_FOUND;
		Resource resource = resourceService.getResourceById(myUid, rid);
		File file = new File(SAVE_UPLOAD_FILE_PATH, resource.getDownloadURL());
		if (file.exists() && file.isFile()) {
			InputStream inputStream;
			try {
				inputStream = new FileInputStream(file);
				bytes = IOUtils.toByteArray(inputStream);
				headers.add("Content-Length", "" + bytes.length);
				String filename = URLEncoder.encode(resource.getName() + "."
						+ resource.getFileExtension(), "UTF-8");
				headers.add("Content-Disposition", "attachment;filename="
						+ filename);
				httpState = HttpStatus.OK;

				ResourceDownload resourceDownload = new ResourceDownload();
				resourceDownload.setUid(myUid);
				resourceDownload.setRid(rid);
				resourceDownloadService
						.insertResourceDownload(resourceDownload);
			} catch (FileNotFoundException e) {
				logger.error("{}", e);
			} catch (IOException e) {
				logger.error("{}", e);
			}
		} else {
			logger.warn("{}，文件不存在", file.getAbsoluteFile());
		}
		ResponseEntity<byte[]> entity = new ResponseEntity<>(bytes, headers,
				httpState);
		return entity;
	}

	@RequestMapping(value = "/resource", method = RequestMethod.POST)
	public String create(Model model, HttpServletRequest request,
			@ModelAttribute("myUid") Long myUid,
			@RequestParam("file") MultipartFile multipartFile,
			@RequestParam("gid") Long gid, @RequestParam("name") String name,
			@RequestParam("description") String description) {
		if (!multipartFile.isEmpty()) {
			if (SAVE_UPLOAD_FILE_PATH == null) {
				SAVE_UPLOAD_FILE_PATH = request.getServletContext()
						.getRealPath("/") + FILE_PATH;
				logger.info("SAVE_UPLOAD_FILE_PATH={}", SAVE_UPLOAD_FILE_PATH);
				File file = new File(SAVE_UPLOAD_FILE_PATH);
				if (!file.exists()) {
					file.mkdirs();
				}
			}
			String filename = saveFile(multipartFile, gid, myUid);
			if (filename != null) {
				long size = multipartFile.getSize();
				Resource resource = new Resource();
				resource.setUid(myUid);
				resource.setGid(gid);
				resource.setName(name);
				resource.setDescription(description);
				resource.setSize(size);
				String downloadURL = filename;
				resource.setDownloadURL(downloadURL);
				resourceService.insertResource(resource);
			}
			return "redirect:group/" + gid + "/resources";
		}
		return "redirect:group/" + gid;
	}

	@RequestMapping(value = "/resource/{rid}", method = RequestMethod.DELETE)
	public @ResponseBody ResponseEntity<Void> delete(Model model,
			HttpServletRequest request, @PathVariable("rid") long rid,
			@ModelAttribute("myUid") Long myUid) {
		boolean success = resourceService.deleteResource(myUid, rid);
		if (success) {
			return ResponseEntity.status(HttpStatus.NO_CONTENT).build();
		}
		return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
	}

	private String saveFile(MultipartFile multipartFile, long gid, long uid) {
		String filename = multipartFile.getOriginalFilename();
		String fileExtension = filename
				.substring(filename.lastIndexOf(".") + 1);
		filename = yyyyMMddHHmmssSSS.get().format(new Date()) + "_" + gid + "_"
				+ uid + "." + fileExtension;
		logger.info("filename={}", filename);
		BufferedOutputStream output = null;
		try {

			byte[] bytes = multipartFile.getBytes();
			output = new BufferedOutputStream(new FileOutputStream(new File(
					SAVE_UPLOAD_FILE_PATH, filename)));
			output.write(bytes);
			return filename;
		} catch (IOException e) {
			logger.error("{}", e);
		} finally {
			IOUtils.closeQuietly(output);
		}
		return null;
	}

	@RequestMapping(value = "/resource/{currentTab}", method = RequestMethod.GET)
	public String resourceTab(
			Model model,
			HttpServletRequest request,
			@PathVariable("currentTab") String currentTab,
			@RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
			@ModelAttribute("myUid") Long myUid) {
		if (ResourceTab.UPLOADED.getEName().equals(currentTab)) {
			model.addAttribute(Constants.TAB, ResourceTab.UPLOADED);
			setUploadedResource(model, myUid, page);
		} else {
			model.addAttribute(Constants.TAB, ResourceTab.DOWOLOADED);
			setDownloadedResource(model, myUid, page);
		}
		request.setAttribute(Constants.USER,
				userService.getUserById(myUid, myUid));
		request.setAttribute(Constants.CURRENT_URL,
				Common.getCurrentURL(request));
		return "resource";
	}

	/**
	 * 已下载的资源
	 * 
	 * @param request
	 * @param uid
	 */
	private void setDownloadedResource(Model model, long myUid, int currentPage) {
		// 总共有多少页
		int resourceCount = resourceDownloadService
				.getUserResourceDownloadCount(myUid);
		int pageCount = Common.getPageCount(resourceCount,
				Constants.RESOURCE_PAGE_SIZE);
		model.addAttribute(Constants.PAGE_COUNT, pageCount);
		// 将要显示的是第几页
		currentPage = Common.getCurrentPage(currentPage, pageCount);
		model.addAttribute(Constants.PAGE, currentPage);
		// 将要显示的列表
		long from = (currentPage - 1) * Constants.RESOURCE_PAGE_SIZE;
		List<ResourceDownload> list = resourceDownloadService
				.getResourceDownloads(myUid, from, Constants.RESOURCE_PAGE_SIZE);
		model.addAttribute("resourceDonwloads", list);
	}

	/**
	 * 已上传的资源
	 * 
	 * @param request
	 * @param uid
	 */
	private void setUploadedResource(Model model, long myUid, int currentPage) {
		// 总共有多少页
		int resourceCount = resourceService.getUserResourceCount(myUid);
		int pageCount = Common.getPageCount(resourceCount,
				Constants.RESOURCE_PAGE_SIZE);
		model.addAttribute(Constants.PAGE_COUNT, pageCount);
		// 将要显示的是第几页
		currentPage = Common.getCurrentPage(currentPage, pageCount);
		model.addAttribute(Constants.PAGE, currentPage);
		// 将要显示的列表
		long from = (currentPage - 1) * Constants.RESOURCE_PAGE_SIZE;
		List<Resource> list = resourceService.getResourcesByUid(myUid, from,
				Constants.RESOURCE_PAGE_SIZE);
		model.addAttribute(Constants.RESOURCES, list);
	}
}
