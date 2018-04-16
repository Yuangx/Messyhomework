package com.yuan.demo10;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import org.apache.commons.io.FileUtils;
//import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class FileUpload extends ActionSupport{
	//如果是多文件上传，将下面属性，设置成数组即可
	//得到上传文件
	private File fileUp;
	//得到文件的类型
	private String fileUpContentType;
	//得到文件的名称
	private String fileUpFileName;
	
	public File getFileUp() {
		return fileUp;
	}
	public void setFileUp(File fileUp) {
		this.fileUp = fileUp;
	}
	public String getFileUpContentType() {
		return fileUpContentType;
	}
	public void setFileUpContentType(String fileUpContentType) {
		this.fileUpContentType = fileUpContentType;
	}
	public String getFileUpFileName() {
		return fileUpFileName;
	}
	public void setFileUpFileName(String fileUpFileName) {
		this.fileUpFileName = fileUpFileName;
	}
	
	//单文件上传
	public String upload() throws Exception {
		//找到项目的根路径，然后建一个files文件
		//String realpath = ServeletActionContext.getServletContext.getRealPath("D：//files");
		File file = new File("D://files");
		//判断路径是否可用
		if(!file.exists())
			//如果不存，新建这个目录
			file.mkdirs();
		//使用工具类复制文件
		FileUtils.copyFile(fileUp, new File(file,fileUpFileName));
		return "success";
	}
	
	//复制文件的传统IO方式
	//输入流获取字节数
	byte[] b = null;
	InputStream filein = null;
	try{
		filein = new FileInputStream(fileUp);
		b = new byte[filein.available()];
		filein.read(b);
		filein.close();
	}catch (Exception e1){
		e1.printStackTrace();
	}
	
	//输出流输出字节
	try {
		OutputStream fileos = new FileOutputStream(new File(file,fileUpFileName));
		fileos.write(b);
		fileos.close();
	}catch (Exception e){
		e1.printStackTrace();
	}
	
	
	return null;
	}
}






























