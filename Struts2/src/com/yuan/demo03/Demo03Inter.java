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
		//ִ��Action�е�ҵ�񷽷�
		String result = arg0.invoke();
		System.out.println("��demo03��ʼִ�У�");
		//��ҵ�񷽷�ִ��֮�����������к�ȥsession����
		Map<String,Object> session = arg0.getInvocationContext().getSession();
		//ȡsession����
		UserInfo ui = (UserInfo) session.get("data");
		System.out.println("���" + ui.getUname());
		return result;
	}
}