package com.community.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.community.domain.Group;

/**
 * 与帖子表相关的操作
 * 
 * @author
 * 
 */
public interface GroupDao {

	public int getGoupCount();

	public int getUserGroupCount(@Param("uid") long uid);

	/**
	 * 
	 * 获取从第from之后的pageSize个社群（不包含第from个）
	 * 
	 * @param pageSize
	 * @param pageNum
	 * @return
	 */
	public List<Group> getGroups(@Param("from") long from,
			@Param("pageSize") int pageSize);

	/**
	 * 获得关注数最多的头pageSize个社群
	 * 
	 * @param pageSize
	 * @return
	 */
	public List<Group> listGroup(@Param("pageSize") int pageSize);

	/**
	 * 根据社群的id获取一个Group
	 * 
	 * @param gid
	 * @return
	 */
	public Group getGroupById(@Param("gid") long gid);

	/**
	 * 获取uid用户关注的社群
	 * 
	 * @param uid
	 * @param from
	 * @param pageSize
	 * @return
	 */
	public List<Group> getGoupsByUid(@Param("uid") long uid,
			@Param("from") long from, @Param("pageSize") int pageSize);

	public void insertGroup(Group group);

	/**
	 * 根据word搜索社群名称，返回符合条件的个数
	 * 
	 * @param word
	 * @return
	 */
	public int searchGroupCount(@Param("word") String word);

	/**
	 * 根据word搜索社群名称
	 * 
	 * @param word
	 * @param from
	 * @param pageSize
	 * @return
	 */
	public List<Group> searchGroup(@Param("word") String word,
			@Param("from") long from, @Param("pageSize") int pageSize);

	/**
	 * 帖子数最多的前topCount个社群
	 * 
	 * @return
	 */
	public List<Group> getTopPostCountGroups(@Param("topCount") int topCount);

	/**
	 * 资源数最多的前topCount个社群
	 * 
	 * @return
	 */
	public List<Group> getTopResourceCountGroups(@Param("topCount") int topCount);

	/**
	 * 粉丝数数最多的前topCount个社群
	 * 
	 * @return
	 */
	public List<Group> getTopFollowerCountGroups(@Param("topCount") int topCount);

}
