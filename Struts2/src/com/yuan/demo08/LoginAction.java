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
		//��ȡ�����ֵ,�жϲ�����session
				if ( "logined".contentEquals(isLogin) ){
					ActionContext.getContext().getSession().put("isLogin", "logined");
				    //����session��תdemo08��ʹ��������
				    return "demo08";
				}
				else {
					//����ص�login.jspҳ��
					return "input";
				}
				
	}

}
