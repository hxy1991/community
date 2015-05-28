package com.community.service;

import java.util.List;

import com.community.domain.Relationship;
import com.community.domain.User;

public interface RelationshipService {

	void insertFriendship(Relationship relationship);

	boolean deleteFriendship(long myUid, long uid);

	boolean isMyFollower(long myUid, long uid);

	boolean isMyFriend(long myUid, long uid);

	int getFollowerCount(long uid);

	List<User> getFollowersByUid(long myUid, long uid, long from, int userPageSize);

	int getFriendCount(long uid);

	List<User> getFriendsByUid(long myUid, long uid, long from, int userPageSize);

}
