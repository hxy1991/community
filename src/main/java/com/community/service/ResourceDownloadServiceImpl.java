package com.community.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.community.dao.ResourceDownloadDao;
import com.community.domain.ResourceDownload;

@Service
public class ResourceDownloadServiceImpl implements ResourceDownloadService {

	@Autowired
	private ResourceDownloadDao resourceDownloadDao;
	@Autowired
	private ResourceService resourceService;

	@Override
	public int getUserResourceDownloadCount(long uid) {
		return resourceDownloadDao.getUserResourceDownloadCount(uid);
	}

	@Override
	public List<ResourceDownload> getResourceDownloads(long myUid, long from,
			int pageSize) {
		List<ResourceDownload> list = resourceDownloadDao.getResourceDownloads(
				myUid, from, pageSize);
		fillDownloadResource(myUid, list);
		return list;
	}

	private void fillDownloadResource(long myUid, List<ResourceDownload> list) {
		for (ResourceDownload resourceDownload : list) {
			fillDownloadResource(myUid, resourceDownload);
		}
	}

	private void fillDownloadResource(long myUid,
			ResourceDownload resourceDownload) {
		long rid = resourceDownload.getRid();
		resourceDownload.setResource(resourceService
				.getResourceById(myUid, rid));
	}

	@Override
	public int getResourceDownloadCount(long rid) {
		return resourceDownloadDao.getResourceDownloadCount(rid);
	}

	@Override
	public void insertResourceDownload(ResourceDownload resourceDownload) {
		resourceDownloadDao.insertResourceDownload(resourceDownload);
	}

	@Override
	public boolean deleteResourceDownload(Long uid, Long rdid) {
		return resourceDownloadDao.deleteResourceDownload(uid, rdid) == 1;
	}

}
