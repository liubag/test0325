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
 * 评论
 */
@SuppressWarnings("serial")
@Entity
@Table(name="tb_comment")
public class Comment implements Serializable {
	/**
	 * 评论编号
	 * UUID
	 */
	@Id
	@Column(length=40)
	private String comment_id;
	/**
	 * 评论会员
	 */
	@ManyToOne(optional=false,targetEntity=Customer.class,fetch=FetchType.LAZY)
	@JoinColumn(name="customer_email",nullable=false)
	private Customer customer;
	/**
	 * 评论图书
	 */
	@ManyToOne(optional=false,targetEntity=Book.class,fetch=FetchType.LAZY)
	@JoinColumn(name="book_id",nullable=false)
	private Book book;
	/**
	 * 评论日期
	 */
	@Column(nullable=false)
	private Date comment_date;
	/**
	 * 评论标题
	 */
	@Column(length=60,nullable=false)
	private String title;
	/**
	 * 评论内容
	 */
	@Column(length=1000,nullable=false)
	private String content;
	/**
	 * 对图书的评分
	 * 最小为1，最大为5的正整数
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
