package com.searchEngine.dao;

import java.util.List;

import org.hibernate.Session;

import com.searchEngine.entity.KeyWord;

public interface KeyWordDao {
	public List<KeyWord> findKeyWord_By_Rate(String hql,Session session);
	public Object find(String hql,Session session);
	
	public void dele(Object obj,Session session);
	public void save(Object obj,Session session);
	
	public List<?> findAll(String hql,Session session);		
	public Long findCount_all(Session session, String hql);
	public List<?> show_by_page_all(int page,int per_folio_amount,Session session,String hql);  //根据页数遍历
}
