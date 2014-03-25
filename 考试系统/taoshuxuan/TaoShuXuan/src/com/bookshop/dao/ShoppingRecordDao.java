package com.bookshop.dao;

import java.util.List;

import org.hibernate.Session;
/**
 * ��Ա�����¼��ϢDao��ӿ�
 * @author Winds
 *
 */
public interface ShoppingRecordDao {
	/**
	 * ɾ����Ա�����¼��Ϣ
	 * @param obj
	 * @param session
	 */
	public void dele(Object obj,Session session);
	/**
	 * ������Ա�����¼��Ϣ
	 * @param obj
	 * @param session
	 */
	public void save(Object obj,Session session);
	/**
	 * ���»�Ա�����¼��Ϣ
	 * @param obj
	 * @param session
	 */
	public void update(Object obj,Session session);
	/**
	 * ͨ��Hql��ѯ����ѯ������Ա�����¼��Ϣ
	 * @param hql
	 * @param session
	 * @return
	 */
	public Object find(String hql,Session session);
	/**
	 * ͨ��Hql��ѯ����ѯ�����Ա�����¼��Ϣ
	 * @param hql
	 * @param session
	 * @return
	 */
	public List<?> findAll(String hql,Session session);
	/**
	 * ͨ��HQL��ѯ����ѯ���������������������
	 * @param hql
	 * @param session
	 * @param maxLength
	 * @return
	 */
	public List<?> findHotAuthorBooks(String hql,Session session,int maxLength);
}
