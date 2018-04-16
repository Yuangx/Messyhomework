package com.yuan.demo08;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class Validatelogin extends AbstractInterceptor{
	
	@Override
	public String intercept(ActionInvocation arg0) throws Exception{
		//取得相关请求Action Context实例
		ActionContext ctx = arg0.getInvocationContext();
		Map session = ctx.getSession();
		//取出名为user的session属性
		String login = (String)session.get("isLogin");
		
		if (login != null && "logined".equals(login)) {
			//如果已经登陆，继续执行
			return arg0.invoke();
		}
		//没有登陆
		ctx.put("tip", "您还没有登陆，请登陆系统");
		//如果没有登陆，返回重新登陆
		return "nologin";
	}

}
