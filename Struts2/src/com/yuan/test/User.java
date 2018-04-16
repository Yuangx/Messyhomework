package com.yuan.test;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;

public class User {
	private String username;
	private String password;
	
	public String getUsername(){
		return username;
	}
	
	public String getPassword(){
		return password;
	}
	
	public void setUsername(String username) {
		this.username = username;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String execute() throws Exception{
		System.out.println("”√ªß√˚£∫"+username+"£¨√‹¬Î£∫"+password);
		Map<String,Object> session=ActionContext.getContext().getSession();
		session.put("username",username);
		session.put("password",password);
		return "result";
	}

}
