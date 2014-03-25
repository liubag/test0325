package com.bookshop.dao;

import java.util.List;

import org.hibernate.Session;
/**
 * ͼ����ϢDao��ӿ�
 * @author Winds
 *
 */
public interface BookDao {
	/**
	 * ɾ��ͼ����Ϣ
	 * @param obj
	 * @param session
	 */
	public void dele(Object obj,Session session);
	/**
	 * ����ͼ����Ϣ
	 * @param obj
	 * @param session
	 */
	public void save(Object obj,Session session);
	/**
	 * ����ͼ����Ϣ
	 * @param obj
	 * @param session
	 */
	public void update(Object obj,Session session);
	/**
	 * ͨ��Hql��ѯ����ѯ����ͼ����Ϣ
	 * @param hql
	 * @param session
	 * @return
	 */
	public Object find(String hql,Session session);
	/**
	 * ͨ��Hql��ѯ����ѯ���ͼ����Ϣ
	 * @param hql
	 * @param session
	 * @return
	 */
	public List<?> findAll(String hql,Session session);
	/**
	 * ͨ��Hql��ѯ����ѯ���ͼ����Ϣ�����Ʋ�ѯ����
	 * @param hql
	 * @param session
	 * @param maxLength
	 * @return
	 */
	public List<?> findAll(String hql,Session session,int maxLength);
}
