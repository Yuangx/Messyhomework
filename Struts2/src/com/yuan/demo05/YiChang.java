package com.yuan.demo05;

import com.opensymphony.xwork2.ActionSupport;

public class YiChang extends ActionSupport {
	
	private String shuzi;
	
	public String getShuzi() {
		return shuzi;
	}
	
	public void setShuzi(String shuzi) {
		this.shuzi = shuzi;
	}
	
	public String yiChangChuLi() throws Exception{
		Integer.parseInt(shuzi);//ǿ��ת�� ������ܻ�����쳣
		
		return null;
	}
}