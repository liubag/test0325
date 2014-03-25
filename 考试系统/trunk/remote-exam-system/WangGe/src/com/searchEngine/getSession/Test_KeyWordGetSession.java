package com.searchEngine.getSession;

import javax.annotation.Resource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class Test_KeyWordGetSession implements KeyWordGetSession {
	@Resource
	private SessionFactory sessionFactory;
	
	public Session getSession() {
		// TODO Auto-generated method stub
		return sessionFactory.getCurrentSession();
	}

}
