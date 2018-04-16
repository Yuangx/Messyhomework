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
			sex = "Å®";
		}
		if ("1".equals(sex)){
			sex = "ÄÐ";
		}
		for (int i = 0;i<hobby.length;i++){
			switch (hobby[i].charAt(0)){
			case '0':
				hobby[i] = "ÀºÇò";
				break;
			case '1':
				hobby[i] = "×ãÇò";
				break;
			case '2':
				hobby[i] = "ÓðÃ«Çò";
				break;
			default:break;
			}
		}
		String ah = "";
		for (String s:hobby){
			ah += "," + s;
		}
		System.out.println("ÐÕÃû£º"+name+"£¬±¸×¢£º"+beizhu+"£¬ÐÔ±ð£º"+sex+"£¬°®ºÃ£º"+ah.substring(1)+"£¬ÅäÖÃÎÄ¼þ×¢Èë£º"+paraml);
		return "show";
	}

}
