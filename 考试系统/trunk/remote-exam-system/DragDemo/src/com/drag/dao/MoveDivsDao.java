package com.drag.dao;

import org.hibernate.Session;

public interface MoveDivsDao {
	public void save(Object obj,Session session);
	public void dele(Object obj,Session session);
	public void update(Object obj,Session session);
	public Object find(String hql ,Session session);
}
