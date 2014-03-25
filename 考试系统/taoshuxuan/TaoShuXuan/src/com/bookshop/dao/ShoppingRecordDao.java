package com.bookshop.dao;

import java.util.List;

import org.hibernate.Session;
/**
 * 会员购书记录信息Dao层接口
 * @author Winds
 *
 */
public interface ShoppingRecordDao {
	/**
	 * 删除会员购书记录信息
	 * @param obj
	 * @param session
	 */
	public void dele(Object obj,Session session);
	/**
	 * 新增会员购书记录信息
	 * @param obj
	 * @param session
	 */
	public void save(Object obj,Session session);
	/**
	 * 更新会员购书记录信息
	 * @param obj
	 * @param session
	 */
	public void update(Object obj,Session session);
	/**
	 * 通过Hql查询语句查询单个会员购书记录信息
	 * @param hql
	 * @param session
	 * @return
	 */
	public Object find(String hql,Session session);
	/**
	 * 通过Hql查询语句查询多个会员购书记录信息
	 * @param hql
	 * @param session
	 * @return
	 */
	public List<?> findAll(String hql,Session session);
	/**
	 * 通过HQL查询语句查询热门作者与其书的总销量
	 * @param hql
	 * @param session
	 * @param maxLength
	 * @return
	 */
	public List<?> findHotAuthorBooks(String hql,Session session,int maxLength);
}
