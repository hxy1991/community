package com.community.service;

import java.util.List;

import com.community.domain.Group;
import com.community.domain.Resource;

public interface ResourceService {

	public int getGroupResourceCount(long gid);

	public int getUserResourceCount(long uid);

	public List<Resource> getResourcesByUid(long uid, long from, int pageSize);

	public Resource getResourceById(long myUid, long id);

	public List<Resource> getGroupResources(Group group, long from, int pageSize);

	public void insertResource(Resource resource);

	public boolean deleteResource(long myUid, long cid);

}
