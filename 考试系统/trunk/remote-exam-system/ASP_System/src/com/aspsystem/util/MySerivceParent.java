package com.aspsystem.util;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.transaction.annotation.Transactional;

@Transactional
public class MySerivceParent {
	@Resource
	private SessionFactory sessionFactory;
	@Resource
	public MyDaoParent myDaoParent;
	public Session session;
	
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	/***
	 * 
	 * ��ѯ��ҳ��
	 */
	public int findPages(int perFolioAmount,String entityName){ 
		this.session=this.getSession();	
		int pagenum;
		String hql;
		if(entityName.equals("Student")){
			hql="select count(*) from Student as s where s.status=1";
		}else{
			hql="select count(*) from "+entityName;
		}
		Long num1 = myDaoParent.findCount_all(session, hql);
		int num = num1.intValue();
		pagenum = num/perFolioAmount;
		num = num%perFolioAmount;
		if(num>0){
			pagenum++;
		}
		return pagenum;
	}
	
	/***
	 * 
	 * ��ѯ���ݵ��ܸ���
	 */
	public Long hasNumbers(String entityName){
		this.session=this.getSession();	
		String hql;
		if(entityName.equals("Student")){
			hql="select count(*) from Student as s where s.status=1";
		}else{
			hql="select count(*) from "+entityName;
		}
		return myDaoParent.findCount_all(session, hql);
	}
	
	//����ҳ������
	public List<?> show_by_page(int page,int perFolioAmount,String entityName){
		this.session=this.getSession();	
		String hql;
		if(entityName.equals("Student")){
			hql="from Student as s where s.status=1";
		}else{
			hql="from "+entityName;
		}	
		return myDaoParent.show_by_page_all( page, perFolioAmount, session, hql);
	}  
}
