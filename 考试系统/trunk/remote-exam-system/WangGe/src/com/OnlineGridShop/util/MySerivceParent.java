package com.OnlineGridShop.util;

import javax.annotation.Resource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.transaction.annotation.Transactional;
@Transactional
public class MySerivceParent {
	@Resource
	private SessionFactory sessionFactory;
	public Session session;
	
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
}
