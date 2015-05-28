package com.community.domain;

import java.io.Serializable;
import java.sql.Timestamp;

public class ResourceDownload implements Serializable {
	private static final long serialVersionUID = 1L;
	private long id;
	private long uid;
	private long rid;
	private Timestamp createAt;

	private Resource resource;

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

	public long getRid() {
		return rid;
	}

	public void setRid(long rid) {
		this.rid = rid;
	}

	public Timestamp getCreateAt() {
		return createAt;
	}

	public void setCreateAt(Timestamp createAt) {
		this.createAt = createAt;
	}

	public Resource getResource() {
		return resource;
	}

	public void setResource(Resource resource) {
		this.resource = resource;
	}

}
