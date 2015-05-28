package com.community.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.community.domain.UserGroup;
import com.community.service.PostService;
import com.community.service.RelationshipService;
import com.community.service.ResourceService;
import com.community.service.UserGroupService;
import com.community.service.UserService;

@Controller
@SessionAttributes("myUid")
public class UserGroupController {
	private static final Logger logger = LoggerFactory
			.getLogger(UserGroupController.class);

	@Autowired
	private UserService userService;
	@Autowired
	private PostService postService;
	@Autowired
	private UserGroupService userGroupService;
	@Autowired
	private ResourceService resourceService;
	@Autowired
	private RelationshipService relationshipService;

	@RequestMapping(value = "/userGroup/{gid}", method = RequestMethod.POST)
	public @ResponseBody ResponseEntity<Void> create(Model model,
			HttpServletRequest request, @PathVariable("gid") Long gid,
			@ModelAttribute("myUid") Long myUid) {
		UserGroup userGroup = new UserGroup();
		userGroup.setUid(myUid);
		userGroup.setGid(gid);
		userGroupService.insertUserGroup(userGroup);
		if (userGroup.getId() != 0) {
			return ResponseEntity.status(HttpStatus.CREATED).build();
		}
		return ResponseEntity.status(HttpStatus.CONFLICT).build();
	}

	@RequestMapping(value = "/userGroup/{gid}", method = RequestMethod.DELETE)
	public @ResponseBody ResponseEntity<Void> delete(Model model,
			HttpServletRequest request, @PathVariable("gid") Long gid,
			@ModelAttribute("myUid") Long myUid) {
		boolean success = userGroupService.deleteUserGroup(myUid, gid);
		if (success) {
			return ResponseEntity.status(HttpStatus.NO_CONTENT).build();
		}
		return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
	}

}
