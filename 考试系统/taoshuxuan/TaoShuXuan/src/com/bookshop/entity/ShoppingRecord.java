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
 * ��Ա�����¼
 */
@SuppressWarnings("serial")
@Entity
@Table(name="tb_shopping_record")
public class ShoppingRecord implements Serializable {
	/**
	 * �����¼���
	 * UUID
	 */
	@Id
	@Column(length=40)
	private String shopping_record_id;
	/**
	 * �����Ա
	 */
	@ManyToOne(optional=false,targetEntity=Customer.class,fetch=FetchType.LAZY)
	@JoinColumn(name="customer_email",nullable=false)
	private Customer customer;
	/**
	 * �����ͼ��
	 */
	@ManyToOne(optional=false,targetEntity=Book.class,fetch=FetchType.LAZY)
	@JoinColumn(name="book_id",nullable=false)
	private Book book;
	/**
	 * �ɽ�ʱ��
	 */
	@Column(nullable=false)
	private Date record_date;
	/**
	 * ���鶩��
	 */
	@ManyToOne(optional=false,targetEntity=Order.class,fetch=FetchType.LAZY)
	@JoinColumn(name="order_id",nullable=false)
	private Order order;
	public ShoppingRecord(){
		
	}
	public ShoppingRecord(String isnew){
		this.shopping_record_id=UUID.randomUUID().toString();
	}
	public String getShopping_record_id() {
		return shopping_record_id.toLowerCase();
	}
	public void setShopping_record_id(String shopping_record_id) {
		this.shopping_record_id = shopping_record_id;
	}
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	public Book getBook() {
		return book;
	}
	public void setBook(Book book) {
		this.book = book;
	}
	public Date getRecord_date() {
		return record_date;
	}
	public void setRecord_date(Date record_date) {
		this.record_date = record_date;
	}
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	
	
}
