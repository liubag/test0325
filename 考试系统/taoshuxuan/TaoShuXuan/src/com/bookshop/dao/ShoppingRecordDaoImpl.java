package com.bookshop.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.bookshop.util.MyDaoParent;
/**
 * 会员购物记录信息Dao层实现类
 * @author Winds
 *
 */
public class ShoppingRecordDaoImpl extends MyDaoParent implements ShoppingRecordDao{

	public List<?> findHotAuthorBooks(String hql, Session session, int maxLength) {
		// TODO Auto-generated method stub
		List<?> l=null;
		Query q = session.createQuery(hql);
		if(q.list().size() > 0){
			q.setFirstResult(0);
			q.setMaxResults(maxLength);
			l=(List<?>)q.list();
		}		
		return l;
	}

}
