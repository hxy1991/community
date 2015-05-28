package com.community.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.community.domain.Comment;

public interface CommentDao {
	/**
	 * 根据pid获取一个post的评论数
	 * 
	 * @param pid
	 * @return
	 */
	public int getPostCommentCount(@Param("pid") long pid);

	/**
	 * 获取一个post中最后一个评论者的id
	 * 
	 * @param pid
	 * @return
	 */
	public Comment getLastCommentByPid(@Param("pid") long pid);

	/**
	 * 获取pid的评论列表,从from开始后的pageSzie个（不包含第from个）
	 * 
	 * @param pid
	 * @param from
	 * @param pageSize
	 * @return
	 */
	public List<Comment> getPostComments(@Param("pid") long pid,
			@Param("from") long from, @Param("pageSize") int pageSize);

	/**
	 * 发表评论
	 * 
	 * @param myUid
	 * @param pid
	 * @param content
	 * @return
	 */
	public void insertComment(Comment comment);

	/**
	 * cid的comment是否为uid所有
	 * 
	 * @param uid
	 * @param cid
	 * @return
	 */
	public Comment getCommentById(long id);

	/**
	 * 删除id的comment
	 * 
	 * @param id
	 * @return
	 */
	public int deleteComment(@Param("uid")long uid, @Param("id")long id);

}
