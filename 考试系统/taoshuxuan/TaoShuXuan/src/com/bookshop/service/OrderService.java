package com.bookshop.service;

import java.util.List;

import com.bookshop.entity.Book;
import com.bookshop.entity.BookItem;
import com.bookshop.entity.Order;

public interface OrderService {

	public void audit_order(String staff_id,String order_id,int isPass);//审核订单
	public void deliver_goods(String staff_id,String order_id);//发货
	public boolean delete(String orderId);//删除
	//返回总页数
	public int findPages(int perFolioAmount,String entityName); 
	public int findPages(int perFolioAmount,String entityName,int status);
	
	//会员确认订单
	public boolean commitOrder(Order order,String customer_email,int payment_method_id,String shipping_address_id,List <BookItem> bookItems);
	
	//	根据ID获取订单
	public Order find(String order_id);
	public List<Book> findBooks(String order_id);
	public List<List<Book>> findBook_l(List<Order> order_l);
	//返回总数据个数
	 
	public Long hasNumbers(String entityName,String[] paramName,String[]value,boolean isLike);
	//根据页数遍历
	public List<?> show_by_page(int page,int perFolioAmount,String entityName,String[] paramName,String[]value,boolean isLike);
	//根据时间段搜查用的页数遍历
	public Long hasNumbers(String entityName,String timeParam,String begin ,String end,String parm,String value);
	//根据页数遍历
	public List<?> show_by_page(int page,int perFolioAmount,String entityName,String timeParam,String begin ,String end,String parm,String value);
	
	
}
