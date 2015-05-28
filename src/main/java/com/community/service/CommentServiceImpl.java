package com.community.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.stereotype.Service;

import com.community.dao.CommentDao;
import com.community.domain.Comment;
import com.community.domain.Post;
import com.community.domain.User;

@Service
@CacheConfig(cacheNames = { "comment" })
public class CommentServiceImpl implements CommentService {

	@Autowired
	private CommentDao commentDao;
	@Autowired
	private UserService userService;
	@Autowired
	private PostService postService;

	/**
	 * 发表评论
	 * 
	 * @see CommentDao#createComment(int, int, int)
	 * @param myUid
	 * @param pid
	 * @param content
	 * @return
	 */

	public void insertComment(Comment comment) {
		commentDao.insertComment(comment);
	}

	@Override
	public Comment getLastCommentByPid(long myUid, long pid) {
		Comment comment = commentDao.getLastCommentByPid(pid);
		if (comment != null) {
			User user = userService.getUserById(comment.getUid());
			comment.setReviewer(user);
		} else {
			comment = Comment.NULL;
			comment.setReviewer(User.NULL);
		}
		return comment;
	}

	@Override
	public int getPostCommentCount(long pid) {
		return commentDao.getPostCommentCount(pid);
	}

	@Override
	public List<Comment> getPostComments(long myUid, long pid, long from,
			int pageSize) {
		List<Comment> list = commentDao.getPostComments(pid, from, pageSize);
		fillComment(myUid, list);
		return list;
	}

	private void fillComment(long myUid, Comment comment) {
		User user = userService.getUserById(comment.getUid());
		comment.setReviewer(user);

		long pid = comment.getPid();
		Post post = postService.getPostById(myUid, pid);
		comment.setPost(post);
	}

	private void fillComment(long myUid, List<Comment> list) {
		for (Comment comment : list) {
			fillComment(myUid, comment);
		}
	}

	@Override
	public boolean deleteComment(Long myUid, Long cid) {
		return commentDao.deleteComment(myUid, cid) == 1;
	}

}
