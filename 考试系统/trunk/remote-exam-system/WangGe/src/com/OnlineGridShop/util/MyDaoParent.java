package com.OnlineGridShop.util;

import org.hibernate.Session;


public class MyDaoParent {
	public void dele(Object obj,Session session){
		session.delete(obj);
	}
	public void save(Object obj,Session session){
		session.save(obj);
	}
	public void update(Object obj,Session session){
		session.update(obj);
	}
	
}
