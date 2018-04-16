package com.yuan.perimeter;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;


//����modelDrivenn ģ������
public class EntityAction extends ActionSupport implements ModelDriven<Entity>{
	private Entity entity = new Entity();

	public Entity getEntity() {
		return entity;
	}

	public void setEntity(Entity entity) {
		this.entity = entity;
	}
	
	
	//��struts2 �Ĳ���  ����
	public String execute() throws Exception{
		//System.out.println("chang:"+this.entity.getChang());
		//System.out.println("kuan:"+this.entity.getKuan());
		int perimeter = this.entity.getChang()+this.entity.getKuan();
		perimeter *= 2;
		System.out.println("�ܳ���"+perimeter);
		return null;
	}

	@Override
	public Entity getModel() {
		// TODO Auto-generated method stub
		return this.entity;
	}


}
