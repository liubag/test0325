package com.OnlineGridShop.audience.Dao;

import java.util.List;

import org.hibernate.Session;

public interface AttentionDao {
	public void dele(Object obj,Session session);
	public void save(Object obj,Session session);
	public void update(Object obj,Session session);
	public Object find(String hql,Session session);
	public List<?> findAll(String hql,Session session);
}
