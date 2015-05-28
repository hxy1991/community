package com.community.service;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.community.dao.UserGroupDao;
import com.community.domain.User;
import com.community.domain.UserGroup;

/**
 * 
 * @author wynlqxm
 * @create 2015年5月12日 下午10:22:27
 */
@Service
public class UserGroupServiceImpl implements UserGroupService {
	private static final Logger logger = LoggerFactory
			.getLogger(UserGroupServiceImpl.class);
	@Autowired
	private UserGroupDao userGroupDao;
	@Autowired
	private UserService userService;

	@Override
	public int getFollowedGroupCountByUid(long uid) {
		return userGroupDao.getFollowedGroupCountByUid(uid);
	}

	@Override
	public int getGroupFollowerCount(long gid) {
		return userGroupDao.getGroupFollowerCount(gid);
	}

	@Override
	public boolean isFollowed(long myUid, long gid) {
		UserGroup userGroup = userGroupDao.getUerGroupByUidAndGid(myUid, gid);
		return userGroup != null;
	}

	@Override
	public List<User> getGroupFollowers(long myUid, long gid, long from,
			int pageSize) {
		List<UserGroup> list = userGroupDao.getGroupFollowers(gid, from,
				pageSize);
		List<User> result = new ArrayList<User>();
		for (UserGroup userGroup : list) {
			User user = userService.getUserById(userGroup.getUid());
			result.add(user);
		}
		return result;
	}

	@Override
	public void insertUserGroup(UserGroup userGroup) {
		userGroupDao.insertUserGroup(userGroup);
	}

	@Override
	public boolean deleteUserGroup(long uid, long gid) {
		return userGroupDao.deleteUserGroup(uid, gid) == 1;
	}

}
