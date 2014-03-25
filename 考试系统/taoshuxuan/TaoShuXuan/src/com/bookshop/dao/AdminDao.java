package com.bookshop.dao;

import java.util.List;

import org.hibernate.Session;
/**
 * 网站管理员Dao层接口
 * @author Winds
 *
 */
public interface AdminDao {
	/**
	 * 禁用管理员
	 * @param obj
	 * @param session
	 */
	public void dele(Object obj,Session session);
	/**
	 * 新增管理员信息
	 * @param obj
	 * @param session
	 */
	public void save(Object obj,Session session);
	/**
	 * 更新管理员信息
	 * @param obj
	 * @param session
	 */
	public void update(Object obj,Session session);
	/**
	 * 通过Hql查询语句查询单个管理员信息
	 * @param hql
	 * @param session
	 * @return
	 */
	public Object find(String hql,Session session);
	/**
	 * 通过Hql查询语句查询多个管理员信息
	 * @param hql
	 * @param session
	 * @return
	 */
	public List<?> findAll(String hql,Session session);
}
