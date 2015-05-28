package com.community.domain;

import java.io.Serializable;
import java.sql.Timestamp;

public class Comment implements Serializable {
	private static final long serialVersionUID = 1L;
	public static final Comment NULL = new Comment();
	private long id; // 评论id，主键
	private long uid;
	private long pid;
	private String content; // 评论的内容
	private Timestamp createAt; // 评论的日期

	private User reviewer; // 评论用户的id
	private Post post; // 评论的帖子id ：对于评论的Post暂时没什么用处
	private String createAtStr;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public long getUid() {
		return uid;
	}

	public void setUid(long uid) {
		this.uid = uid;
	}

	public long getPid() {
		return pid;
	}

	public void setPid(long pid) {
		this.pid = pid;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getCreateAt() {
		return createAt;
	}

	public void setCreateAt(Timestamp createAt) {
		this.createAt = createAt;
	}

	public User getReviewer() {
		return reviewer;
	}

	public void setReviewer(User reviewer) {
		this.reviewer = reviewer;
	}

	public Post getPost() {
		return post;
	}

	public void setPost(Post post) {
		this.post = post;
	}

	public String getCreateAtStr() {
		return createAtStr;
	}

	public void setCreateAtStr(String createAtStr) {
		this.createAtStr = createAtStr;
	}

}
