package com.community.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.community.service.RelationshipService;
import com.community.service.UserService;
import com.community.web.Common;
import com.community.web.CompanionTab;
import com.community.web.Constants;

@SessionAttributes("myUid")
@Controller
public class CompanionController {
	private static final Logger logger = LoggerFactory
			.getLogger(CompanionController.class);

	@Autowired
	private UserService userService;
	@Autowired
	private RelationshipService relationshipService;

	@RequestMapping(value = "/companion", method = RequestMethod.GET)
	public String companion(
			Model model,
			HttpServletRequest request,
			@RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
			@ModelAttribute("myUid") Long myUid) {
		request.setAttribute(Constants.TAB, CompanionTab.FRIENDS);
		setFriends(model, myUid, page);
		request.setAttribute("user",
				userService.getUserById(myUid, myUid));
		request.setAttribute(Constants.CURRENT_URL,
				Common.getCurrentURL(request));
		return "companion";
	}

	/**
	 * 注意：@PathVariable("tab1") String tab1 中的tab1会出现在companion.jsp的request中
	 * 
	 * @param model
	 * @param request
	 * @param tab1
	 * @param page
	 * @param myUid
	 * @return
	 */
	@RequestMapping(value = "/companion/{currentTab}", method = RequestMethod.GET)
	public String companionTab(
			Model model,
			HttpServletRequest request,
			@PathVariable("currentTab") String currentTab,
			@RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
			@ModelAttribute("myUid") Long myUid) {
		if (CompanionTab.FRIENDS.getEName().equals(currentTab)) {
			request.setAttribute(Constants.TAB, CompanionTab.FRIENDS);
			setFriends(model, myUid, page);
		} else {
			request.setAttribute(Constants.TAB, CompanionTab.FOLLOWERS);
			setFollowers(model, myUid, page);
		}
		request.setAttribute(Constants.USER,
				userService.getUserById(myUid, myUid));
		request.setAttribute(Constants.CURRENT_URL,
				Common.getCurrentURL(request));
		return "companion";
	}

	/**
	 * 关注
	 * 
	 * @param request
	 * @param uid
	 * @throws ServletException
	 * @throws IOException
	 */
	private void setFriends(Model model, long uid, int currentPage) {
		// 总共有多少页
		int userCount = relationshipService.getFriendCount(uid);
		int pageCount = Common
				.getPageCount(userCount, Constants.USER_PAGE_SIZE);
		model.addAttribute(Constants.PAGE_COUNT, pageCount);
		// 将要显示的是第几页
		currentPage = Common.getCurrentPage(currentPage, pageCount);
		model.addAttribute(Constants.PAGE, currentPage);
		// 将要显示的列表
		long from = (currentPage - 1) * Constants.USER_PAGE_SIZE;
		model.addAttribute(Constants.USERS, relationshipService
				.getFriendsByUid(uid, uid, from, Constants.USER_PAGE_SIZE));
	}

	/**
	 * 粉丝
	 * 
	 * @param request
	 * @param uid
	 * @throws ServletException
	 * @throws IOException
	 */
	private void setFollowers(Model model, long uid, int currentPage) {
		// 总共有多少页
		int userCount = relationshipService.getFollowerCount(uid);
		int pageCount = Common
				.getPageCount(userCount, Constants.USER_PAGE_SIZE);
		model.addAttribute(Constants.PAGE_COUNT, pageCount);
		// 将要显示的是第几页
		currentPage = Common.getCurrentPage(currentPage, pageCount);
		model.addAttribute(Constants.PAGE, currentPage);
		// 将要显示的列表
		long from = (currentPage - 1) * Constants.USER_PAGE_SIZE;
		model.addAttribute(Constants.USERS, relationshipService
				.getFollowersByUid(uid, uid, from, Constants.USER_PAGE_SIZE));
	}
}
