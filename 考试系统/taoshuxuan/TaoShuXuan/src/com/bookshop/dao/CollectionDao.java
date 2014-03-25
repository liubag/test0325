package com.bookshop.dao;

import java.util.List;

import org.hibernate.Session;
/**
 * �ղ���ϢDao��ӿ�
 * @author Winds
 *
 */
public interface CollectionDao {
	/**
	 * ɾ���ղ���Ϣ
	 * @param obj
	 * @param session
	 */
	public void dele(Object obj,Session session);
	/**
	 * �����ղ���Ϣ
	 * @param obj
	 * @param session
	 */
	public void save(Object obj,Session session);
	/**
	 * �����ղ���Ϣ
	 * @param obj
	 * @param session
	 */
	public void update(Object obj,Session session);
	/**
	 * ͨ��Hql��ѯ����ѯ�����ղ���Ϣ
	 * @param hql
	 * @param session
	 * @return
	 */
	public Object find(String hql,Session session);
	/**
	 * ͨ��Hql��ѯ����ѯ����ղ���Ϣ
	 * @param hql
	 * @param session
	 * @return
	 */
	public List<?> findAll(String hql,Session session);
	
	/**
	 * ���������ղ�
	 * @param hql
	 * @param session
	 * @param maxLength
	 * @return
	 */
	public List<?> findHotCollection(String hql,Session session,int maxLength);
}
