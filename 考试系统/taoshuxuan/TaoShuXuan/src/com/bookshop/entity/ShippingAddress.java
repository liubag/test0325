package com.bookshop.entity;

import java.io.Serializable;
import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
/**
 * 收货地址
 */
@SuppressWarnings("serial")
@Entity
@Table(name="tb_shipping_address")
public class ShippingAddress implements Serializable {
	/**
	 * 收获地址编号
	 * UUID
	 */
	@Id
	@Column(length=40)
	private String shipping_address_id;
	/**
	 * 收获地址所属会员
	 */
	@ManyToOne(optional=false,targetEntity=Customer.class,fetch=FetchType.LAZY)
	@JoinColumn(name="customer_email",nullable=false)
	private Customer customer;
	/**
	 * 收货人姓名
	 */
	@Column(length=30,nullable=false)
	private String  consignee;
	/**
	 * 收货国家
	 */
	@Column(length=20,nullable=false)
	private String shipping_country;
	/**
	 * 收货省份
	 */
	@Column(length=10,nullable=false)
	private String shipping_province;
	/**
	 * 收货城市
	 */
	@Column(length=10,nullable=false)
	private String shipping_city;
	/**
	 * 收货区县
	 */
	@Column(length=16,nullable=false)
	private String shipping_county;
	/**
	 * 收货街道地址
	 */
	@Column(length=200,nullable=false)
	private String street_address;
	/**
	 * 邮政编码
	 */
	@Column(length=10,nullable=false)
	private String postcode;
	/**
	 * 联系手机
	 */
	@Column(length=20)
	private String mobile_phone;
	/**
	 * 固定电话
	 */
	@Column(length=20)
	private String fixed_phone;
	
	public ShippingAddress(){
		
	}
	public ShippingAddress(String isnew){
		this.shipping_address_id=UUID.randomUUID().toString();
	}
	public String getShipping_address_id() {
		return shipping_address_id.toLowerCase();
	}
	public void setShipping_address_id(String shipping_address_id) {
		this.shipping_address_id = shipping_address_id;
	}
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	public String getConsignee() {
		return consignee;
	}
	public void setConsignee(String consignee) {
		this.consignee = consignee;
	}
	public String getShipping_country() {
		return shipping_country;
	}
	public void setShipping_country(String shipping_country) {
		this.shipping_country = shipping_country;
	}
	public String getShipping_province() {
		return shipping_province;
	}
	public void setShipping_province(String shipping_province) {
		this.shipping_province = shipping_province;
	}
	public String getShipping_county() {
		return shipping_county;
	}
	public void setShipping_county(String shipping_county) {
		this.shipping_county = shipping_county;
	}
	public String getStreet_address() {
		return street_address;
	}
	public void setStreet_address(String street_address) {
		this.street_address = street_address;
	}
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	public String getMobile_phone() {
		return mobile_phone;
	}
	public void setMobile_phone(String mobile_phone) {
		this.mobile_phone = mobile_phone;
	}
	public String getFixed_phone() {
		return fixed_phone;
	}
	public void setFixed_phone(String fixed_phone) {
		this.fixed_phone = fixed_phone;
	}
	public String getShipping_city() {
		return shipping_city;
	}
	public void setShipping_city(String shipping_city) {
		this.shipping_city = shipping_city;
	}
	
	
}
