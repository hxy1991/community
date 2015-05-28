package com.community.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.community.dao.PostDao;
import com.community.domain.Comment;
import com.community.domain.Group;
import com.community.domain.Post;
import com.community.domain.User;

/**
 * 
 * @author wynlqxm
 * @create 2015年5月12日 下午10:22:27
 */
@Service
public class PostServiceImpl implements PostService {
	private static final Logger logger = LoggerFactory
			.getLogger(PostServiceImpl.class);

	@Autowired
	public PostDao postDao;
	@Autowired
	public UserService userService;
	@Autowired
	public CommentService commentService;
	@Autowired
	public GroupService groupService;

	@Override
	public int getGroupPostCount(long gid) {
		return postDao.getGroupPostCount(gid);
	}

	@Override
	public List<Post> getGroupPosts(long myUid, Group group, long from,
			int pageSize, String order) {
		List<Post> list = postDao.getGroupPosts(group.getId(), from, pageSize,
				order);
		for (Post post : list) {
			post.setGroup(group);

			long uid = post.getUid();
			User user = userService.getUserById(myUid, uid);
			post.setAuthor(user);

			long pid = post.getId();
			Comment lastComment = commentService
					.getLastCommentByPid(myUid, pid);
			post.setLastReviewer(lastComment.getReviewer());

			int commentCount = commentService.getPostCommentCount(pid);
			post.setCommentCount(commentCount);
		}
		return list;
	}

	@Override
	public int getUserPostCount(long uid) {
		return postDao.getUserPostCount(uid);
	}

	@Override
	public List<Post> getPostsByUid(long myUid, long uid, long from,
			int pageSize) {
		List<Post> list = postDao.getPostsByUid(uid, from, pageSize);
		fillPost(myUid, list);
		return list;
	}

	@Override
	public int getFollowerGroupPostCount(long uid) {
		return postDao.getFollowerGroupPostCount(uid);
	}

	@Override
	public List<Post> getFollowerGroupPost(long myUid, long uid, long from,
			int pageSize) {
		List<Post> list = postDao.getFollowerGroupPost(uid, from, pageSize);
		fillPost(myUid, list);
		return list;
	}

	@Override
	public int getFriendPostCount(long uid) {
		return postDao.getFriendPostCount(uid);
	}

	@Override
	public List<Post> getFriendPosts(long myUid, long uid, long from,
			int pageSize) {
		List<Post> list = postDao.getFriendPosts(uid, from, pageSize);
		fillPost(myUid, list);
		return list;
	}

	@Override
	public Post getPostById(long myUid, long pid) {
		Post post = postDao.getPostById(pid);
		fillPost(myUid, post);
		return post;
	}

	@Override
	public void insertPost(Post post) {
		postDao.insertPost(post);
	}

	@Override
	public void addViewCount(Post post) {
		post.setViewCount(post.getViewCount() + 1);
		postDao.updateViewCount(post);
	}

	@Override
	public int searchPostCount(String word) {
		return postDao.searchPostCount(word);
	}

	@Override
	public List<Post> searchPost(long myUid, String word, long from,
			int pageSize) {
		List<Post> list = postDao.searchPost(word, from, pageSize);
		fillPost(myUid, list);
		return list;
	}


	@Override
	public boolean deletePost(long uid, long pid) {
		return postDao.deletePost(uid, pid) == 1;
	}

	private void fillPost(long myUid, List<Post> list) {
		for (Post post : list) {
			fillPost(myUid, post);
		}
	}

	private void fillPost(long myUid, Post post) {
		long gid = post.getGid();
		Group group = groupService.getGroupById(myUid, gid);
		post.setGroup(group);

		long uid = post.getUid();
		User user = userService.getUserById(myUid, uid);
		post.setAuthor(user);

		long pid = post.getId();
		Comment lastComment = commentService.getLastCommentByPid(myUid, pid);
		post.setLastReviewer(lastComment.getReviewer());

		int commentCount = commentService.getPostCommentCount(pid);
		post.setCommentCount(commentCount);
	}

}
