package com.community.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.community.dao.GroupDao;
import com.community.domain.Group;

@Service
public class GroupServiceImpl implements GroupService {

	@Autowired
	private GroupDao groupDao;
	@Autowired
	private UserService userService;
	@Autowired
	private UserGroupService userGroupService;
	@Autowired
	private PostService postService;
	@Autowired
	private ResourceService resourceService;

	@Override
	public Group getGroupById(long myUid, long gid) {
		Group group = groupDao.getGroupById(gid);
		fillGroup(myUid, group);
		return group;
	}

	private void fillGroup(long myUid, Group group) {
		long gid = group.getId();

		group.setFollowerCount(userGroupService.getGroupFollowerCount(gid));
		group.setPostCount(postService.getGroupPostCount(gid));
		group.setResourceCount(resourceService.getGroupResourceCount(gid));
		boolean isFollowed = userGroupService.isFollowed(myUid, gid);
		group.setFollowed(isFollowed);
	}

	private void fillGroup(long myUid, List<Group> list) {
		for (Group group : list) {
			fillGroup(myUid, group);
		}

	}

	@Override
	public int getGroupCount() {
		return groupDao.getGoupCount();
	}

	@Override
	public List<Group> getGroups(long myUid, long from, int pageSize) {
		List<Group> list = groupDao.getGroups(from, pageSize);
		fillGroup(myUid, list);
		return list;
	}

	@Override
	public List<Group> getGroupsByUid(long myUid, long uid, long from,
			int pageSize) {
		List<Group> list = groupDao.getGoupsByUid(uid, from, pageSize);
		fillGroup(myUid, list);
		return list;
	}

	@Override
	public int searchGroupCount(String word) {
		return groupDao.searchGroupCount(word);
	}

	@Override
	public List<Group> searchGroup(long myUid, String word, long from,
			int pageSize) {
		List<Group> list = groupDao.searchGroup(word, from, pageSize);
		fillGroup(myUid, list);
		return list;
	}

	@Override
	public List<Group> getTopPostCountGroups(long myUid, int topCount) {
		List<Group> list = groupDao.getTopPostCountGroups(topCount);
		fillGroup(myUid, list);
		return list;
	}

	@Override
	public List<Group> getTopResourceCountGroups(long myUid, int topCount) {
		List<Group> list = groupDao.getTopResourceCountGroups(topCount);
		fillGroup(myUid, list);
		return list;
	}

	@Override
	public List<Group> getTopFollowerCountGroups(long myUid, int topCount) {
		List<Group> list = groupDao.getTopPostCountGroups(topCount);
		fillGroup(myUid, list);
		return list;
	}

	@Override
	public int getUserGroupCount(long uid) {
		return groupDao.getUserGroupCount(uid);
	}

	@Override
	public void insertGroup(Group group) {
		groupDao.insertGroup(group);
	}

}
