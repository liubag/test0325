package com.bookshop.dao;

import java.util.List;

import org.hibernate.Session;
/**
 * ���ʽDao��ӿ�
 * @author Winds
 *
 */
public interface PaymentMethodDao {
	/**
	 * ɾ�����ʽ��Ϣ
	 * @param obj
	 * @param session
	 */
	public void dele(Object obj,Session session);
	/**
	 * �������ʽ��Ϣ
	 * @param obj
	 * @param session
	 */
	public void save(Object obj,Session session);
	/**
	 * ���¸��ʽ��Ϣ
	 * @param obj
	 * @param session
	 */
	public void update(Object obj,Session session);
	/**
	 * ͨ��Hql��ѯ����ѯ�������ʽ��Ϣ
	 * @param hql
	 * @param session
	 * @return
	 */
	public Object find(String hql,Session session);
	/**
	 * ͨ��Hql��ѯ����ѯ������ʽ��Ϣ
	 * @param hql
	 * @param session
	 * @return
	 */
	public List<?> findAll(String hql,Session session);
}
