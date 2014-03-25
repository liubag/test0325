	package com.bookshop.service;




import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Session;


import com.bookshop.dao.OrderDao;
import com.bookshop.entity.Book;
import com.bookshop.entity.BookItem;
import com.bookshop.entity.Customer;
import com.bookshop.entity.Order;
import com.bookshop.entity.PaymentMethod;
import com.bookshop.entity.ShippingAddress;
import com.bookshop.util.MyServiceParent;
/**
 * ������ϢService��ʵ����
 * @author Winds
 *
 */
public class OrderServiceImpl extends MyServiceParent implements OrderService {
	@Resource
	private OrderDao orderDao;
	@Resource
	private StaffHandleRecordService staffHandleRecordService;
	@Resource
	private CustomerService customerService;
	@Resource 
	private PaymentMethodService paymentMethodService;
	@Resource
	private ShippingAddressService shippingAddressService;
	private Session session ;
	private String hql;
	/*
	 * ��˶��� 
	 */
	public void audit_order(String staff_id,String order_id,int isPass) {
		this.session = getSession();
		hql = "from Order as order where order.order_id='"+order_id+"'";
		Order order = (Order)orderDao.find(hql, session);
		int before_handle_status =  order.getStatus();
		if(isPass == 1)
			order.setStatus(1);
		else if(isPass == 0)
			order.setStatus(2);
		orderDao.update(order, session);
		int after_handle_status = order.getStatus();
		staffHandleRecordService.addStaffHandleRecord(1, staff_id,order_id , before_handle_status, after_handle_status);
	}
	/*
	 * ����
	 */
	public void deliver_goods(String staff_id,String order_id){
		this.session = getSession();
		hql = "from Order as order where order.order_id='"+order_id+"'";
		Order order = (Order)orderDao.find(hql, session);
		int before_handle_status =  order.getStatus();
		order.setStatus(3);
		orderDao.update(order, session);
		int after_handle_status = order.getStatus();
		staffHandleRecordService.addStaffHandleRecord(1, staff_id,order_id , before_handle_status, after_handle_status);

	}
	public Order find(String order_id){
		this.session = getSession();
		hql = "from Order as o where o.order_id = '"+order_id+"'";
		Order order = (Order)orderDao.find(hql, session);
		return order;
	}

	public boolean commitOrder(Order order, String customer_email,
		int payment_method_id, String shipping_address_id,List <BookItem> bookItems) {
		this.session = getSession();
		try{
			Customer customer = customerService.find(customer_email);
			PaymentMethod paymentMethod= paymentMethodService.findById(payment_method_id);
			ShippingAddress shippingAddress = shippingAddressService.find(shipping_address_id);
			String book_ids="";
			for(BookItem b :bookItems){
				book_ids = book_ids +  b.getBook().getBook_id().toString()+"," ;
			}
			order.setBook_ids(book_ids);
			order.setOrder_date(new Date());
			order.setStatus(0);
			order.setCustomer(customer);
			order.setPaymentMethod(paymentMethod);
			order.setShippingAddress(shippingAddress);
			orderDao.save(order, session);
			return true;
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}

	/**
	 * ���Ҷ�����ͼ��
	 */
	public List<Book> findBooks(String order_id) {
		// TODO Auto-generated method stub
		this.session = getSession();
		List<Book> book_l = new ArrayList<Book>();
		hql = "from Order as o where o.order_id = '"+order_id+"'";
		Order order = (Order)orderDao.find(hql, session);
		String book_idString = order.getBook_ids();
		String[] book_ids = book_idString.split(",");
		for (String s : book_ids) {
			hql = "from Book as b where b.book_id = '"+s+"'";
			Book book = (Book)orderDao.find(hql, session);
			if(book!=null)
				book_l.add(book);			
		}
		return book_l;
	}
	/**
	 * ���ҷ�ҳ��ʾ��������Ҫ��ͼ��
	 */
	public List<List<Book>> findBook_l(List<Order> order_l) {
		// TODO Auto-generated method stub
		List<List<Book>> book_l_l=new ArrayList<List<Book>>();
		if(order_l!=null){
			for(Order o:order_l){
				book_l_l.add(findBooks(o.getOrder_id()));
			}
		}		
		return book_l_l;
	}
	/**
	 * ɾ������
	 */
	public boolean delete(String orderId) {
		// TODO Auto-generated method stub
		this.session = getSession();
		hql = "from Order as o where o.order_id = '"+orderId+"'";
		Order order = (Order)orderDao.find(hql, session);
		orderDao.dele(order, session);
		return true;
	}
	

}
