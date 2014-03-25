package com.bookshop.service;

import com.bookshop.entity.ShippingAddress;

/**
 * 收货地址Service层接口
 * @author Winds
 *
 */
public interface ShippingAddressService {
	/**
	 * 根据会员账号获取收货信息
	 * @param customer_email
	 * @return
	 */
	public ShippingAddress getShippingAddressByEmail(String customer_email);
	/**
	 * 修改收货信息
	 * @param shipping_address_id
	 * @return
	 */
	public boolean updateShippingAddress(ShippingAddress shippingAddress) ;
	/**
	 * 根据ID查找送货地址
	 * @param shipping_address_id
	 * @return
	 */
	public ShippingAddress find(String shipping_address_id);
}
