package com.community.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.community.dao.RelationshipDao;
import com.community.domain.Relationship;
import com.community.domain.User;

@Service
public class RelationshipServiceImpl implements RelationshipService {

	@Autowired
	private RelationshipDao relationshipDao;
	@Autowired
	private UserService userService;

	@Override
	public void insertFriendship(Relationship relationship) {
		relationshipDao.insertRelationship(relationship);
	}

	@Override
	public boolean deleteFriendship(long myUid, long uid) {
		return relationshipDao.deleteFriendship(myUid, uid) == 1;
	}

	@Override
	public boolean isMyFollower(long myUid, long uid) {
		Relationship relationship = relationshipDao.getRelationship(uid, myUid);
		return relationship != null;
	}

	@Override
	public boolean isMyFriend(long myUid, long uid) {
		Relationship relationship = relationshipDao.getRelationship(myUid, uid);
		return relationship != null;
	}

	@Override
	public int getFollowerCount(long uid) {
		return relationshipDao.getFollowerCount(uid);
	}

	@Override
	public List<User> getFollowersByUid(long myUid, long uid, long from,
			int pageSize) {
		List<Relationship> list = relationshipDao.getFollowersByUid(uid, from,
				pageSize);
		List<User> result = new ArrayList<User>();
		for (Relationship relationship : list) {
			long follow = relationship.getFollow();
			User user = userService.getUserById(myUid, follow);
			result.add(user);
		}
		return result;
	}

	@Override
	public int getFriendCount(long uid) {
		return relationshipDao.getFriendCount(uid);
	}

	@Override
	public List<User> getFriendsByUid(long myUid, long uid, long from,
			int pageSize) {
		List<Relationship> list = relationshipDao.getFriendsByUid(uid, from,
				pageSize);
		List<User> result = new ArrayList<User>();
		for (Relationship relationship : list) {
			long followed = relationship.getFollowed();
			User user = userService.getUserById(myUid, followed);
			result.add(user);
		}
		return result;
	}

}
