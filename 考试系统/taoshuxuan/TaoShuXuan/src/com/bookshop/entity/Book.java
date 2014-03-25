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
 * 图书
 */
@SuppressWarnings("serial")
@Entity
@Table(name="tb_book")
public class Book implements Serializable {
	/**
	 * 图书编号
	 * UUID
	 */
	@Id
	@Column(length=40)
	private String book_id; 
	@Column(length=60,nullable=false)
	private String name;
	/**
	 * 图书封面图片名称
	 * book_id+.jpg
	 */
	@Column(length=100,nullable=false)
	private String book_image;
	
	/**
	 * 图书简介
	 */
	@Column(length=1000,nullable=false)
	private String content_summary;
	/**
	 * 图书ISBN编号
	 */
	@Column(length=30,nullable=false)
	private String isbn;
	/**
	 * 图书作者
	 */
	@Column(length=40,nullable=false)
	private String author;
	/**
	 * 是否是进口书
	 * 1：进口书
	 * 0：非进口书
	 */
	@Column(nullable=false)
	private Integer is_import;
	/**
	 * 是否是外语书
	 * 1：外语书
	 * 0：中文书
	 */
	@Column(nullable=false)
	private Integer is_foreign;
	/**
	 * 译者
	 */
	@Column(length=20,nullable=true)
	private String translator;
	/**
	 * 出版社
	 */
	@Column(length=40,nullable=false)
	private String publish_company;
	/**
	 * 出版时间
	 */
	@Column(nullable=false)
	private Date publish_date;
	/**
	 * 库存
	 */
	@Column(nullable=false)
	private Integer storage_num; 
	/**
	 * 入库时间
	 */
	@Column(nullable=false)
	private Date storage_date; 
	/**
	 * 图书状态
	 * 0：入库但是未上架
	 * 1：已上架
	 * 2：已下架
	 */
	@Column(nullable=false)
	private Integer status;
	/**
	 * 图书分类
	 */
	
	@ManyToOne(optional=false,targetEntity=Catagory.class,fetch=FetchType.EAGER)
	@JoinColumn(name="catagory_id",nullable=false)
	private Catagory catagory;
	/**
	 * 图书销售折扣
	 * 大于0小于1的小数
	 * 初始值为1
	 */
	@Column(nullable=false)
	private float discount;
	/**
	 * 图书销售折扣的设置时间
	 */
	@Column(nullable=false)
	private Date discount_date;
	/**
	 * 上架时间
	 */
	@Column(nullable=false)
	private Date sell_date;
	/**
	 * 图书原价
	 */
	@Column(nullable=false)
	private float price;
	
	public Book(){}
	public Book(String isnew){
		this.book_id=UUID.randomUUID().toString();
	}
	public String getBook_id() {
		return book_id.toLowerCase();
	}
	public void setBook_id(String book_id) {
		this.book_id = book_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBook_image() {
		return book_image;
	}
	public void setBook_image(String book_image) {
		this.book_image = book_image;
	}
	public String getContent_summary() {
		return content_summary;
	}
	public void setContent_summary(String content_summary) {
		this.content_summary = content_summary;
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public Integer getIs_import() {
		return is_import;
	}
	public void setIs_import(Integer is_import) {
		this.is_import = is_import;
	}
	public Integer getIs_foreign() {
		return is_foreign;
	}
	public void setIs_foreign(Integer is_foreign) {
		this.is_foreign = is_foreign;
	}
	public String getTranslator() {
		return translator;
	}
	public void setTranslator(String translator) {
		this.translator = translator;
	}
	public String getPublish_company() {
		return publish_company;
	}
	public void setPublish_company(String publish_company) {
		this.publish_company = publish_company;
	}
	public Date getPublish_date() {
		return publish_date;
	}
	public void setPublish_date(Date publish_date) {
		this.publish_date = publish_date;
	}
	public Integer getStorage_num() {
		return storage_num;
	}
	public void setStorage_num(Integer storage_num) {
		this.storage_num = storage_num;
	}
	public Date getStorage_date() {
		return storage_date;
	}
	public void setStorage_date(Date storage_date) {
		this.storage_date = storage_date;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Catagory getCatagory() {
		return catagory;
	}
	public void setCatagory(Catagory catagory) {
		this.catagory = catagory;
	}
	public float getDiscount() {
		return discount;
	}
	public void setDiscount(float discount) {
		this.discount = discount;
	}
	public Date getSell_date() {
		return sell_date;
	}
	public void setSell_date(Date sell_date) {
		this.sell_date = sell_date;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public void setDiscount_date(Date discount_date) {
		this.discount_date = discount_date;
	}
	public Date getDiscount_date() {
		return discount_date;
	}
	
	
}
