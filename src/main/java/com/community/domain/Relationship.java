package com.community.domain;

import java.io.Serializable;
import java.sql.Timestamp;

//CM_relationship:好友关系
public class Relationship implements Serializable {
	private static final long serialVersionUID = 1L;
	private long id;
	private long follow;
	private long followed;
	private Timestamp createAt;

	public Long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public Long getFollow() {
		return follow;
	}

	public void setFollow(Long follow) {
		this.follow = follow;
	}

	public Long getFollowed() {
		return followed;
	}

	public void setFollowed(Long followed) {
		this.followed = followed;
	}

	public Timestamp getCreateAt() {
		return createAt;
	}

	public void setCreateAt(Timestamp createAt) {
		this.createAt = createAt;
	}

}
