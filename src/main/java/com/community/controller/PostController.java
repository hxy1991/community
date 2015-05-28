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
import org.springframework.web.bind.annotation.SessionAttributes;

import com.community.domain.Post;
import com.community.service.CommentService;
import com.community.service.GroupService;
import com.community.service.PostService;
import com.community.service.UserPostViewService;
import com.community.service.UserService;
import com.community.web.Common;
import com.community.web.Constants;

@Controller
@SessionAttributes("myUid")
public class PostController {
	private static final Logger logger = LoggerFactory
			.getLogger(PostController.class);

	@Autowired
	private UserService userService;
	@Autowired
	private PostService postService;
	@Autowired
	private GroupService groupService;
	@Autowired
	private UserPostViewService userPostViewService;
	@Autowired
	private CommentService commentService;

	@RequestMapping(value = "/post/{pid}", method = RequestMethod.GET)
	public String post(
			Model model,
			HttpServletRequest request,
			@RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
			@PathVariable("pid") Long pid, @ModelAttribute("myUid") Long myUid) {
		Post post = postService.getPostById(myUid, pid);// 阅读次数+1后再查询。更有用户体验
		postService.addViewCount(post);// TODO 该帖子不存在的情况。
		userPostViewService.createUserPostView(myUid, pid);// 记录是哪个用户查看了该帖子
		model.addAttribute("pid", pid);
		model.addAttribute("post", post);//
		model.addAttribute(Constants.GROUP, post.getGroup());// 社群的有关信息,为了groupMsg而传递
		setComments(model, myUid, pid, page);
		model.addAttribute("myNickname", userService
				.getUserById(myUid).getNickname());
		model.addAttribute(Constants.CURRENT_URL, Common.getCurrentURL(request));
		return "post";
	}

	@RequestMapping(value = "/post", method = RequestMethod.POST)
	public ResponseEntity<Void> insert(Model model, HttpServletRequest request,
			@RequestParam(value = "gid") Long gid,
			@RequestParam(value = "title") String title,
			@RequestParam(value = "tags") String tags,
			@RequestParam(value = "content") String content,
			@ModelAttribute("myUid") Long myUid) {
		Post post = new Post();
		post.setUid(myUid);
		post.setGid(gid);
		post.setTitle(title);
		post.setTags(tags);
		post.setContent(content);
		postService.insertPost(post);
		if (post.getId() != 0) {
			return ResponseEntity.status(HttpStatus.CREATED).build();
		}
		return ResponseEntity.status(HttpStatus.CONFLICT).build();
	}

	@RequestMapping(value = "/post/{pid}", method = RequestMethod.DELETE)
	public @ResponseBody ResponseEntity<Void> delete(Model model,
			HttpServletRequest request, @PathVariable("pid") Long pid,
			@ModelAttribute("myUid") Long myUid) {
		boolean success = postService.deletePost(myUid, pid);
		if (success) {
			return ResponseEntity.status(HttpStatus.NO_CONTENT).build();
		}
		return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
	}

	/**
	 * 设置将要显示的评论列表
	 * 
	 * @param request
	 * @param pid
	 */
	private void setComments(Model model, long myUid, long pid, int currentPage) {
		// 总共有多少页
		int commentCount = commentService.getPostCommentCount(pid);
		int pageCount = Common.getPageCount(commentCount,
				Constants.COMMENT_PAGE_SIZE);
		model.addAttribute(Constants.PAGE_COUNT, pageCount);
		// 将要显示的是第几页
		currentPage = Common.getCurrentPage(currentPage, pageCount);
		model.addAttribute(Constants.PAGE, currentPage);
		// 将要显示的列表
		long from = (currentPage - 1) * Constants.COMMENT_PAGE_SIZE;
		model.addAttribute("comments", commentService.getPostComments(
				myUid, pid, from, Constants.COMMENT_PAGE_SIZE));
	}
}
