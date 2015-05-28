package com.community.web;
public enum GroupTab {
	POSTS("帖子", "posts"), RESOURCES("资源", "resources"), FOLLOWERS("粉丝",
			"followers");
	private String cName;
	private String eName;

	GroupTab(String cName, String eName) {
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