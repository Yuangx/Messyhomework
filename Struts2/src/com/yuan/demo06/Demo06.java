package com.yuan.demo06;

import com.opensymphony.xwork2.ActionSupport;

public class Demo06 extends ActionSupport{
	
	private String rs_tName;
	
	public String getRs_tName(){
		return rs_tName;
	}
	
	public void setRs_tName(String rs_tName){
		this.rs_tName = rs_tName;
	}
	
	public String execute() throws Exception{
		//��Ӧresult type���ͣ�ͳһʹ��rs_type���Ͷ���
		String rs_type ="";
		if("chain".equals(rs_tName)){
			rs_type = "rs_chain";
		}else if ("redirection".equals(rs_tName)){
			rs_type = "rs_redirect";
		}else if ("redirectAction".equals(rs_tName)){
			rs_type = "rs_redirectAction";
		}else if("plainText".equals(rs_tName)){
			rs_type = "rs_plainText";
		}
		return rs_type;
	}
	//ҵ����
	public String chain() throws Exception{
		//ҵ��������ʡ��
		
		return "demo2_result";
	}
	
	//ҵ��2
	public String reAction() throws Exception{
		//ҵ��������ʡ��
		return "input";
	}
}
