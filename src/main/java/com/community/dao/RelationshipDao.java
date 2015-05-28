package com.community.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.community.domain.Relationship;

/**
 * 查询用户好友
 * 
 * @author Administrator
 * 
 */
public interface RelationshipDao {

	/**
	 * 根据uid获取用户关注人数
	 * 
	 * @param uid
	 * @return
	 */
	public int getFriendCount(@Param("uid") long uid);

	/**
	 * 根据uid获取用户粉丝人数
	 * 
	 * @param uid
	 * @return
	 */
	public int getFollowerCount(@Param("uid") long uid);

	/**
	 * myUid关注uid
	 * 
	 * @param myUid
	 * @param uid
	 * @return
	 */
	public boolean insertRelationship(Relationship relationship);

	/**
	 * myUid取消关注uid
	 * 
	 * @param myUid
	 * @param uid
	 * @return
	 */
	public int deleteFriendship(@Param("follow") long follow,
			@Param("followed") long followed);

	public List<Relationship> getFollowersByUid(@Param("uid") long uid,
			@Param("from") long from, @Param("pageSize") int pageSize);

	public List<Relationship> getFriendsByUid(@Param("uid") long uid,
			@Param("from") long from, @Param("pageSize") int pageSize);

	public Relationship getRelationship(@Param("follow") long follow,
			@Param("followed") long followed);
}
