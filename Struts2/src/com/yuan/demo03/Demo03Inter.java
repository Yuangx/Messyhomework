package com.yuan.demo03;

import java.util.Map;


import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;

public class Demo03Inter implements Interceptor{
	
	public void destory(){
		
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void init() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public String intercept(ActionInvocation arg0) throws Exception {
		// TODO Auto-generated method stub
		//执行Action中的业务方法
		String result = arg0.invoke();
		System.out.println("从demo03开始执行！");
		//在业务方法执行之后，在拦截器中后去session对象
		Map<String,Object> session = arg0.getInvocationContext().getSession();
		//取session内容
		UserInfo ui = (UserInfo) session.get("data");
		System.out.println("你好" + ui.getUname());
		return result;
	}
}