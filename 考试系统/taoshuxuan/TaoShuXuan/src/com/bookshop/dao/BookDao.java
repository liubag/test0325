package com.bookshop.dao;

import java.util.List;

import org.hibernate.Session;
/**
 * 图书信息Dao层接口
 * @author Winds
 *
 */
public interface BookDao {
	/**
	 * 删除图书信息
	 * @param obj
	 * @param session
	 */
	public void dele(Object obj,Session session);
	/**
	 * 新增图书信息
	 * @param obj
	 * @param session
	 */
	public void save(Object obj,Session session);
	/**
	 * 更新图书信息
	 * @param obj
	 * @param session
	 */
	public void update(Object obj,Session session);
	/**
	 * 通过Hql查询语句查询单个图书信息
	 * @param hql
	 * @param session
	 * @return
	 */
	public Object find(String hql,Session session);
	/**
	 * 通过Hql查询语句查询多个图书信息
	 * @param hql
	 * @param session
	 * @return
	 */
	public List<?> findAll(String hql,Session session);
	/**
	 * 通过Hql查询语句查询多个图书信息，限制查询个数
	 * @param hql
	 * @param session
	 * @param maxLength
	 * @return
	 */
	public List<?> findAll(String hql,Session session,int maxLength);
}
