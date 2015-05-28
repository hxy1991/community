package com.community.web;
public enum PassportTab {
	BASCI_MESSAGE("基本信息", "basicMsg"), CHANGE_PASSWORD("修改密码",
			"passwordMsg"), CHANGE_AVATER("修改头像", "avaterMsg");
	private String cName;
	private String eName;

	PassportTab(String cName, String eName) {
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