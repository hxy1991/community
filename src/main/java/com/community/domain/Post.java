package com.community.domain;

import java.io.Serializable;
import java.sql.Timestamp;

//cm_post:帖子
public class Post implements Serializable {
	private static final long serialVersionUID = 1L;
	public static final Post NULL = new Post();
	private int id;// 帖子id
	private long uid;
	private long gid;
	private String title; // 帖子标题
	private String tags;
	private String content; // 帖子内容
	private int viewCount;// 帖子的阅读数
	private Timestamp createAt; // 帖子发布时间

	private Group group; // 所属的主群
	private User author; // 帖子发布者
	private User lastReviewer;// 最后一个评论者
	private int commentCount; // 帖子评论数

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public long getUid() {
		return uid;
	}

	public void setUid(long uid) {
		this.uid = uid;
	}

	public long getGid() {
		return gid;
	}

	public void setGid(long gid) {
		this.gid = gid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getTags() {
		return tags;
	}

	public void setTags(String tags) {
		this.tags = tags;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getViewCount() {
		return viewCount;
	}

	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}

	public Timestamp getCreateAt() {
		return createAt;
	}

	public void setCreateAt(Timestamp createAt) {
		this.createAt = createAt;
	}

	public Group getGroup() {
		return group;
	}

	public void setGroup(Group group) {
		this.group = group;
	}

	public User getAuthor() {
		return author;
	}

	public void setAuthor(User author) {
		this.author = author;
	}

	public User getLastReviewer() {
		return lastReviewer;
	}

	public void setLastReviewer(User lastReviewer) {
		this.lastReviewer = lastReviewer;
	}

	public int getCommentCount() {
		return commentCount;
	}

	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}

	@Override
	public String toString() {
		return "Post [id=" + id + ", uid=" + uid + ", gid=" + gid + ", title="
				+ title + ", tags=" + tags + ", content=" + content
				+ ", viewCount=" + viewCount + ", createAt=" + createAt
				+ ", group=" + group + ", author=" + author + ", lastReviewer="
				+ lastReviewer + ", commentCount=" + commentCount + "]";
	}

}
