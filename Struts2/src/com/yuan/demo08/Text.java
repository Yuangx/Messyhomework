package com.yuan.demo08;

import com.opensymphony.xwork2.ActionSupport;;

public class Text extends ActionSupport {
	
	private String name;
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name =name;
	}
	
	public String execute() {
		System.out.println("Loading......");
		return "success";
	}

}
