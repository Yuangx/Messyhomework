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
		System.out.println("������action��execute����֮ǰִ�еĶ���");
		String result;
		//ʡ�Բ�������
		result = invocation.invoke();//����ִ�к�������
		System.out.println("������action��execute����ִ��֮����");
		System.out.println("״ֵ̬��"+result);
		return result;
	}
}
