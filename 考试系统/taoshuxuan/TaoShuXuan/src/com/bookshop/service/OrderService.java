package com.bookshop.service;

import java.util.List;

import com.bookshop.entity.Book;
import com.bookshop.entity.BookItem;
import com.bookshop.entity.Order;

public interface OrderService {

	public void audit_order(String staff_id,String order_id,int isPass);//��˶���
	public void deliver_goods(String staff_id,String order_id);//����
	public boolean delete(String orderId);//ɾ��
	//������ҳ��
	public int findPages(int perFolioAmount,String entityName); 
	public int findPages(int perFolioAmount,String entityName,int status);
	
	//��Աȷ�϶���
	public boolean commitOrder(Order order,String customer_email,int payment_method_id,String shipping_address_id,List <BookItem> bookItems);
	
	//	����ID��ȡ����
	public Order find(String order_id);
	public List<Book> findBooks(String order_id);
	public List<List<Book>> findBook_l(List<Order> order_l);
	//���������ݸ���
	 
	public Long hasNumbers(String entityName,String[] paramName,String[]value,boolean isLike);
	//����ҳ������
	public List<?> show_by_page(int page,int perFolioAmount,String entityName,String[] paramName,String[]value,boolean isLike);
	//����ʱ����Ѳ��õ�ҳ������
	public Long hasNumbers(String entityName,String timeParam,String begin ,String end,String parm,String value);
	//����ҳ������
	public List<?> show_by_page(int page,int perFolioAmount,String entityName,String timeParam,String begin ,String end,String parm,String value);
	
	
}
