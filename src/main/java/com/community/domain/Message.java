package com.community.domain;

import java.io.Serializable;
import java.sql.Timestamp;

//CM_message:消息
public class Message implements Serializable {

	private static final long serialVersionUID = 1L;
	private long id;// 私信id
	private long sender; // 私信发布者
	private long receiver; // 私信接受者
	private String content;
	private Timestamp createAt; // 发送时间

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public long getSender() {
		return sender;
	}

	public void setSender(long sender) {
		this.sender = sender;
	}

	public long getReceiver() {
		return receiver;
	}

	public void setReceiver(long receiver) {
		this.receiver = receiver;
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

}
