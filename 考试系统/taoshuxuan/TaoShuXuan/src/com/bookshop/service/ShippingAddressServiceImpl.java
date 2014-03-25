package com.bookshop.service;

import javax.annotation.Resource;

import org.hibernate.Session;


import com.bookshop.dao.ShippingAddressDao;
import com.bookshop.entity.ShippingAddress;
import com.bookshop.util.MyServiceParent;
/**
 * 收货地址Service层实现类
 * @author Winds
 *
 */
public class ShippingAddressServiceImpl extends MyServiceParent implements
		ShippingAddressService {
	@Resource
	private ShippingAddressDao shippingAddressDao;
	private Session session ;
	private String hql;
	public ShippingAddress getShippingAddressByEmail(String customer_email) {
		this.session = getSession();
		hql = "from ShippingAddress as s where s.customer.email = '"+customer_email + "'";
		return (ShippingAddress)shippingAddressDao.find(hql, session);
	}

	public boolean updateShippingAddress(ShippingAddress shippingAddress) {
		try{
			this.session = getSession();
			hql = "from ShippingAddress as s where s.shipping_address_id = '" +shippingAddress.getShipping_address_id() +  "'";
			ShippingAddress s = (ShippingAddress)shippingAddressDao.find(hql,session);
			if(s !=null){
				s.setConsignee(shippingAddress.getConsignee());
				s.setShipping_country(shippingAddress.getShipping_country());
				s.setShipping_province(shippingAddress.getShipping_province());
				s.setShipping_county(shippingAddress.getShipping_county());
				s.setStreet_address(shippingAddress.getStreet_address());
				s.setPostcode(shippingAddress.getPostcode());
				s.setMobile_phone(shippingAddress.getMobile_phone());
				s.setFixed_phone(shippingAddress.getFixed_phone());
				shippingAddressDao.update(s, session);
				return true;
			}else
			return false;
		}catch(Exception e){
			e.printStackTrace();
			return false ;
		}
	}
	public ShippingAddress find(String shipping_address_id){
		this.session = getSession();
		hql = "from ShippingAddress as s where s.shipping_address_id = '"+shipping_address_id + "'";
		return (ShippingAddress)shippingAddressDao.find(hql, session);
	}
	
}
