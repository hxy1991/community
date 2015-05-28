package com.community.service;

import java.util.List;

import com.community.dao.CommentDao;
import com.community.domain.Comment;

public interface CommentService {


	public Comment getLastCommentByPid(long myUid, long pid);

	/**
	 * 发表评论
	 * 
	 * @see CommentDao#createComment(int, int, int)
	 * @param myUid
	 * @param pid
	 * @param content
	 * @return
	 */
	public void insertComment(Comment comment);


	public int getPostCommentCount(long pid);

	public List<Comment> getPostComments(long myUid, long pid, long from,
			int pageSize);

	public boolean deleteComment(Long myUid, Long cid);
}
