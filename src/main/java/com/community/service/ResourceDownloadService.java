package com.community.service;

import java.util.List;

import com.community.domain.ResourceDownload;

public interface ResourceDownloadService {
	/**
	 * 用户下载资源的个数
	 * 
	 * @param uid
	 * @return
	 */
	public int getUserResourceDownloadCount(long uid);

	public List<ResourceDownload> getResourceDownloads(long uid, long from,
			int pageSize);

	/**
	 * 该资源被下载的次数
	 * 
	 * @param rid
	 */
	public int getResourceDownloadCount(long rid);

	public void insertResourceDownload(ResourceDownload resourceDownload);

	public boolean deleteResourceDownload(Long uid, Long rdid);

}
