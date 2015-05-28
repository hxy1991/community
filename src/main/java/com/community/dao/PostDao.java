package com.community.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.community.domain.Post;

/**
 * 与帖子表相关的操作
 * 
 * @author
 * 
 */
public interface PostDao {
	/**
	 * 根据uid获取用户发的帖子数
	 * 
	 * @param uid
	 * @return
	 */
	public int getUserPostCount(@Param("uid") long uid);

	/**
	 * 根据gid获取社群中所含有的帖子数
	 * 
	 * @param uid
	 * @return
	 */
	public int getGroupPostCount(@Param("gid") long gid);

	/**
	 * 
	 * 获取社群gid,从第from之后的pageSize个帖子（不包含第from个）
	 * 
	 * @param gid
	 *            社群的id
	 * @param pageSize
	 * @param pageNum
	 * @return
	 */
	public List<Post> getGroupPosts(@Param("gid") long gid,
			@Param("from") long from, @Param("pageSize") int pageSize,
			@Param("orderBy") String orderBy);

	/**
	 * 获取用户uid,从第from之后的pageSize个帖子（不包含第from个）
	 * 
	 * @param uid
	 * @param from
	 * @param pageSize
	 * @return
	 */
	public List<Post> getPostsByUid(@Param("uid") long uid,
			@Param("from") long from, @Param("pageSize") int pageSize);

	/**
	 * 根据uid查询其社群动态总个数
	 * 
	 * @param uid
	 * @return
	 */
	public int getFollowerGroupPostCount(@Param("uid") long uid);

	/**
	 * 根据uid查询其社群动态，从第from之后的pageSize个帖子（不包含第from个）
	 * 
	 * @param uid
	 * @param from
	 * @param pageSize
	 * @return
	 */
	public List<Post> getFollowerGroupPost(@Param("uid") long uid,
			@Param("from") long from, @Param("pageSize") int pageSize);

	/**
	 * 根据uid查询其好友动态总个数，
	 * 
	 * @param uid
	 * @return
	 */
	public int getFriendPostCount(@Param("uid") long uid);

	/**
	 * 根据uid查询其好友动态，从第from之后的pageSize个帖子（不包含第from个），
	 * 
	 * @param uid
	 * @param from
	 * @param pageSize
	 * @return
	 */
	public List<Post> getFriendPosts(@Param("uid") long uid,
			@Param("from") long from, @Param("pageSize") int pageSize);

	/**
	 * 根据id获取Post
	 * 
	 * @param pid
	 * @return
	 */
	public Post getPostById(@Param("id") long id);

	/**
	 * 发布新的帖子
	 * 
	 * @param uid
	 *            用户id
	 * @param gid
	 *            社群id
	 * @param title
	 *            标题
	 * @param content
	 *            内容
	 * @return
	 */
	public boolean insertPost(Post post);

	/**
	 * 
	 * @param pid
	 */
	public void updateViewCount(Post post);

	public int searchPostCount(@Param("word") String word);

	/**
	 * 
	 * @param word
	 * @param from
	 * @param pageSize
	 * @return
	 */
	public List<Post> searchPost(@Param("word") String word,
			@Param("from") long from, @Param("pageSize") int pageSize);

	/**
	 * post的id为pid的是否是uid用户所有的
	 * 
	 * @param uid
	 * @param pid
	 * @return
	 */
	public boolean isMyPost(@Param("uid") long uid, @Param("pid") long pid);

	/**
	 * 删除post
	 * 
	 * @param pid
	 * @return
	 */
	public int deletePost(@Param("uid") long uid, @Param("id") long id);

}
