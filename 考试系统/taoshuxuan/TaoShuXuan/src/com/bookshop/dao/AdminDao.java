package com.bookshop.dao;

import java.util.List;

import org.hibernate.Session;
/**
 * ��վ����ԱDao��ӿ�
 * @author Winds
 *
 */
public interface AdminDao {
	/**
	 * ���ù���Ա
	 * @param obj
	 * @param session
	 */
	public void dele(Object obj,Session session);
	/**
	 * ��������Ա��Ϣ
	 * @param obj
	 * @param session
	 */
	public void save(Object obj,Session session);
	/**
	 * ���¹���Ա��Ϣ
	 * @param obj
	 * @param session
	 */
	public void update(Object obj,Session session);
	/**
	 * ͨ��Hql��ѯ����ѯ��������Ա��Ϣ
	 * @param hql
	 * @param session
	 * @return
	 */
	public Object find(String hql,Session session);
	/**
	 * ͨ��Hql��ѯ����ѯ�������Ա��Ϣ
	 * @param hql
	 * @param session
	 * @return
	 */
	public List<?> findAll(String hql,Session session);
}
