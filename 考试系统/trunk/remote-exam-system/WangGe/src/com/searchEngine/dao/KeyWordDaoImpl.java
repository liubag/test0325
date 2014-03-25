package com.searchEngine.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.searchEngine.entity.KeyWord;
import com.searchEngine.util.MyDaoParent;

public class KeyWordDaoImpl extends MyDaoParent implements KeyWordDao {
	@SuppressWarnings("unchecked")
	public List<KeyWord> findKeyWord_By_Rate(String hql,Session session){
		Query q = session.createQuery(hql);
		List<KeyWord> l = null;
		if(q.list().size() > 0){
			q.setFirstResult(0);
			q.setMaxResults(10);
			l = (List<KeyWord>)q.list();
		}
		return l;
	}
}
