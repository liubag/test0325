package com.bookshop.util;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.transaction.annotation.Transactional;

@Transactional
public class MyServiceParent {
	@Resource
	private SessionFactory sessionFactory;
	@Resource
	public MyDaoParent myDaoParent;
	public Session session;
	
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	/*
	 * 
	 *查询总个数
	 */
	public Long hasNumbers(String entityName){
		this.session=this.getSession();	
		String hql;
		hql="select count(*) from "+entityName;
		return myDaoParent.findCount_all(session, hql);
	}
	
	public Long hasNumbers(String entityName,int status){
		this.session=this.getSession();	
		String hql;
		hql="select count(*) from "+entityName +" as entity where entity.status =" + status  ;		
		return myDaoParent.findCount_all(session, hql);
	}
	public Long hasNumbers(String entityName,String[] paramName,String[]value){
		this.session = getSession();
		String hql= "select count(*) from "+entityName;
		if(paramName ==null){
			return myDaoParent.findCount_all(session, hql);
		}
		if(paramName.length != value.length){
			return null;
		}
		 hql= hql+" as t where t."+paramName[0]+"='"+value[0]+"'";
		for(int i=1;i<=paramName.length-1;i++){
			hql = hql + " and t."+paramName[i]+"='"+value[i]+"'";
		}
		System.out.println(hql);
		return myDaoParent.findCount_all(session, hql);
	}
	public Long hasNumbers(String entityName,String[] paramName,String[]value,boolean isLike){
		this.session = getSession();
		String hql= "select count(*) from "+entityName;
		if(paramName ==null){
			return myDaoParent.findCount_all(session, hql);
		}
		if(paramName.length != value.length){
			return null;
		}
		if(isLike){
			hql= hql+" as t where t."+paramName[0]+" like '%"+value[0]+"%'";
		}else{
			hql= hql+" as t where t."+paramName[0]+"='"+value[0]+"'";
		}
		for(int i=1;i<=paramName.length-1;i++){
			hql = hql + " and t."+paramName[i]+"='"+value[i]+"'";
		}
		System.out.println(hql);
		return myDaoParent.findCount_all(session, hql);
	}
	
	
	/***
	 * 
	 * 查询总页数
	 */
	public int findPages(int perFolioAmount,String entityName){ 
		this.session=this.getSession();	
		int pagenum;
		String hql;
		hql="select count(*) from "+entityName;
		Long num1 = myDaoParent.findCount_all(session, hql);
		int num = num1.intValue();
		pagenum = num/perFolioAmount;
		num = num%perFolioAmount;
		if(num>0){
			pagenum++;
		}
		return pagenum;
	}

	public int findPages(int perFolioAmount,String entityName,int status){ 
		this.session=this.getSession();	
		int pagenum;
		String hql;
		hql="select count(*) from "+entityName + " as entity where entity.status =" + status;
		Long num1 = myDaoParent.findCount_all(session, hql);
		int num = num1.intValue();
		pagenum = num/perFolioAmount;
		num = num%perFolioAmount;
		if(num>0){
			pagenum++;
		}
		return pagenum;
	}
	//根据页数遍历
	public List<?> show_by_page(int page,int perFolioAmount,String entityName){
		this.session=this.getSession();	
		String hql;
		hql="from "+entityName;	
		return myDaoParent.show_by_page_all( page, perFolioAmount, session, hql);
	}  
	public List<?> show_by_page(int page,int perFolioAmount,String entityName,int status){
		this.session=this.getSession();	
		String hql;
		hql="from "+entityName+ " as entity where entity.status ='" + status+"'";	
		return myDaoParent.show_by_page_all( page, perFolioAmount, session, hql);
	}
	
	public List<?> show_by_page(int page,int perFolioAmount,String entityName,String[] paramName,String[]value,boolean isLike){
		this.session = getSession();
		String hql= "from "+entityName;
		if(paramName ==null){
			return myDaoParent.show_by_page_all( page, perFolioAmount, session, hql);
		}
		if(paramName.length != value.length){
			return null;
		}
		if(isLike){
			hql = hql+" as t where t."+paramName[0]+" like '%"+value[0]+"%'";
		}else{
			hql = hql+" as t where t."+paramName[0]+"='"+value[0]+"'";
		}
		for(int i=1;i<=paramName.length-1;i++){
			hql = hql + " and t."+paramName[i]+"='"+value[i]+"'";
		}
		return myDaoParent.show_by_page_all( page, perFolioAmount, session, hql);
	}
	/**
	 * 根据时间段搜查时的分页显示
	 */
	public Long hasNumbers(String entityName,String timeParam,String begin ,String end,String parm,String value){
		this.session = getSession();
		String hql= "select count(*) from "+entityName;
		hql = hql+" as t where t."+timeParam+" between '"+begin+"'and '"+end+"'";
		if(parm !=null &&!parm.trim().equals("")&&value!=null&&value.trim().equals(value))
			hql = hql + " and t."+parm+"='"+value+"'";
		return myDaoParent.findCount_all(session, hql);
	}
	public List<?> show_by_page(int page, int perFolioAmount,
			String entityName, String timeParam, String begin, String end,String parm,String value) {
		this.session = getSession();
		String hql= "from "+entityName;
		hql = hql+" as t where t."+timeParam+" between '"+begin+"'and '"+end+"'";	
		if(parm !=null &&!parm.trim().equals("")&&value!=null&&value.trim().equals(value))
			hql = hql + " and t."+parm+"='"+value+"'";
		System.out.println("orderServiceImpl---->"+hql);
		return myDaoParent.show_by_page_all( page, perFolioAmount, session, hql);
	}
	
}
