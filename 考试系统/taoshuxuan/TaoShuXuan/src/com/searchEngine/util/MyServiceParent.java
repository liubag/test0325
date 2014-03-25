package com.searchEngine.util;

import javax.annotation.Resource;

import org.hibernate.Session;
import org.springframework.transaction.annotation.Transactional;

import com.searchEngine.getSession.KeyWordGetSession;

@Transactional
public class MyServiceParent {
	@Resource
	private KeyWordGetSession keyWordGetSession;
	
	public Session getSession() {
		return keyWordGetSession.getSession();
	}
}
