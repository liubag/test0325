package com.aspsystem.dao;

import java.util.List;

import org.hibernate.Session;

public interface GradeDao{
	public void dele(Object obj,Session session);
	public void save(Object obj,Session session);
	public void update(Object obj,Session session);
	public Object find(String hql,Session session);
	public Long findCount_all(Session session, String hql);
	public Float getTheAvgGrade(Session session,String hql);//计算平均分
	public List<?> findAll(String hql,Session session);
	public List<?> show_by_page_all(int page,int per_folio_amount,Session session,String hql);  //根据页数遍历
	
}
