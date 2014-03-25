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
 * 员工处理会员订单和会员退货申请记录
 */
@SuppressWarnings("serial")
@Entity
@Table(name="tb_payment_method")
public class PaymentMethod implements Serializable {
	/**
	 * 支付方式编号
	 */
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer payment_method_id;
	/**
	 * 支付方式名称
	 */
	@Column(length=20,nullable=false)
	private String name;
	/**
	 * 创建时间
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
