package com.yuan.demo08;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;

public class MyInterceptor implements Interceptor{
	public void destroy() {
		//TODO Auto-generated method stub
	}
	
	public void init() {
		//TODO Auto-generated method stub
	}
	
	public String intercept(ActionInvocation invocation) throws Exception {
		System.out.println("我是在action的execute方法之前执行的动作");
		String result;
		//省略操作步骤
		result = invocation.invoke();//继续执行后续部分
		System.out.println("我是在action的execute方法执行之后动作");
		System.out.println("状态值："+result);
		return result;
	}
}
