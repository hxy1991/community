package com.community.controller;

import java.io.IOException;
import java.util.List;

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

import com.community.domain.Group;
import com.community.domain.Post;
import com.community.domain.Resource;
import com.community.domain.User;
import com.community.service.GroupService;
import com.community.service.PostService;
import com.community.service.RelationshipService;
import com.community.service.ResourceService;
import com.community.service.UserService;
import com.community.web.Common;
import com.community.web.Constants;
import com.community.web.UserTab;

@Controller
@SessionAttributes("myUid")
public class UserController {
	private static final Logger logger = LoggerFactory
			.getLogger(UserController.class);

	@Autowired
	private UserService userService;
	@Autowired
	private PostService postService;
	@Autowired
	private GroupService groupService;
	@Autowired
	private ResourceService resourceService;
	@Autowired
	private RelationshipService relationshipService;

	@RequestMapping(value = "/user/{uid}", method = RequestMethod.GET)
	public String user(
			Model model,
			HttpServletRequest request,
			@RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
			@PathVariable("uid") Long uid, @ModelAttribute("myUid") Long myUid) {
		User user = userService.getUserById(myUid, uid);
		model.addAttribute("uid", uid);
		model.addAttribute("queryUser", user);
		model.addAttribute(Constants.TAB, UserTab.POSTS);
		setMyPosts(model, myUid, uid, user.getPostCount(), page);
		model.addAttribute("myNickname", userService
				.getUserById(myUid).getNickname());
		model.addAttribute(Constants.CURRENT_URL, Common.getCurrentURL(request));
		return "user";
	}

	@RequestMapping(value = "/user/{uid}/{currentTab}", method = RequestMethod.GET)
	public String userTab(
			Model model,
			HttpServletRequest request,
			@PathVariable("currentTab") String currentTab,
			@RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
			@PathVariable("uid") Long uid, @ModelAttribute("myUid") Long myUid) {
		User user = userService.getUserById(myUid, uid);
		model.addAttribute("uid", uid);
		model.addAttribute("queryUser", user);
		if (currentTab.equals(UserTab.FRIENDS.getEName())) {// 关注
			model.addAttribute(Constants.TAB, UserTab.FRIENDS);
			setFriends(model, myUid, uid, user.getFriendCount(), page);
		} else if (currentTab.equals(UserTab.FOLLOWERS.getEName())) {// 粉丝
			model.addAttribute(Constants.TAB, UserTab.FOLLOWERS);
			setFollowers(model, myUid, uid, user.getFollowerCount(), page);
		} else if (currentTab.equals(UserTab.FOLLOWED_GROUPS.getEName())) {// 用户所关注的社群
			model.addAttribute(Constants.TAB, UserTab.FOLLOWED_GROUPS);
			setFollowedGroup(model, myUid, uid, user.getGroupCount(), page);
		} else if (currentTab.equals(UserTab.RESOURCE.getEName())) {// 资源
			model.addAttribute(Constants.TAB, UserTab.RESOURCE);
			setResource(model, uid, user.getResourceCount(), page);
		} else {// 默认的选项卡是"我的帖子"（tab的参数值出错的情况）
			model.addAttribute(Constants.TAB, UserTab.POSTS);
			setMyPosts(model, myUid, uid, user.getPostCount(), page);
		}
		model.addAttribute("myNickname", userService
				.getUserById(myUid).getNickname());
		model.addAttribute(Constants.CURRENT_URL, Common.getCurrentURL(request));
		return "user";
	}

	/**
	 * 我的帖子
	 * 
	 * @param request
	 * @param uid
	 * @param postCount
	 */
	private void setMyPosts(Model model, long myUid, long uid, int postCount,
			int currentPage) {
		// 总共有多少页
		int pageCount = Common
				.getPageCount(postCount, Constants.POST_PAGE_SIZE);
		model.addAttribute(Constants.PAGE_COUNT, pageCount);
		// 将要显示的是第几页
		currentPage = Common.getCurrentPage(currentPage, pageCount);
		model.addAttribute(Constants.PAGE, currentPage);
		// 将要显示的列表
		long from = (currentPage - 1) * Constants.POST_PAGE_SIZE;
		List<Post> posts = postService.getPostsByUid(myUid, uid, from,
				Constants.POST_PAGE_SIZE);
		model.addAttribute(Constants.POSTS, posts);
	}

	/**
	 * 关注
	 * 
	 * @param request
	 * @param uid
	 * @throws ServletException
	 * @throws IOException
	 */
	private void setFriends(Model model, long myUid, long uid, int friendCount,
			int currentPage) {
		// 总共有多少页
		int pageCount = Common.getPageCount(friendCount,
				Constants.USER_PAGE_SIZE);
		model.addAttribute(Constants.PAGE_COUNT, pageCount);
		// 将要显示的是第几页
		currentPage = Common.getCurrentPage(currentPage, pageCount);
		model.addAttribute(Constants.PAGE, currentPage);
		// 将要显示的列表
		long from = (currentPage - 1) * Constants.USER_PAGE_SIZE;
		model.addAttribute(Constants.USERS, relationshipService
				.getFriendsByUid(myUid, uid, from, Constants.USER_PAGE_SIZE));
	}

	/**
	 * 粉丝
	 * 
	 * @param request
	 * @param uid
	 * @throws ServletException
	 * @throws IOException
	 */
	private void setFollowers(Model model, long myUid, long uid,
			int followerCount, int currentPage) {
		// 总共有多少页
		int pageCount = Common.getPageCount(followerCount,
				Constants.USER_PAGE_SIZE);
		model.addAttribute(Constants.PAGE_COUNT, pageCount);
		// 将要显示的是第几页
		currentPage = Common.getCurrentPage(currentPage, pageCount);
		model.addAttribute(Constants.PAGE, currentPage);
		// 将要显示的列表
		long from = (currentPage - 1) * Constants.USER_PAGE_SIZE;
		model.addAttribute(Constants.USERS, relationshipService
				.getFollowersByUid(myUid, uid, from, Constants.USER_PAGE_SIZE));
	}

	/**
	 * 我关注的社群
	 * 
	 * @param request
	 * @param uid
	 * @param groupCount
	 * @throws ServletException
	 * @throws IOException
	 */
	private void setFollowedGroup(Model model, long myUid, long uid,
			int groupCount, int currentPage) {
		// 总共有多少页
		int pageCount = Common.getPageCount(groupCount,
				Constants.GROUP_PAGE_SIZE);
		model.addAttribute(Constants.PAGE_COUNT, pageCount);
		// 将要显示的是第几页
		currentPage = Common.getCurrentPage(currentPage, pageCount);
		model.addAttribute(Constants.PAGE, currentPage);
		// 将要显示的列表
		long from = (currentPage - 1) * Constants.GROUP_PAGE_SIZE;
		List<Group> list = groupService.getGroupsByUid(myUid, uid, from,
				Constants.GROUP_PAGE_SIZE);
		model.addAttribute(Constants.GROUPS, list);
	}

	/**
	 * 资源
	 * 
	 * @param request
	 * @param uid
	 * @param resourceCount
	 */
	private void setResource(Model model, long uid, int resourceCount,
			int currentPage) {
		// 总共有多少页
		int pageCount = Common.getPageCount(resourceCount,
				Constants.RESOURCE_PAGE_SIZE);
		model.addAttribute(Constants.PAGE_COUNT, pageCount);
		// 将要显示的是第几页
		currentPage = Common.getCurrentPage(currentPage, pageCount);
		model.addAttribute(Constants.PAGE, currentPage);
		// 将要显示的列表
		long from = (currentPage - 1) * Constants.RESOURCE_PAGE_SIZE;
		List<Resource> list = resourceService.getResourcesByUid(uid, from,
				Constants.RESOURCE_PAGE_SIZE);
		model.addAttribute(Constants.RESOURCES, list);
	}

	@RequestMapping(value = "/users", method = RequestMethod.GET)
	public String users(
			Model model,
			HttpServletRequest request,
			@RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
			@ModelAttribute("myUid") Long myUid) {
		// 总共有多少页
		int userCount = userService.getUserCount();
		model.addAttribute(Constants.PAGE_COUNT,
				Common.getPageCount(userCount, Constants.USER_PAGE_SIZE));
		// 当前页
		int currentPage = Common.getCurrentPage(page, userCount);
		model.addAttribute(Constants.PAGE, currentPage);

		// 列表
		long from = (currentPage - 1) * Constants.USER_PAGE_SIZE;

		List<User> list = userService.getUsers(myUid, from,
				Constants.USER_PAGE_SIZE);
		model.addAttribute(Constants.USERS, list);

		// 帖子榜
		List<User> topPostCountUsers = userService.getTopPostCountUsers(myUid,
				10);
		model.addAttribute("topPostCount", topPostCountUsers);
		// 资源榜
		List<User> topResourceCountUsers = userService
				.getTopResourceCountUsers(myUid, 10);
		model.addAttribute("topResourceCount", topResourceCountUsers);
		// 粉丝榜
		List<User> topFollowerCountUsers = userService
				.getTopFollowerCountUsers(myUid, 10);
		model.addAttribute("topFollowerCount", topFollowerCountUsers);
		// 当前用户的昵称
		model.addAttribute("myNickname", userService
				.getUserById(myUid).getNickname());
		// 当前的地址
		model.addAttribute(Constants.CURRENT_URL, Common.getCurrentURL(request));
		return "users";
	}
}
