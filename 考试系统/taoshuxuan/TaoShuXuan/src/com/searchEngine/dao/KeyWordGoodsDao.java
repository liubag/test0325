package com.searchEngine.dao;

import java.util.List;

import org.hibernate.Session;


public interface KeyWordGoodsDao {
	public Object find(String hql ,Session session);
	public List<?> findAll(String hql,Session session);		
	public Long findCount_all(Session session, String hql);
	public List<?> show_by_page_all(int page,int per_folio_amount,Session session,String hql);  //����ҳ������
}
