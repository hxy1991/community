package com.community.service;

import java.util.List;

import com.community.domain.Group;
import com.community.domain.Post;

public interface PostService {

	int getGroupPostCount(long gid);

	List<Post> getGroupPosts(long myUid, Group group, long from, int pageSize,
			String order);

	int getUserPostCount(long uid);

	List<Post> getPostsByUid(long myUid, long uid, long from, int pageSize);

	int getFollowerGroupPostCount(long uid);

	List<Post> getFollowerGroupPost(long myUid, long uid, long from, int pageSize);

	int getFriendPostCount(long uid);

	List<Post> getFriendPosts(long myUid, long uid, long from, int pageSize);

	Post getPostById(long myUid, long pid);

	void insertPost(Post post);

	void addViewCount(Post post);

	int searchPostCount(String word);

	List<Post> searchPost(long myUid, String word, long from, int pageSize);

	boolean deletePost(long uid, long pid);


}
