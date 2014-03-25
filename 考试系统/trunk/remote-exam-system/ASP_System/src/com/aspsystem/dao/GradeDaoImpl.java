package com.aspsystem.dao;

import org.hibernate.Query;
import org.hibernate.Session;

import com.aspsystem.util.MyDaoParent;

public class GradeDaoImpl extends MyDaoParent implements GradeDao {

	public Float getTheAvgGrade(Session session, String hql) {
		// TODO Auto-generated method stub
		Query q = session.createQuery(hql);
		Float avg = Float.parseFloat(q.list().get(0).toString());
		return avg;
	}



}
