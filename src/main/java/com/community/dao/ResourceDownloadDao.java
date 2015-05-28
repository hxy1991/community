package com.community.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.community.domain.ResourceDownload;

public interface ResourceDownloadDao {

	public int getUserResourceDownloadCount(@Param("uid") long uid);

	public void insertResourceDownload(ResourceDownload resourceDownload);

	public List<ResourceDownload> getResourceDownloads(@Param("uid") long uid,
			@Param("from") long from, @Param("pageSize") int pageSize);

	public int getResourceDownloadCount(@Param("rid") long rid);

	public int deleteResourceDownload(@Param("uid")Long uid, @Param("id")Long id);

}
