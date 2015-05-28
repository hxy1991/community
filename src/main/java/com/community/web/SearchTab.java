package com.community.web;
public enum SearchTab {
	POST("帖子", "searchedPost"), GROUP("社群", "searchedGroup"), USER("用户",
			"searchedUser");
	private String cName;
	private String eName;

	SearchTab(String cName, String eName) {
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