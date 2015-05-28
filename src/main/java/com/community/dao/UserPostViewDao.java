package com.community.dao;

import java.util.List;

import com.community.domain.UserPostView;

/**
 * 记录用户查看了那些帖子
 * 
 * @author
 * 
 */
public interface UserPostViewDao {

	public void createUserPostView(UserPostView userPostView);

	/**
	 * 获取某个用户的阅读了哪些帖子
	 * 
	 * @param myUid
	 * @return
	 */
	public List<UserPostView> getUserPostViews(long uid, long from, int pageSize);
}
