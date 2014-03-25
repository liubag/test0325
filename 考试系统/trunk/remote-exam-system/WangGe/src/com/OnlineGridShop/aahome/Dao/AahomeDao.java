package com.OnlineGridShop.aahome.Dao;

import java.util.List;

import org.hibernate.Session;


public interface AahomeDao {
	public void save(Object obj,Session session);
	public void update(Object obj,Session session);
	public void dele(Object obj,Session session);
	public Object find(String hql,Session session);
	public List<?> show_by_page_all(List<?> l,int page, int perFolioAmount,Session session, String hql);
	public Long findCount_all(Session session, String hql);
}
