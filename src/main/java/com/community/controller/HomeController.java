package com.community.controller;

import java.util.List;

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

import com.community.domain.Post;
import com.community.domain.User;
import com.community.service.PostService;
import com.community.service.UserService;
import com.community.web.Common;
import com.community.web.Constants;
import com.community.web.HomeTab;

@SessionAttributes("myUid")
@Controller
public class HomeController {
	private static final Logger logger = LoggerFactory
			.getLogger(HomeController.class);

	@Autowired
	private UserService userService;
	@Autowired
	private PostService postService;

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(
			Model model,
			HttpServletRequest request,
			@RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
			@ModelAttribute("myUid") Long myUid) {
		User user = userService.getUserById(myUid, myUid);
		model.addAttribute("user", user);
		// 默认的选项卡是"好友动态"
		model.addAttribute(Constants.TAB, HomeTab.FRIEND_POSTS);
		setFriendPosts(model, user.getId(), page);
		model.addAttribute(Constants.CURRENT_URL, Common.getCurrentURL(request));
		return "home";
	}

	@RequestMapping(value = "/home/{currentTab}", method = RequestMethod.GET)
	public String homeTab(
			Model model,
			HttpServletRequest request,
			@PathVariable("currentTab") String currentTab,
			@RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
			@ModelAttribute("myUid") Long myUid) {
		User user = userService.getUserById(myUid, myUid);
		model.addAttribute("user", user);
		if (currentTab.equals(HomeTab.FOLLOWED_GROUP_POSTS.getEName())) {// 用户所发的帖子
			model.addAttribute(Constants.TAB, HomeTab.FOLLOWED_GROUP_POSTS);
			setFollowedGroupPosts(model, user.getId(), page);
		} else if (currentTab.equals(HomeTab.MY_POSTS.getEName())) {// 用户所发的帖子
			model.addAttribute(Constants.TAB, HomeTab.MY_POSTS);
			setMyPosts(model, myUid, user.getPostCount(), page);
		} else {// 默认的选项卡是"好友动态"
			model.addAttribute(Constants.TAB, HomeTab.FRIEND_POSTS);
			setFriendPosts(model, user.getId(), page);
		}
		model.addAttribute(Constants.CURRENT_URL, Common.getCurrentURL(request));
		return "home";
	}

	/**
	 * 好友动态
	 * 
	 * @param request
	 * @param uid
	 */
	private void setFriendPosts(Model model, long uid, int currentPage) {
		// TODO 有待改进，该不该查询出群组动态的总数
		// 总共有多少页
		int postCount = postService.getFriendPostCount(uid);
		int pageCount = Common
				.getPageCount(postCount, Constants.POST_PAGE_SIZE);
		model.addAttribute(Constants.PAGE_COUNT, pageCount);
		currentPage = Common.getCurrentPage(currentPage, pageCount);
		model.addAttribute(Constants.PAGE, currentPage);
		// 将要显示的列表
		long from = (currentPage - 1) * Constants.POST_PAGE_SIZE;
		List<Post> posts = postService.getFriendPosts(uid, uid, from,
				Constants.POST_PAGE_SIZE);
		model.addAttribute(Constants.POSTS, posts);
	}

	/**
	 * 社群动态
	 * 
	 * @param request
	 * @param uid
	 */
	private void setFollowedGroupPosts(Model model, long uid, int currentPage) {
		// TODO 有待改进，该不该查询出群组动态的总数
		// 总共有多少页
		int postCount = postService.getFollowerGroupPostCount(uid);
		int pageCount = Common
				.getPageCount(postCount, Constants.POST_PAGE_SIZE);
		model.addAttribute(Constants.PAGE_COUNT, pageCount);
		// 将要显示的是第几页
		currentPage = Common.getCurrentPage(currentPage, pageCount);
		model.addAttribute(Constants.PAGE, currentPage);
		// 将要显示的列表
		long from = (currentPage - 1) * Constants.POST_PAGE_SIZE;
		List<Post> posts = postService.getFollowerGroupPost(uid, uid, from,
				Constants.POST_PAGE_SIZE);
		model.addAttribute(Constants.POSTS, posts);
	}

	/**
	 * 我的帖子
	 * 
	 * @param request
	 * @param uid
	 * @param postCount
	 */
	private void setMyPosts(Model model, long uid, int postCount,
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
		List<Post> posts = postService.getPostsByUid(uid, uid, from,
				Constants.POST_PAGE_SIZE);
		model.addAttribute(Constants.POSTS, posts);
	}

}
