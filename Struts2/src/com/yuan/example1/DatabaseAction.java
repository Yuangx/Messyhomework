package com.yuan.example1;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

public class DatabaseAction extends ActionSupport implements SessionAware{
	private Map<String,Object> session = null;
	private String param;
	
	public String getParam() {
		return param;
	}
	
	public void setParam(String param) {
		this.param = param;
	}
	
	public Map<String, Object> getSession() {
		return session;
	}
	
	@Override
	public void setSession(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
		this.session = arg0;
	}
	
	private static List<String> datas = new ArrayList<String>();
	
	public String add() throws Exception{
		session.put("param",param);
		System.out.println("完成");
		datas.add(param);
		System.out.println("param:"+param);
		return null;
	}
	
	public String get() throws Exception{
		System.out.println("您获取的数据是第"+param+"位，数据的值："+datas.get(Integer.parseInt(param)));
		System.out.println("当前数据量："+datas.size());
		return null;
	}
	
	

}
