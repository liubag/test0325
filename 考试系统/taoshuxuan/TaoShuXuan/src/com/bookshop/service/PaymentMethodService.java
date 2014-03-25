package com.bookshop.service;

import java.util.List;

import com.bookshop.entity.PaymentMethod;

/**
 * ���ʽService��ӿ�
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
	 * ��ѯ����֧����ʽ
	 * @return
	 */
	public List<PaymentMethod> findAll();
	/**
	 * ����ID��ȡ֧����ʽ
	 * @param payment_method_id
	 * @return
	 */
	public PaymentMethod findById(int payment_method_id);
	
	public Long hasNumbers(String entityName,String[] paramName,String[]value,boolean isLike);
	public List<?> show_by_page(int page,int perFolioAmount,String entityName,String[] paramName,String[]value,boolean isLike);
}
