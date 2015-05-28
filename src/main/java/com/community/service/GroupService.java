package com.community.service;

import java.util.List;

import com.community.domain.Group;

public interface GroupService {
	Group getGroupById(long myUid, long gid);

	int getGroupCount();

	List<Group> getGroups(long myUid, long from, int pageSize);
	
	int getUserGroupCount(long uid);

	List<Group> getGroupsByUid(long myUid, long uid, long from, int pageSize);

	int searchGroupCount(String word);

	List<Group> searchGroup(long myUid, String word, long from, int pageSize);

	List<Group> getTopPostCountGroups(long myUid, int topCount);

	List<Group> getTopResourceCountGroups(long myUid, int topCount);

	List<Group> getTopFollowerCountGroups(long myUid, int topCount);

	void insertGroup(Group group);


}
