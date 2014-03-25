package com.bookshop.service;

import com.bookshop.entity.ShippingAddress;

/**
 * �ջ���ַService��ӿ�
 * @author Winds
 *
 */
public interface ShippingAddressService {
	/**
	 * ���ݻ�Ա�˺Ż�ȡ�ջ���Ϣ
	 * @param customer_email
	 * @return
	 */
	public ShippingAddress getShippingAddressByEmail(String customer_email);
	/**
	 * �޸��ջ���Ϣ
	 * @param shipping_address_id
	 * @return
	 */
	public boolean updateShippingAddress(ShippingAddress shippingAddress) ;
	/**
	 * ����ID�����ͻ���ַ
	 * @param shipping_address_id
	 * @return
	 */
	public ShippingAddress find(String shipping_address_id);
}
