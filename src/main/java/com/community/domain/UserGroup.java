package com.community.domain;

import java.io.Serializable;

public class UserGroup implements Serializable {
	private static final long serialVersionUID = 1L;
	private long id;
	private long uid;
	private long gid;
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
	public long getGid() {
		return gid;
	}
	public void setGid(long gid) {
		this.gid = gid;
	}
	
}
