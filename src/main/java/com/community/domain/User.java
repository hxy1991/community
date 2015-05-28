package com.community.domain;

import java.io.Serializable;
import java.sql.Timestamp;

public class User implements Serializable {
	private static final long serialVersionUID = 2866441053387084227L;
	public static final User NULL = new User();

	private long id; // 用户id
	private String email; // 账号（邮箱）
	private String password; // 密码
	private String nickname; // 昵称
	private int sex;// 性别 ：0女，1男
	private String description;// 用户的简介
	private Timestamp registered; // 注册时间
	private int status; // 状态，0：离线，1：在线
	private String avaterURI;
	private int enabled;
	private Timestamp lastLoginTime; //
	private Timestamp loginTime; //

	private int friendCount;// 关注数
	private int followerCount;// 粉丝数
	private int postCount;// 发帖子数
	private int groupCount;// 关注的社群数
	private int resourceCount;// 资源数
	private boolean isMyFriend;// 是否当前登录用户所关注的
	private boolean isMyFollower;// 是否当前登录用的粉丝

	public enum UserStatus {
		OFF_LINE(0), ON_LINE(1);
		private int statusCode;

		UserStatus(int statusCode) {
			this.statusCode = statusCode;
		}

		public int getStatusCode() {
			return statusCode;
		}
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public Timestamp getRegistered() {
		return registered;
	}

	public void setRegistered(Timestamp registered) {
		this.registered = registered;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getFriendCount() {
		return friendCount;
	}

	public void setFriendCount(int friendCount) {
		this.friendCount = friendCount;
	}

	public int getFollowerCount() {
		return followerCount;
	}

	public void setFollowerCount(int followerCount) {
		this.followerCount = followerCount;
	}

	public int getPostCount() {
		return postCount;
	}

	public void setPostCount(int postCount) {
		this.postCount = postCount;
	}

	public int getGroupCount() {
		return groupCount;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getSex() {
		return sex;
	}

	public void setSex(int sex) {
		this.sex = sex;
	}

	public boolean isMyFriend() {
		return isMyFriend;
	}

	public void setMyFriend(boolean isMyFriend) {
		this.isMyFriend = isMyFriend;
	}

	public boolean isMyFollower() {
		return isMyFollower;
	}

	public void setMyFollower(boolean isMyFollower) {
		this.isMyFollower = isMyFollower;
	}

	public String getAvaterURI() {
		return avaterURI;
	}

	public void setAvaterURI(String avaterURI) {
		this.avaterURI = avaterURI;
	}

	public int getResourceCount() {
		return resourceCount;
	}

	public void setResourceCount(int resourceCount) {
		this.resourceCount = resourceCount;
	}

	public void setGroupCount(int groupCount) {
		this.groupCount = groupCount;
	}

	public int getEnabled() {
		return enabled;
	}

	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}

	public Timestamp getLastLoginTime() {
		return lastLoginTime;
	}

	public void setLastLoginTime(Timestamp lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}

	public Timestamp getLoginTime() {
		return loginTime;
	}

	public void setLoginTime(Timestamp loginTime) {
		this.loginTime = loginTime;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", email=" + email + ", password=" + password
				+ ", nickname=" + nickname + ", registered=" + registered
				+ ", status=" + status + ", friendCount=" + friendCount
				+ ", followerCount=" + followerCount + ", postCount="
				+ postCount + ", groupCount=" + groupCount + ", description="
				+ description + ", sex=" + sex + ", isMyFriend=" + isMyFriend
				+ ", isMyFollower=" + isMyFollower + ", avaterURI=" + avaterURI
				+ ", resourceCount=" + resourceCount + ", enabled=" + enabled
				+ ", lastLoginTime=" + lastLoginTime + ", loginTime="
				+ loginTime + "]";
	}
}
