package com.bookshop.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
/**
 * 图书分类
 */
@SuppressWarnings("serial")
@Entity
@Table(name="tb_catagory")
public class Catagory implements Serializable {
	/**
	 * 编号
	 */
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer catagory_id;
	/**
	 * 分类名称
	 */
	@Column(nullable=false)
	private String catagory_name;
	/**
	 * 分类级别
	 * 1：父类
	 * 2：子类
	 */
	@Column(nullable=false)
	private String catagory_level;
	/**
	 * 创建时间
	 */
	@Column(nullable=false)
	private Date create_date;
	
	/**
	 * 父类
	 */
	@ManyToOne(optional=true,targetEntity=Catagory.class,fetch=FetchType.EAGER)
	@JoinColumn(name="catagory_parent",nullable=true)
	private Catagory catagory_parent;
	
	/**
	 * 图书分类的折扣
	 * 0到1之间的小数
	 * 初始值为1
	 */
	@Column(nullable=false)
	private float discount;
	/**
	 * 图书分类折扣设置的时间
	 */
	@Column(nullable=false)
	private Date discount_date;

	public Integer getCatagory_id() {
		return catagory_id;
	}

	public void setCatagory_id(Integer catagory_id) {
		this.catagory_id = catagory_id;
	}

	public String getCatagory_name() {
		return catagory_name;
	}

	public void setCatagory_name(String catagory_name) {
		this.catagory_name = catagory_name;
	}

	public String getCatagory_level() {
		return catagory_level;
	}

	public void setCatagory_level(String catagory_level) {
		this.catagory_level = catagory_level;
	}

	public Date getCreate_date() {
		return create_date;
	}

	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}

	public Catagory getCatagory_parent() {
		return catagory_parent;
	}

	public void setCatagory_parent(Catagory catagory_parent) {
		this.catagory_parent = catagory_parent;
	}

	public void setDiscount(float discount) {
		this.discount = discount;
	}

	public float getDiscount() {
		return discount;
	}

	public void setDiscount_date(Date discount_date) {
		this.discount_date = discount_date;
	}

	public Date getDiscount_date() {
		return discount_date;
	}
	
	
}
