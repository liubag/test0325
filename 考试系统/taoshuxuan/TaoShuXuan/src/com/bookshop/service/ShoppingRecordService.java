package com.bookshop.service;

import java.util.List;

import com.bookshop.entity.Book;

/**
 * 会员购书记录信息Service层接口
 * @author Winds
 *
 */
public interface ShoppingRecordService {
	/**
	 * 获取新书热卖榜
	 * 一周内上架的书
	 * @return
	 */
	public List<Object> getHotsale_newbook();
	
	/**
	 * 获取热门作者的图书
	 * @return
	 */
	public List<Object> getHotAuthorBooks();
	
	/**
	 * 获取热门图书
	 * 销量前九
	 */
	public List<Object> getHotsale();
}
