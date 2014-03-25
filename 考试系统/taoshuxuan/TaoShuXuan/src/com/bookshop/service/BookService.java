package com.bookshop.service;

import java.util.List;

import com.bookshop.entity.Book;

/**
 * 图书信息Service层接口
 * @author Winds
 *
 */
public interface BookService {
	public int findInventory(String book_id);
	public Book find(String book_id);
	public boolean updateStatus(String book_id,int status);
	public boolean updateDiscount(Book book);
	public boolean updateStorage_num(String book_id,int storage_num);
	public boolean update(Book book,int catagory_id);
	public boolean add(Book book,int catagory_id);
//	public Long hasNumbers(String entityName);
//	public int findPages(int perFolioAmount,String entityName);
//	public List<?> show_by_page(int page,int perFolioAmount,String entityName);
	public Long hasNumbers(String entityName,String[] paramName,String[]value,boolean isLike);
	public List<?> show_by_page(int page,int perFolioAmount,String entityName,String[] paramName,String[]value,boolean isLike);
	
}
