package com.bookshop.dao;

import java.util.List;

import org.hibernate.Session;
/**
 * 会员退货申请信息Dao层接口
 * @author Winds
 *
 */
public interface RejectedApplyDao {
	/**
	 * 删除退货申请信息
	 * @param obj
	 * @param session
	 */
	public void dele(Object obj,Session session);
	/**
	 * 新增退货申请信息
	 * @param obj
	 * @param session
	 */
	public void save(Object obj,Session session);
	/**
	 * 更新退货申请信息
	 * @param obj
	 * @param session
	 */
	public void update(Object obj,Session session);
	/**
	 * 通过Hql查询语句查询单个退货申请信息
	 * @param hql
	 * @param session
	 * @return
	 */
	public Object find(String hql,Session session);
	/**
	 * 通过Hql查询语句查询多个退货申请信息
	 * @param hql
	 * @param session
	 * @return
	 */
	public List<?> findAll(String hql,Session session);
}
