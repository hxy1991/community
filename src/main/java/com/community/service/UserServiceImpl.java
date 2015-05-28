package com.community.service;

import java.sql.Timestamp;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.cache.annotation.Caching;
import org.springframework.stereotype.Service;

import com.community.dao.UserDao;
import com.community.domain.User;
import com.community.util.StringUtils;

/**
 * 
 * @author wynlqxm
 * @create 2015年5月12日 下午10:22:27
 */
@Service
@CacheConfig(cacheNames = { "user" })
public class UserServiceImpl implements UserService {
	private static final Logger logger = LoggerFactory
			.getLogger(UserServiceImpl.class);

	@Autowired
	public UserDao userDao;
	@Autowired
	public RelationshipService relationshipService;
	@Autowired
	public PostService postService;
	@Autowired
	public GroupService groupService;
	@Autowired
	public ResourceService resourceService;

	// TODO @Cacheable和@CachePut不能同时
	// @Caching(
	// cacheable = {
	// @Cacheable(key = "#email")
	// } ,
	// put = {
	// @CachePut(key = "#result.id", condition = "#result != null"),
	// @CachePut(key = "#result.nickname", condition = "#result != null")
	// }
	// )

	@Override
	@Cacheable(key = "#email")
	public User getUserByEmail(String email) {
		return userDao.getUserByEmail(email);
	}

	@Override
	@Cacheable(key = "#nickname")
	public User getUserByNickname(String nickname) {
		return userDao.getUserByNickname(nickname);
	}

	@Override
	@Caching(put = { @CachePut(key = "#user.id"),
			@CachePut(key = "#user.email"), @CachePut(key = "#user.nickname") })
	public void insertUser(User user) {
		user.setPassword(StringUtils.md5(user.getPassword()));
		userDao.insertUser(user);
	}

	@Override
	@Caching(evict = { @CacheEvict(key = "#user.id"),
			@CacheEvict(key = "#user.email"),
			@CacheEvict(key = "#user.nickname"), })
	public boolean updateUser(User user) {
		return userDao.updateUser(user) == 1;
	}

	@Override
	@Cacheable(key = "#id")
	public User getUserById(long id) {
		return userDao.getUserById(id);
	}

	@Override
	public User getUserById(long myUid, long id) {
		User user = getUserById(id);
		fillUser(myUid, user);
		return user;
	}

	private void fillUser(long myUid, User user) {
		String description = user.getDescription();
		if (description == null) {
			user.setDescription("");
		}
		String avaterURI = user.getAvaterURI();
		if (avaterURI == null || "".equals(avaterURI)) {
			if (user.getSex() == 1) {
				user.setAvaterURI("resources/avater/180/male_default.jpg");
			} else {
				user.setAvaterURI("resources/avater/180/female_default.jpg");
			}
		}

		long uid = user.getId();
		int friendCount = relationshipService.getFriendCount(uid);
		int followerCount = relationshipService.getFollowerCount(uid);
		int postCount = postService.getUserPostCount(uid);
		int groupCount = groupService.getUserGroupCount(uid);
		int resourceCount = resourceService.getUserResourceCount(uid);
		boolean isMyFriend = relationshipService.isMyFriend(myUid, uid);
		boolean isMyFollower = relationshipService.isMyFollower(myUid, uid);

		user.setFriendCount(friendCount);
		user.setFollowerCount(followerCount);
		user.setPostCount(postCount);
		user.setGroupCount(groupCount);
		user.setResourceCount(resourceCount);
		user.setMyFriend(isMyFriend);
		user.setMyFollower(isMyFollower);

	}

	private void fillUser(long myUid, List<User> list) {
		for (User user : list) {
			fillUser(myUid, user);
		}
	}

	@Override
	public int getUserCount() {
		return userDao.getUserCount();
	}

	@Override
	public List<User> getUsers(long myUid, long from, int pageSize) {
		List<User> list = userDao.getUsers(from, pageSize);
		fillUser(myUid, list);
		return list;
	}

	@Override
	public List<User> getTopPostCountUsers(long myUid, int topCount) {
		List<User> list = userDao.getTopPostCountUsers(topCount);
		fillUser(myUid, list);
		return list;
	}

	@Override
	public List<User> getTopResourceCountUsers(long myUid, int topCount) {
		List<User> list = userDao.getTopResourceCountUsers(topCount);
		fillUser(myUid, list);
		return list;
	}

	@Override
	public List<User> getTopFollowerCountUsers(long myUid, int topCount) {
		List<User> list = userDao.getTopFollowerCountUsers(topCount);
		fillUser(myUid, list);
		return list;
	}


	@Override
	public int searchUserCount(String word) {
		return userDao.searchUserCount(word);
	}

	@Override
	public List<User> searchUser(long myUid, String word, int from, int pageSize) {
		List<User> list = userDao.searchUser(word, from, pageSize);
		fillUser(myUid, list);
		return list;
	}

}
