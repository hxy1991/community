package com.community.domain;

import java.io.Serializable;

public class UserPostView implements Serializable {
	private static final long serialVersionUID = 1L;
	private long id;
	private long uid;
	private long pid;

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
}
