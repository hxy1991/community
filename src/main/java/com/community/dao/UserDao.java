package com.community.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.community.domain.User;

public interface UserDao {

	public User getUserByEmail(@Param("email") String email);

	public User getUserByNickname(@Param("nickname") String nickname);

	public User getUserById(@Param("id") long id);

	/**
	 * 添加新用户
	 * 
	 * @param user
	 * @return
	 */
	public int insertUser(User user);

	public int updateUser(User user);

	public int getUserCount();

	public List<User> getUsers(@Param("from") long from,
			@Param("pageSize") int pageSize);

	/**
	 * 帖子数最多的前topCount个社群
	 * 
	 * @return
	 */
	public List<User> getTopPostCountUsers(@Param("topCount") int topCount);

	/**
	 * 资源数最多的前topCount个社群
	 * 
	 * @return
	 */
	public List<User> getTopResourceCountUsers(@Param("topCount") int topCount);

	/**
	 * 粉丝数数最多的前topCount个社群
	 * 
	 * @return
	 */
	public List<User> getTopFollowerCountUsers(@Param("topCount") int topCount);

	public int searchUserCount(@Param("word") String word);

	public List<User> searchUser(@Param("word") String word,
			@Param("from") int from, @Param("pageSize") int pageSize);

}
