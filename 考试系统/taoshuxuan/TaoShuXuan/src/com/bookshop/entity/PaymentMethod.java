package com.bookshop.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
/**
 * Ա�������Ա�����ͻ�Ա�˻������¼
 */
@SuppressWarnings("serial")
@Entity
@Table(name="tb_payment_method")
public class PaymentMethod implements Serializable {
	/**
	 * ֧����ʽ���
	 */
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer payment_method_id;
	/**
	 * ֧����ʽ����
	 */
	@Column(length=20,nullable=false)
	private String name;
	/**
	 * ����ʱ��
	 */
	@Column(nullable=false)
	private Date create_date;
	
	
	public Integer getPayment_method_id() {
		return payment_method_id;
	}
	public void setPayment_method_id(Integer payment_method_id) {
		this.payment_method_id = payment_method_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getCreate_date() {
		return create_date;
	}
	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}
	
	
}
