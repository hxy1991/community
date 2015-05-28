package com.community.controller;

import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
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

import com.alibaba.fastjson.JSONObject;
import com.community.domain.User;
import com.community.service.GroupService;
import com.community.service.PostService;
import com.community.service.ResourceService;
import com.community.service.UserGroupService;
import com.community.service.UserService;
import com.community.util.ImageScaleUtil;
import com.community.util.StringUtils;
import com.community.web.Constants;
import com.community.web.PassportTab;

@SessionAttributes("myUid")
@Controller
public class PassportController {
	private static final Logger logger = LoggerFactory
			.getLogger(PassportController.class);

	@Autowired
	private UserService userService;
	@Autowired
	private GroupService groupService;
	@Autowired
	private UserGroupService userGroupService;
	@Autowired
	private ResourceService resourceService;
	@Autowired
	private PostService postService;

	private static String SERVLET_CONTEXT_REAL_PATH;

	private static final String BIG_AVATER_FILE_PATH = "resources"
			+ File.separator + "avater" + File.separator + "180"
			+ File.separator;
	private static final String MIDDLE_AVATER_FILE_PATH = "resources"
			+ File.separator + "avater" + File.separator + "80"
			+ File.separator;
	private static final String SMALL_AVATER_FILE_PATH = "resources"
			+ File.separator + "avater" + File.separator + "50"
			+ File.separator;

	private static final int MIDDLE_WIDTH = 80;
	private static final int MIDDLE_HEIGHT = 80;
	private static final int SMALL_WIDTH = 50;
	private static final int SMALL_HEIGHT = 50;

	@RequestMapping(value = "/passport", method = RequestMethod.GET)
	public String passport(
			Model model,
			HttpServletRequest request,
			@RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
			@ModelAttribute("myUid") Long myUid) {
		request.setAttribute(Constants.USER,
				userService.getUserById(myUid, myUid));
		request.setAttribute(Constants.TAB, PassportTab.BASCI_MESSAGE);
		return "passport";
	}

	@RequestMapping(value = "/passport/{currentTab}", method = RequestMethod.GET)
	public String passportTab(
			Model model,
			HttpServletRequest request,
			@PathVariable("currentTab") String currentTab,
			@RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
			@ModelAttribute("myUid") Long myUid) {
		PassportTab tab = null;
		if (currentTab.equals(PassportTab.CHANGE_PASSWORD.getEName())) {
			tab = PassportTab.CHANGE_PASSWORD;
		} else if (currentTab.equals(PassportTab.CHANGE_AVATER.getEName())) {
			tab = PassportTab.CHANGE_AVATER;
		} else {
			tab = PassportTab.BASCI_MESSAGE;
		}
		request.setAttribute(Constants.TAB, tab);
		request.setAttribute(Constants.USER,
				userService.getUserById(myUid, myUid));
		return "passport";
	}

	@RequestMapping(value = "/passport", method = RequestMethod.PUT)
	public @ResponseBody ResponseEntity<Void> passport(
			Model model,
			HttpServletRequest request,
			@RequestParam(value = "nickname", required = false) String nickname,
			@RequestParam(value = "sex", required = false) Integer sex,
			@RequestParam(value = "description", required = false) String description,
			@RequestParam(value = "currentPassword", required = false) String currentPassword,
			@RequestParam(value = "inputPassword", required = false) String inputPassword,
			@RequestParam(value = "inputConfirmPassword", required = false) String inputConfirmPassword,
			@ModelAttribute("myUid") Long myUid) {
		User user = userService.getUserById(myUid);
		if (nickname != null && !"".equals(nickname)) {
			user.setNickname(nickname);
		}
		if (sex != null) {
			user.setSex(sex);
		}
		if (description != null) {
			user.setDescription(description);
		}
		if (currentPassword != null) {
			String password = user.getPassword();
			if (password.equals(StringUtils.md5(currentPassword))) {
				if (inputPassword != null
						&& inputPassword.equals(inputConfirmPassword)) {
					user.setPassword(StringUtils.md5(inputPassword));
				} else {
					return ResponseEntity.status(HttpStatus.CONFLICT).build();
				}
			} else {
				return ResponseEntity.status(HttpStatus.CONFLICT).build();
			}
		}
		boolean success = userService.updateUser(user);
		if (success) {
			return ResponseEntity.status(HttpStatus.OK).build();
		}
		return ResponseEntity.status(HttpStatus.CONFLICT).build();
	}

	@RequestMapping(value = "/avater", method = { RequestMethod.GET,
			RequestMethod.POST }, produces = { "application/json" })
	@ResponseBody
	public String uploadAvater(Model model, HttpServletRequest request,
			@ModelAttribute("myUid") Long myUid) {
		if (SERVLET_CONTEXT_REAL_PATH == null) {
			SERVLET_CONTEXT_REAL_PATH = request.getServletContext()
					.getRealPath("/");
			File file = new File(SERVLET_CONTEXT_REAL_PATH);
			if (!file.exists()) {
				file.mkdirs();
			}
		}

		BufferedOutputStream bufferedOutputStream = null;
		BufferedOutputStream middleBufferedOutputStream = null;
		BufferedOutputStream smallBufferedOutputStream = null;

		InputStream inputStream = null;
		InputStream middleInputStream = null;
		InputStream smallInputStream = null;

		try {
			bufferedOutputStream = new BufferedOutputStream(
					new FileOutputStream(new File(SERVLET_CONTEXT_REAL_PATH
							+ BIG_AVATER_FILE_PATH, myUid + ".jpg")));
			inputStream = request.getInputStream();
			byte[] bytes = IOUtils.toByteArray(inputStream);
			bufferedOutputStream.write(bytes);

			middleBufferedOutputStream = new BufferedOutputStream(
					new FileOutputStream(new File(SERVLET_CONTEXT_REAL_PATH
							+ MIDDLE_AVATER_FILE_PATH, myUid + ".jpg")));
			middleInputStream = ImageScaleUtil.compressImg(
					new ByteArrayInputStream(bytes), MIDDLE_WIDTH,
					MIDDLE_HEIGHT, "jpg");
			middleBufferedOutputStream.write(IOUtils
					.toByteArray(middleInputStream));

			logger.info("{},{}", SERVLET_CONTEXT_REAL_PATH
					+ SMALL_AVATER_FILE_PATH, myUid + ".jpg");
			smallBufferedOutputStream = new BufferedOutputStream(
					new FileOutputStream(new File(SERVLET_CONTEXT_REAL_PATH
							+ SMALL_AVATER_FILE_PATH, myUid + ".jpg")));
			smallInputStream = ImageScaleUtil.compressImg(
					new ByteArrayInputStream(bytes), SMALL_WIDTH, SMALL_HEIGHT,
					"jpg");
			smallBufferedOutputStream.write(IOUtils
					.toByteArray(smallInputStream));

		} catch (IOException e) {
			logger.error("{}", e);
			JSONObject result = new JSONObject();
			result.put("status", -2);
			return result.toJSONString();
		} finally {
			IOUtils.closeQuietly(inputStream);
			IOUtils.closeQuietly(middleInputStream);
			IOUtils.closeQuietly(smallInputStream);

			IOUtils.closeQuietly(bufferedOutputStream);
			IOUtils.closeQuietly(middleBufferedOutputStream);
			IOUtils.closeQuietly(smallBufferedOutputStream);
		}
		User user = userService.getUserById(myUid);
		user.setAvaterURI(BIG_AVATER_FILE_PATH + myUid + ".jpg");
		boolean success = userService.updateUser(user);
		JSONObject result = new JSONObject();
		if (success) {
			result.put("status", 1);
		} else {
			result.put("status", -2);
		}
		return result.toJSONString();
	}

}
