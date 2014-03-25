package com.drag.util;

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
}
