package com.community.service;

import java.util.List;

import com.community.domain.User;

public interface UserService {

	public User getUserByEmail(String email);

	public void insertUser(User user);

	public boolean updateUser(User user);

//	public boolean updateLoginTime(User user);

	public User getUserById(long uid);

	public User getUserByNickname(String nickname);

	public User getUserById(long myUid, long id);

	public int getUserCount();

	public List<User> getUsers(long myUid, long from, int userPageSize);

	public List<User> getTopPostCountUsers(long myUid, int topCount);

	public List<User> getTopResourceCountUsers(long myUid, int topCount);

	public List<User> getTopFollowerCountUsers(long myUid, int topCount);

	public int searchUserCount(String word);

	public List<User> searchUser(long myUid, String word, int from, int pageSize);

}
