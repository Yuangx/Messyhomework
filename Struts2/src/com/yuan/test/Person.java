package com.yuan.test;

import com.opensymphony.xwork2.ActionSupport;

public class Person extends ActionSupport{
	private String name;
	private String beizhu;
	private String sex;
	private String[] hobby;
	private String paraml;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBeizhu() {
		return beizhu;
	}
	public void setBeizhu(String beizhu) {
		this.beizhu = beizhu;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String[] getHobby() {
		return hobby;
	}
	public void setHobby(String[] hobby) {
		this.hobby = hobby;
	}
	public String getParaml() {
		return paraml;
	}
	public void setParaml(String paraml) {
		this.paraml = paraml;
	}
	
	public String execute() throws Exception{
		if ("0".equals(sex)){
			sex = "Ů";
		}
		if ("1".equals(sex)){
			sex = "��";
		}
		for (int i = 0;i<hobby.length;i++){
			switch (hobby[i].charAt(0)){
			case '0':
				hobby[i] = "����";
				break;
			case '1':
				hobby[i] = "����";
				break;
			case '2':
				hobby[i] = "��ë��";
				break;
			default:break;
			}
		}
		String ah = "";
		for (String s:hobby){
			ah += "," + s;
		}
		System.out.println("������"+name+"����ע��"+beizhu+"���Ա�"+sex+"�����ã�"+ah.substring(1)+"�������ļ�ע�룺"+paraml);
		return "show";
	}

}
