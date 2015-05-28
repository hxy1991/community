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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.community.domain.Comment;
import com.community.service.CommentService;
import com.community.service.PostService;
import com.community.service.RelationshipService;
import com.community.service.UserGroupService;
import com.community.service.UserService;

@Controller
@SessionAttributes("myUid")
public class CommentController {
	private static final Logger logger = LoggerFactory
			.getLogger(CommentController.class);

	@Autowired
	private UserService userService;
	@Autowired
	private PostService postService;
	@Autowired
	private UserGroupService userGroupService;
	@Autowired
	private CommentService commentService;
	@Autowired
	private RelationshipService relationshipService;

	@RequestMapping(value = "/comment", method = RequestMethod.POST)
	public @ResponseBody ResponseEntity<Void> insert(Model model,
			HttpServletRequest request, @RequestParam(value = "pid") Long pid,
			@RequestParam(value = "content") String content,
			@ModelAttribute("myUid") Long myUid) {
		Comment comment = new Comment();
		comment.setUid(myUid);
		comment.setPid(pid);
		comment.setContent(content);
		commentService.insertComment(comment);
		if (comment.getId() != 0) {
			return ResponseEntity.status(HttpStatus.CREATED).build();
		}
		return ResponseEntity.status(HttpStatus.CONFLICT).build();
	}

	@RequestMapping(value = "/comment/{cid}", method = RequestMethod.DELETE)
	public @ResponseBody ResponseEntity<Void> delete(Model model,
			HttpServletRequest request, @PathVariable("cid") Long cid,
			@ModelAttribute("myUid") Long myUid) {
		boolean success = commentService.deleteComment(myUid, cid);
		if (success) {
			return ResponseEntity.status(HttpStatus.NO_CONTENT).build();
		}
		return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
	}

}
