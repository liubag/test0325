package com.bookshop.service;

import java.util.List;

import com.bookshop.entity.Collection;

/**
 * 收藏信息Service层接口
 * @author Winds
 *
 */
public interface CollectionService {
	/**
	 * 查找收藏最多的图书
	 */
	public List<Object> getHotCollection();
	/**
	 * 删除会员图书收藏记录
	 * @param collection_id 收藏记录Id
	 * @return boolean
	 */
	public boolean delete(String collection_id);
	/**
	 * 批量删除会员图书收藏记录
	 * @param collectionIdStr 收藏记录Id串
	 * @return
	 */
	public boolean deleteBatch(String collectionIdStr);
	/**
	 * 分页数据中的各图书的收藏数
	 * @param collection_l
	 * @return
	 */
	public List<Long> findColletionNum(List<Collection> collection_l);
	
	/**
	 * 添加收藏
	 * @return
	 */
	public int addToCollection(String book_id,String customer_email);
	/**
	 * 分页功能
	 * @param entityName 实体类名
	 * @param paramName  实体的查询条件名
	 * @param value    对应的条件值
	 * @param isLike   是否要模糊查询
	 * @return
	 */
	public Long hasNumbers(String entityName,String[] paramName,String[]value,boolean isLike);
	public List<?> show_by_page(int page,int perFolioAmount,String entityName,String[] paramName,String[]value,boolean isLike);
}
