package com.yuan.demo03;

import com.opensymphony.xwork2.ActionSupport;

public class ShuxingDriven extends ActionSupport{
	private UserInfo ui = new UserInfo();

	public UserInfo getUi() {
		return ui;
	}

	public void setUi(UserInfo ui) {
		this.ui = ui;
	}
	
	public String execute() throws Exception{
		System.out.println("Ãû³Æ£º"+this.ui.getUname());
		System.out.println("ÐÔ±ð£º"+this.ui.getSex());
		return null;
	}
	

}
