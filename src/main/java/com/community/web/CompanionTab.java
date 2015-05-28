package com.community.web;
public enum CompanionTab {
	FRIENDS("关注", "friends"), FOLLOWERS("粉丝", "followers");
	private String cName;
	private String eName;

	CompanionTab(String cName, String eName) {
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