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

import com.community.domain.Group;
import com.community.domain.Post;
import com.community.domain.User;
import com.community.service.GroupService;
import com.community.service.PostService;
import com.community.service.ResourceService;
import com.community.service.UserGroupService;
import com.community.service.UserService;
import com.community.web.Common;
import com.community.web.Constants;
import com.community.web.SearchTab;

@SessionAttributes("myUid")
@Controller
public class SearchController {
	private static final Logger logger = LoggerFactory
			.getLogger(SearchController.class);

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

	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String search(
			Model model,
			HttpServletRequest request,
			@RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
			@RequestParam(value = "word") String word,
			@ModelAttribute("myUid") Long myUid) {
		model.addAttribute("word", word);
		setSearchedPosts(model, myUid, word, page);
		model.addAttribute(Constants.TAB, SearchTab.POST);
		model.addAttribute("myNickname", userService
				.getUserById(myUid).getNickname());
		model.addAttribute(Constants.CURRENT_URL, Common.getCurrentURL(request));
		return "search";
	}
	
	@RequestMapping(value = "/search/{currentTab}", method = RequestMethod.GET)
	public String searchTab(
			Model model,
			HttpServletRequest request,
			@RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
			@PathVariable("currentTab") String currentTab,
			@RequestParam(value = "word") String word,
			@ModelAttribute("myUid") Long myUid) {
		model.addAttribute("word", word);
		if (SearchTab.GROUP.getEName().equals(currentTab)) {
			setSearchedGroup(model, myUid, word, page);
			model.addAttribute(Constants.TAB, SearchTab.GROUP);
		} else if (SearchTab.USER.getEName().equals(currentTab)) {
			setSearchedUser(model, myUid, word, page);
			model.addAttribute(Constants.TAB, SearchTab.USER);
		} else {
			setSearchedPosts(model, myUid, word, page);
			model.addAttribute(Constants.TAB, SearchTab.POST);
		}
		model.addAttribute("myNickname", userService
				.getUserById(myUid).getNickname());
		model.addAttribute(Constants.CURRENT_URL, Common.getCurrentURL(request));
		return "search";
	}

	/**
	 * 
	 * @param word
	 * @param request
	 */
	private void setSearchedPosts(Model model, long myUid, String word,
			int currentPage) {
		// 总共有多少页
		int postCount = postService.searchPostCount(word);
		int pageCount = Common
				.getPageCount(postCount, Constants.POST_PAGE_SIZE);
		model.addAttribute(Constants.PAGE_COUNT, pageCount);

		// 将要显示的是第几页
		currentPage = Common.getCurrentPage(currentPage, pageCount);
		model.addAttribute(Constants.PAGE, currentPage);
		// 将要显示的列表
		int from = (currentPage - 1) * Constants.POST_PAGE_SIZE;
		List<Post> posts = postService.searchPost(myUid, word, from,
				Constants.POST_PAGE_SIZE);
		// String replacement = "<span class=\"keyword\">" + word + "</span>";
		// String title = null;
		// String content = null;
		// for(Post post : posts){
		// title = post.getTitle();
		// title = title.replace(word, replacement);
		// post.setTitle(title);
		//
		// content = post.getContent();
		// content = content.replace(word, replacement);
		// post.setContent(content);
		//
		// }
		model.addAttribute(Constants.POSTS, posts);

	}

	private void setSearchedGroup(Model model, long myUid, String word,
			int currentPage) {
		// 总共有多少页
		int groupCount = groupService.searchGroupCount(word);
		int pageCount = Common.getPageCount(groupCount,
				Constants.GROUP_PAGE_SIZE);
		model.addAttribute(Constants.PAGE_COUNT, pageCount);

		// 将要显示的是第几页
		currentPage = Common.getCurrentPage(currentPage, pageCount);
		model.addAttribute(Constants.PAGE, currentPage);
		// 将要显示的列表
		int from = (currentPage - 1) * Constants.GROUP_PAGE_SIZE;
		List<Group> groups = groupService.searchGroup(myUid, word, from,
				Constants.GROUP_PAGE_SIZE);

		model.addAttribute(Constants.GROUPS, groups);
	}

	private void setSearchedUser(Model model, long myUid, String word,
			int currentPage) {
		// 总共有多少页
		int userCount = userService.searchUserCount(word);
		int pageCount = Common
				.getPageCount(userCount, Constants.USER_PAGE_SIZE);
		model.addAttribute(Constants.PAGE_COUNT, pageCount);

		// 将要显示的是第几页
		currentPage = Common.getCurrentPage(currentPage, pageCount);
		model.addAttribute(Constants.PAGE, currentPage);
		// 将要显示的列表
		int from = (currentPage - 1) * Constants.USER_PAGE_SIZE;
		List<User> users = userService.searchUser(myUid, word, from,
				Constants.USER_PAGE_SIZE);
		model.addAttribute(Constants.USERS, users);
	}
}
