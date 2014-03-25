package com.bookshop.service;

import java.util.List;

import com.bookshop.entity.PaymentMethod;

/**
 * 付款方式Service层接口
 * @author Winds
 *
 */
public interface PaymentMethodService {
	public PaymentMethod find(String name);
	public boolean findPaymentMethod_use(int id);
	public boolean add(PaymentMethod paymentMethod);
	public boolean update(PaymentMethod paymentMethod);
	public boolean delete(int id);
	/**
	 * 查询所有支付方式
	 * @return
	 */
	public List<PaymentMethod> findAll();
	/**
	 * 根据ID获取支付方式
	 * @param payment_method_id
	 * @return
	 */
	public PaymentMethod findById(int payment_method_id);
	
	public Long hasNumbers(String entityName,String[] paramName,String[]value,boolean isLike);
	public List<?> show_by_page(int page,int perFolioAmount,String entityName,String[] paramName,String[]value,boolean isLike);
}
