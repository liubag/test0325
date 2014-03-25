package com.aspsystem.dao;

import java.util.List;

import org.hibernate.Session;

import com.aspsystem.entity.Questions;

public interface QuestionsDao{
	public void dele(Object obj,Session session);
	public void save(Object obj,Session session);
	public void update(Object obj,Session session);
	public Object find(String hql,Session session);
	public List<?> findAll(String hql,Session session);
	public List<Questions> showQuestions_by_random(int firstOne, int Amount,
			Session session, String hql); 
	public Long findCount_all(Session session, String hql);
	public List<?> show_by_page_all(int page,int per_folio_amount,Session session,String hql);  //根据页数遍历
	
}
