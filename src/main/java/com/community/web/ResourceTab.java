package com.community.web;

public enum ResourceTab {
	DOWOLOADED("已下载", "downloaded"), UPLOADED("已上传", "uploaded");
	private String cName;
	private String eName;

	ResourceTab(String cName, String eName) {
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
