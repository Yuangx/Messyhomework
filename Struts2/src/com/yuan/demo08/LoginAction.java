package com.yuan.demo08;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport {
	private String isLogin;
	
	public String getIsLogin() {
		return isLogin;
	}
	
	public String execute (String isLogin) {
		return this.isLogin = isLogin;
	}
	
	public String execute(){
		//获取传入的值,判断并存入session
				if ( "logined".contentEquals(isLogin) ){
					ActionContext.getContext().getSession().put("isLogin", "logined");
				    //设置session跳转demo08并使用拦截器
				    return "demo08";
				}
				else {
					//否则回到login.jsp页面
					return "input";
				}
				
	}

}
