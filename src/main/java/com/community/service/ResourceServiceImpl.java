package com.community.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.community.dao.ResourceDao;
import com.community.domain.Group;
import com.community.domain.Resource;
import com.community.domain.User;
import com.community.web.Common;

/**
 * 
 * @author wynlqxm
 * @create 2015年5月12日 下午10:22:27
 */
@Service
public class ResourceServiceImpl implements ResourceService {
	@Autowired
	private ResourceDao resourceDao;
	@Autowired
	private UserService userService;
	@Autowired
	private GroupService groupService;
	@Autowired
	private ResourceDownloadService resourceDownloadService;

	@Override
	public int getGroupResourceCount(long gid) {
		return resourceDao.getGroupResourceCount(gid);
	}

	@Override
	public int getUserResourceCount(long uid) {
		return resourceDao.getUserResourceCount(uid);
	}

	@Override
	public List<Resource> getResourcesByUid(long uid, long from, int pageSize) {
		List<Resource> list = resourceDao
				.getResourcesByUid(uid, from, pageSize);
		fillResource(uid, list);
		return list;
	}

	private void fillResource(long myUid, List<Resource> list) {
		for (Resource resource : list) {
			fillResource(myUid, resource);
		}
	}

	private void fillResource(long myUid, Resource resource) {
		long id = resource.getId();
		long uid = resource.getUid();
		long gid = resource.getGid();

		User user = userService.getUserById(uid);
		Group group = groupService.getGroupById(myUid, gid);
		int downloadCount = resourceDownloadService
				.getResourceDownloadCount(id);

		resource.setUser(user);
		resource.setGroup(group);
		resource.setDownloadCount(downloadCount);
		String downloadURL = resource.getDownloadURL();
		resource.setFileExtension(Common.getFileExtension(downloadURL));
	}

	@Override
	public Resource getResourceById(long myUid, long id) {
		Resource resource = resourceDao.getResourceById(id);
		fillResource(myUid, resource);
		return resource;
	}

	@Override
	public List<Resource> getGroupResources(Group group, long from, int pageSize) {
		long gid = group.getId();
		List<Resource> list = resourceDao
				.getGroupResources(gid, from, pageSize);
		for (Resource resource : list) {
			long id = resource.getId();
			long uid = resource.getUid();
			User user = userService.getUserById(uid);
			int downloadCount = resourceDownloadService
					.getResourceDownloadCount(id);
			resource.setUser(user);
			resource.setGroup(group);
			resource.setDownloadCount(downloadCount);
			String downloadURL = resource.getDownloadURL();
			resource.setFileExtension(Common.getFileExtension(downloadURL));
		}
		return list;
	}

	@Override
	public void insertResource(Resource resource) {
		resourceDao.insertResource(resource);
	}

	@Override
	public boolean deleteResource(long uid, long id) {
		return resourceDao.deleteResource(uid, id) == 1;
	}

}
