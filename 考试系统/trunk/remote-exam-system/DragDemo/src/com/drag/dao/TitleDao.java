package com.drag.dao;

import org.hibernate.Session;


public interface TitleDao {
	public Object find(String hql,Session session);
	public void save(Object obj,Session session);
	public void dele(Object obj,Session session);
}
