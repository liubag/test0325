package com.bookshop.dao;

import java.util.List;

import org.hibernate.Session;
/**
 * 付款方式Dao层接口
 * @author Winds
 *
 */
public interface PaymentMethodDao {
	/**
	 * 删除付款方式信息
	 * @param obj
	 * @param session
	 */
	public void dele(Object obj,Session session);
	/**
	 * 新增付款方式信息
	 * @param obj
	 * @param session
	 */
	public void save(Object obj,Session session);
	/**
	 * 更新付款方式信息
	 * @param obj
	 * @param session
	 */
	public void update(Object obj,Session session);
	/**
	 * 通过Hql查询语句查询单个付款方式信息
	 * @param hql
	 * @param session
	 * @return
	 */
	public Object find(String hql,Session session);
	/**
	 * 通过Hql查询语句查询多个付款方式信息
	 * @param hql
	 * @param session
	 * @return
	 */
	public List<?> findAll(String hql,Session session);
}
