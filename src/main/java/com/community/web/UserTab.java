package com.community.web;

public enum UserTab {
	POSTS("帖子", "myPosts"), FRIENDS("关注", "friends"), FOLLOWERS("粉丝",
			"followers"), FOLLOWED_GROUPS("社群", "followedGroups"), RESOURCE(
			"资源", "resource");
	private String cName;
	private String eName;

	UserTab(String cName, String eName) {
		this.cName = cName;
		this.eName = eName;
	}

	public String getCName() {
		return cName;
	}

	public String getEName() {
		return eName;
	}
}