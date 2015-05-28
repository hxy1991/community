package com.community.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

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

import com.community.domain.Group;
import com.community.domain.Post;
import com.community.domain.Resource;
import com.community.service.GroupService;
import com.community.service.PostService;
import com.community.service.ResourceService;
import com.community.service.UserGroupService;
import com.community.service.UserService;
import com.community.web.Common;
import com.community.web.Constants;
import com.community.web.GroupTab;

@SessionAttributes("myUid")
@Controller
public class GroupController {
	private static final Logger logger = LoggerFactory
			.getLogger(GroupController.class);

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

	@RequestMapping(value = "/myGroup", method = RequestMethod.GET)
	public String myGroup(
			Model model,
			HttpServletRequest request,
			@RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
			@ModelAttribute("myUid") Long myUid) {
		setFollowedGroup(model, myUid, page);
		model.addAttribute(Constants.USER,
				userService.getUserById(myUid, myUid));
		model.addAttribute(Constants.CURRENT_URL, Common.getCurrentURL(request));
		return "myGroup";
	}

	@RequestMapping(value = "/group", method = RequestMethod.POST)
	public @ResponseBody ResponseEntity<Void> insert(Model model,
			HttpServletRequest request,
			@RequestParam(value = "name") String name,
			@RequestParam(value = "description") String description,
			@ModelAttribute("myUid") Long myUid) {
		Group group = new Group();
		group.setName(name);
		group.setDescription(description);
		group.setCreator(myUid);
		groupService.insertGroup(group);
		if (group.getId() != 0) {
			return ResponseEntity.status(HttpStatus.CREATED).build();
		}
		return ResponseEntity.status(HttpStatus.CONFLICT).build();
	}

	@RequestMapping(value = "/groups", method = RequestMethod.GET)
	public String groups(
			Model model,
			HttpServletRequest request,
			@RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
			@ModelAttribute("myUid") Long myUid) {
		// 总共有多少页
		int groupCount = groupService.getGroupCount();
		model.addAttribute(Constants.PAGE_COUNT,
				Common.getPageCount(groupCount, Constants.GROUP_PAGE_SIZE));
		// 当前页
		int currentPage = Common.getCurrentPage(page, groupCount);
		model.addAttribute(Constants.PAGE, currentPage);

		// 列表
		long from = (currentPage - 1) * Constants.GROUP_PAGE_SIZE;
		List<Group> list = groupService.getGroups(myUid, from,
				Constants.GROUP_PAGE_SIZE);
		model.addAttribute(Constants.GROUPS, list);
		// 帖子榜
		List<Group> topPostCountGroups = groupService.getTopPostCountGroups(
				myUid, 10);
		model.addAttribute("topPostCount", topPostCountGroups);
		// 资源榜
		List<Group> topResourceCountGroups = groupService
				.getTopResourceCountGroups(myUid, 10);
		model.addAttribute("topResourceCount", topResourceCountGroups);
		// 粉丝榜
		List<Group> topFollowerCountGroups = groupService
				.getTopFollowerCountGroups(myUid, 10);
		model.addAttribute("topFollowerCount", topFollowerCountGroups);

		model.addAttribute("myNickname", userService
				.getUserById(myUid).getNickname());
		model.addAttribute(Constants.CURRENT_URL, Common.getCurrentURL(request));
		return "groups";
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
	private void setFollowedGroup(Model model, long uid, int currentPage) {
		int groupCount = groupService.getUserGroupCount(uid);
		// 总共有多少页
		int pageCount = Common.getPageCount(groupCount,
				Constants.GROUP_PAGE_SIZE);
		model.addAttribute(Constants.PAGE_COUNT, pageCount);
		// 将要显示的是第几页
		currentPage = Common.getCurrentPage(currentPage, pageCount);
		model.addAttribute(Constants.PAGE, currentPage);
		// 将要显示的列表
		long from = (currentPage - 1) * Constants.GROUP_PAGE_SIZE;
		List<Group> list = groupService.getGroupsByUid(uid, uid, from,
				Constants.GROUP_PAGE_SIZE);
		model.addAttribute(Constants.GROUPS, list);
	}

	@RequestMapping(value = "/group/{gid}", method = RequestMethod.GET)
	public String group(
			Model model,
			HttpServletRequest request,
			@RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
			@PathVariable("gid") Long gid,
			@RequestParam(value = "orderBy", required = false) String orderBy,
			@ModelAttribute("myUid") Long myUid) {
		Group group = groupService.getGroupById(myUid, gid);
		model.addAttribute("gid", gid);
		model.addAttribute(Constants.GROUP, group);// 社群的有关信息

		model.addAttribute(Constants.TAB, GroupTab.POSTS);
		setPosts(model, myUid, group, page, orderBy);
		model.addAttribute("myNickname", userService
				.getUserById(myUid).getNickname());
		model.addAttribute(Constants.CURRENT_URL, Common.getCurrentURL(request));
		return "group";
	}

	@RequestMapping(value = "/group/{gid}/{currentTab}", method = RequestMethod.GET)
	public String groupTab(
			Model model,
			HttpServletRequest request,
			@RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
			@PathVariable("gid") Long gid,
			@PathVariable("currentTab") String currentTab,
			@RequestParam(value = "orderBy", required = false) String orderBy,
			@ModelAttribute("myUid") Long myUid) {
		Group group = groupService.getGroupById(myUid, gid);
		model.addAttribute("gid", gid);
		model.addAttribute(Constants.GROUP, group);// 社群的有关信息
		if (currentTab.equals(GroupTab.RESOURCES.getEName())) {
			model.addAttribute(Constants.TAB, GroupTab.RESOURCES);
			setResources(model, group, page);
		} else if (currentTab.equals(GroupTab.FOLLOWERS.getEName())) {
			model.addAttribute(Constants.TAB, GroupTab.FOLLOWERS);
			setFollowers(model, myUid, gid, page);
		} else {
			model.addAttribute(Constants.TAB, GroupTab.POSTS);
			setPosts(model, myUid, group, page, orderBy);
		}
		model.addAttribute("myNickname", userService
				.getUserById(myUid).getNickname());
		model.addAttribute(Constants.CURRENT_URL, Common.getCurrentURL(request));
		return "group";
	}

	private void setResources(Model model, Group group, int currentPage) {
		long gid = group.getId();
		int resourceCount = resourceService.getGroupResourceCount(gid);
		int pageCount = Common.getPageCount(resourceCount,
				Constants.RESOURCE_PAGE_SIZE);
		model.addAttribute(Constants.PAGE_COUNT, pageCount);
		// 将要显示的是第几页
		currentPage = Common.getCurrentPage(currentPage, pageCount);
		model.addAttribute(Constants.PAGE, currentPage);// 当前是第几页的帖子
		long from = (currentPage - 1) * Constants.RESOURCE_PAGE_SIZE;
		List<Resource> resources = resourceService.getGroupResources(group,
				from, Constants.RESOURCE_PAGE_SIZE);
		model.addAttribute(Constants.RESOURCES, resources);// 将要显示的resource
	}

	private void setFollowers(Model model, long myUid, long gid, int currentPage) {
		// 总共有多少页
		int userCount = userGroupService.getGroupFollowerCount(gid);
		int pageCount = Common
				.getPageCount(userCount, Constants.USER_PAGE_SIZE);
		model.addAttribute(Constants.PAGE_COUNT, pageCount);
		// 将要显示的是第几页
		currentPage = Common.getCurrentPage(currentPage, pageCount);
		model.addAttribute(Constants.PAGE, currentPage);
		// 将要显示的列表
		long from = (currentPage - 1) * Constants.USER_PAGE_SIZE;
		model.addAttribute(Constants.USERS, userGroupService.getGroupFollowers(
				myUid, gid, from, Constants.USER_PAGE_SIZE));
	}

	private void setPosts(Model model, long myUid, Group group,
			int currentPage, String orderBy) {
		long gid = group.getId();
		// 总共有多少页
		int postCount = postService.getGroupPostCount(gid);// 总格有多少个帖子
		int pageCount = Common
				.getPageCount(postCount, Constants.POST_PAGE_SIZE);
		model.addAttribute(Constants.PAGE_COUNT, pageCount);
		currentPage = Common.getCurrentPage(currentPage, pageCount);
		model.addAttribute(Constants.PAGE, currentPage);// 当前是第几页的帖子
		long from = (currentPage - 1) * Constants.POST_PAGE_SIZE;
		List<Post> posts = null;
		if ("viewCount".equals(orderBy)) {// 热门查看
			posts = postService.getGroupPosts(myUid, group, from,
					Constants.POST_PAGE_SIZE, "viewCount");
		} else {// 最新发布
			posts = postService.getGroupPosts(myUid, group, from,
					Constants.POST_PAGE_SIZE, "id");
		}
		model.addAttribute(Constants.POSTS, posts);// 将要显示的post
	}
}
