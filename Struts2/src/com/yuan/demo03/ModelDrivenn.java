package com.yuan.demo03;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class ModelDrivenn extends ActionSupport implements ModelDriven<UserInfo>{
	private UserInfo ui = new UserInfo();
	public UserInfo getUi(){
		return ui;
	}
	public void setUi(UserInfo ui) {
		this.ui = ui;
	}
	
	public String execute() throws Exception {
		//获取session
		Map<String, Object> session = ActionContext.getContext().getSession();
		//存入模型对象
		session.put("data",ui);
		//System.out.println("名称："+this.ui.getUname());
		//System.out.println("性别："+this.ui.getSex());
		return null;
	}
	
	@Override
	public UserInfo getModel() {
		// TODO Auto-generated method stub
		return this.ui;
	}


}
