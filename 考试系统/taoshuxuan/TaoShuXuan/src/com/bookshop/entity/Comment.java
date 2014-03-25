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
 * ����
 */
@SuppressWarnings("serial")
@Entity
@Table(name="tb_comment")
public class Comment implements Serializable {
	/**
	 * ���۱��
	 * UUID
	 */
	@Id
	@Column(length=40)
	private String comment_id;
	/**
	 * ���ۻ�Ա
	 */
	@ManyToOne(optional=false,targetEntity=Customer.class,fetch=FetchType.LAZY)
	@JoinColumn(name="customer_email",nullable=false)
	private Customer customer;
	/**
	 * ����ͼ��
	 */
	@ManyToOne(optional=false,targetEntity=Book.class,fetch=FetchType.LAZY)
	@JoinColumn(name="book_id",nullable=false)
	private Book book;
	/**
	 * ��������
	 */
	@Column(nullable=false)
	private Date comment_date;
	/**
	 * ���۱���
	 */
	@Column(length=60,nullable=false)
	private String title;
	/**
	 * ��������
	 */
	@Column(length=1000,nullable=false)
	private String content;
	/**
	 * ��ͼ�������
	 * ��СΪ1�����Ϊ5��������
	 */
	@Column(nullable=false)
	private Integer score;
	
	public Comment(){
		
	}
	public Comment(String isnew){
		this.comment_id=UUID.randomUUID().toString();
	}
	public String getComment_id() {
		return comment_id.toLowerCase();
	}
	public void setComment_id(String comment_id) {
		this.comment_id = comment_id;
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
	public Date getComment_date() {
		return comment_date;
	}
	public void setComment_date(Date comment_date) {
		this.comment_date = comment_date;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Integer getScore() {
		return score;
	}
	public void setScore(Integer score) {
		this.score = score;
	}
	
	
	
	
}
