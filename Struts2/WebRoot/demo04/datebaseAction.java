package stu.src.demo3;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
public class databaseAction extends ActionSupport implements SessionAware{
    
	//ʹ�ýӿ�SessionAwareע��ȫ�ֵ�Session����
	private Map<String,Object> session = null;
	private String param;//�����û�����Ĳ���
	public void setSession(Map<String, Object> arg0) {
		
		//�ڽӿ�ʵ�ַ����У�ע��session����
		this.session = arg0;
		
	}
   
	public String getParam() {
		return param;
	}

	public void setParam(String param) {
		this.param = param;
	}

	public Map<String, Object> getSession() {
		return session;
	}
	
	//����һ����̬���ϣ�����java.util.list�����
	private static List<String> datas = new ArrayList<String>();
	
	//������ҵ�������
	public String add() throws Exception{
		session.put( " param ", param);//�����ݴ���session��
		System.out.println( "Congratulations! ADD successfully!" );
		System.out.println( "session's value is: " );
		//��ӵ�����֮��
		datas.add( param );
		System.out.println( "your adding value is�� " + param );
		return null;
	}
	
    //�����û�������±�λ����ȡ�����ж�Ӧ������	
	public String get() throws Exception{
		String result=" what data you will get is :NO."+param+" ,its value is: " + datas.get(Integer.parseInt( param ));
		System.out.println( result );
		System.out.println( "Current data volume is" + datas.size());
		return null;
	}
}

