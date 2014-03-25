package com.bookshop.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
/**
 * 会员订单
 */
@SuppressWarnings("serial")
@Entity
@Table(name="tb_order")
public class Order implements Serializable {
	/**
	 * 订单编号
	 * UUID
	 */
	@Id
	@Column(length=40)
	private String order_id;
	/**
	 * 下单日期
	 */
	@Column(nullable=false)
	private Date order_date;
	/**
	 * 取消订单日期
	 */
	@Column(nullable=true)
	private Date cancel_date;
	/**
	 * 订单包含的图书编号
	 * 以","隔开
	 */
	@Column(length=1000,nullable=false)
	private String book_ids;
	/**
	 * 订单总金额
	 */
	@Column(nullable=false)
	private float amount;
	/**
	 * 付款方式
	 */
	@ManyToOne(optional=false,targetEntity=PaymentMethod.class,fetch=FetchType.EAGER)
	@JoinColumn(name="payment_method_id",nullable=false)
	private PaymentMethod paymentMethod;
	/**
	 * 送货地址
	 */
	@ManyToOne(optional=false,targetEntity=ShippingAddress.class,fetch=FetchType.EAGER)
	@JoinColumn(name="shipping_address_id",nullable=false)
	private ShippingAddress shippingAddress;
	/**
	 * 订单状态
	 * 0：等待审核
	 * 1：审核成功，等待发货
	 * 2：审核失败
	 * 3：已发货
	 * 4：交易成功
	 * 5：已取消
	 */
	@Column(nullable=false)
	private Integer status;
	/**
	 * 下单会员
	 */
	@ManyToOne(optional=false,targetEntity=Customer.class,fetch=FetchType.LAZY)
	@JoinColumn(name="customer_email",nullable=false)
	private Customer customer;
	
	public Order(){
		
	}
	public Order(String isnew){
		this.order_id=UUID.randomUUID().toString();
	}
	public String getOrder_id() {
		return order_id.toLowerCase();
	}
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	public Date getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}
	public Date getCancel_date() {
		return cancel_date;
	}
	public void setCancel_date(Date cancel_date) {
		this.cancel_date = cancel_date;
	}
	public String getBook_ids() {
		return book_ids;
	}
	public void setBook_ids(String book_ids) {
		this.book_ids = book_ids;
	}
	public float getAmount() {
		return amount;
	}
	public void setAmount(float amount) {
		this.amount = amount;
	}
	public PaymentMethod getPaymentMethod() {
		return paymentMethod;
	}
	public void setPaymentMethod(PaymentMethod paymentMethod) {
		this.paymentMethod = paymentMethod;
	}
	public ShippingAddress getShippingAddress() {
		return shippingAddress;
	}
	public void setShippingAddress(ShippingAddress shippingAddress) {
		this.shippingAddress = shippingAddress;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	
	
}
