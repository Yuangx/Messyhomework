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
	//����Ƕ��ļ��ϴ������������ԣ����ó����鼴��
	//�õ��ϴ��ļ�
	private File fileUp;
	//�õ��ļ�������
	private String fileUpContentType;
	//�õ��ļ�������
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
	
	//���ļ��ϴ�
	public String upload() throws Exception {
		//�ҵ���Ŀ�ĸ�·����Ȼ��һ��files�ļ�
		//String realpath = ServeletActionContext.getServletContext.getRealPath("D��//files");
		File file = new File("D://files");
		//�ж�·���Ƿ����
		if(!file.exists())
			//������棬�½����Ŀ¼
			file.mkdirs();
		//ʹ�ù����ิ���ļ�
		FileUtils.copyFile(fileUp, new File(file,fileUpFileName));
		return "success";
	}
	
	//�����ļ��Ĵ�ͳIO��ʽ
	//��������ȡ�ֽ���
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
	
	//���������ֽ�
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






























