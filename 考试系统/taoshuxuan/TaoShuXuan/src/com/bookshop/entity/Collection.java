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
 * ��Ա�ղ�
 */
@SuppressWarnings("serial")
@Entity
@Table(name="tb_collection")
public class Collection implements Serializable {
	/**
	 * �ղر��
	 * UUID
	 */
	@Id
	@Column(length=40)
	private String collection_id;
	/**
	 * �ղ�����
	 */
	@Column(nullable=false)
	private Date collection_date;
	/**
	 * �ղػ�Ա
	 */
	@ManyToOne(optional=false,targetEntity=Customer.class,fetch=FetchType.LAZY)
	@JoinColumn(name="customer_email",nullable=false)
	private Customer customer;
	/**
	 * �ղ�ͼ��
	 */
	@ManyToOne(optional=false,targetEntity=Book.class,fetch=FetchType.LAZY)
	@JoinColumn(name="book_id",nullable=false)
	private Book book;
	/**
	 * ͼ���ղ�ʱ�ļ۸�
	 */
	private float collection_price;
	
	public Collection(){
		
	}
	public Collection(String isnew){
		this.collection_id=UUID.randomUUID().toString();
	}
	public String getCollection_id() {
		return collection_id.toLowerCase();
	}
	public void setCollection_id(String collection_id) {
		this.collection_id = collection_id;
	}
	public Date getCollection_date() {
		return collection_date;
	}
	public void setCollection_date(Date collection_date) {
		this.collection_date = collection_date;
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
	public float getCollection_price() {
		return collection_price;
	}
	public void setCollection_price(float collection_price) {
		this.collection_price = collection_price;
	}
	
	
}
