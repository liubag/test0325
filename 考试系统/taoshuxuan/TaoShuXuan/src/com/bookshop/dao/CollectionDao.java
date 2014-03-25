package com.bookshop.dao;

import java.util.List;

import org.hibernate.Session;
/**
 * 收藏信息Dao层接口
 * @author Winds
 *
 */
public interface CollectionDao {
	/**
	 * 删除收藏信息
	 * @param obj
	 * @param session
	 */
	public void dele(Object obj,Session session);
	/**
	 * 新增收藏信息
	 * @param obj
	 * @param session
	 */
	public void save(Object obj,Session session);
	/**
	 * 更新收藏信息
	 * @param obj
	 * @param session
	 */
	public void update(Object obj,Session session);
	/**
	 * 通过Hql查询语句查询单个收藏信息
	 * @param hql
	 * @param session
	 * @return
	 */
	public Object find(String hql,Session session);
	/**
	 * 通过Hql查询语句查询多个收藏信息
	 * @param hql
	 * @param session
	 * @return
	 */
	public List<?> findAll(String hql,Session session);
	
	/**
	 * 查找热门收藏
	 * @param hql
	 * @param session
	 * @param maxLength
	 * @return
	 */
	public List<?> findHotCollection(String hql,Session session,int maxLength);
}
