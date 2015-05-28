package com.community.web;
public enum HomeTab {
	FRIEND_POSTS("好友动态", "friendPosts"), FOLLOWED_GROUP_POSTS("社群动态",
			"followedGroupPosts"), MY_POSTS("我的帖子", "myPosts");
	private String cName;
	private String eName;

	HomeTab(String cName, String eName) {
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