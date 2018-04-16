package com.yuan.demo08;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class Validatelogin extends AbstractInterceptor{
	
	@Override
	public String intercept(ActionInvocation arg0) throws Exception{
		//ȡ���������Action Contextʵ��
		ActionContext ctx = arg0.getInvocationContext();
		Map session = ctx.getSession();
		//ȡ����Ϊuser��session����
		String login = (String)session.get("isLogin");
		
		if (login != null && "logined".equals(login)) {
			//����Ѿ���½������ִ��
			return arg0.invoke();
		}
		//û�е�½
		ctx.put("tip", "����û�е�½�����½ϵͳ");
		//���û�е�½���������µ�½
		return "nologin";
	}

}
