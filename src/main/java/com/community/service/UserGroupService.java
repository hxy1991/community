package com.community.service;

import java.util.List;

import com.community.domain.User;
import com.community.domain.UserGroup;

public interface UserGroupService {
	int getFollowedGroupCountByUid(long uid);

	boolean isFollowed(long myUid, long gid);

	int getGroupFollowerCount(long gid);

	List<User> getGroupFollowers(long myUid, long gid, long from, int userPageSize);

	void insertUserGroup(UserGroup userGroup);

	boolean deleteUserGroup(long uid, long gid);

}
