package com.community.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.community.domain.UserGroup;

/**
 * 用户关注群组
 * 
 * @author 蜗牛都知道
 * 
 */
public interface UserGroupDao {

	/**
	 * 根据uid获取用户所关注的群组
	 * 
	 * @param uid
	 * @return
	 */
	public int getFollowedGroupCountByUid(@Param("uid") long uid);

	/**
	 * uid用户关注了id社群
	 * 
	 * @param uid
	 *            用户id
	 * @param gid
	 *            社群id
	 */
	public void insertUserGroup(UserGroup userGroup);

	/**
	 * 获取社群gid的粉丝数目
	 * 
	 * @param gid
	 * @return
	 */
	public int getGroupFollowerCount(@Param("gid") long gid);

	public List<UserGroup> getGroupFollowers(@Param("gid") long gid,
			@Param("from") long from, @Param("pageSize") int pageSize);

	/**
	 * myUid用取消关注gid社群
	 * 
	 * @param myUid
	 * @param gid
	 * @return
	 */
	public int deleteUserGroup(@Param("uid") long uid, @Param("gid") long gid);

	public UserGroup getUerGroupByUidAndGid(@Param("uid") long uid,
			@Param("gid") long gid);

}
