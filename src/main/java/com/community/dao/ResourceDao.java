package com.community.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.community.domain.Resource;

/**
 * 
 * @author
 * 
 */
public interface ResourceDao {

	public boolean insertResource(Resource resource);

	public int getGroupResourceCount(@Param("gid") long gid);

	/**
	 * 
	 * @param gid
	 * @param from
	 * @param pageSize
	 * @return
	 */
	public List<Resource> getGroupResources(@Param("gid") long gid,
			@Param("from") long from, @Param("pageSize") int pageSize);

	public Resource getResourceById(@Param("id") long id);

	/**
	 * 获取uid的上传的资源数
	 * 
	 * @param uid
	 * @return
	 */
	public int getUserResourceCount(@Param("uid") long uid);

	/**
	 * 删除id的资源
	 * 
	 * @param id
	 * @return
	 */
	public int deleteResource(@Param("uid") long uid, @Param("id") long id);

	/**
	 * 
	 * @param uid
	 * @param from
	 * @param pageSize
	 * @return
	 */
	public List<Resource> getResourcesByUid(@Param("uid") long uid,
			@Param("from") long from, @Param("pageSize") int pageSize);


}
