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
 * ͼ�����
 */
@SuppressWarnings("serial")
@Entity
@Table(name="tb_catagory")
public class Catagory implements Serializable {
	/**
	 * ���
	 */
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer catagory_id;
	/**
	 * ��������
	 */
	@Column(nullable=false)
	private String catagory_name;
	/**
	 * ���༶��
	 * 1������
	 * 2������
	 */
	@Column(nullable=false)
	private String catagory_level;
	/**
	 * ����ʱ��
	 */
	@Column(nullable=false)
	private Date create_date;
	
	/**
	 * ����
	 */
	@ManyToOne(optional=true,targetEntity=Catagory.class,fetch=FetchType.EAGER)
	@JoinColumn(name="catagory_parent",nullable=true)
	private Catagory catagory_parent;
	
	/**
	 * ͼ�������ۿ�
	 * 0��1֮���С��
	 * ��ʼֵΪ1
	 */
	@Column(nullable=false)
	private float discount;
	/**
	 * ͼ������ۿ����õ�ʱ��
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
