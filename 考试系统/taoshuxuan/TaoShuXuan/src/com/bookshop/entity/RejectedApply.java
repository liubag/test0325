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
import javax.persistence.OneToOne;
import javax.persistence.Table;
/**
 * ��Ա�˻�����
 */
@SuppressWarnings("serial")
@Entity
@Table(name="tb_rejected_apply")
public class RejectedApply implements Serializable {
	/**
	 * �˻�������
	 * UUID
	 */
	@Id
	@Column(length=40)
	private String rejected_apply_id;
	/**
	 * �����˻��Ļ�Ա
	 */
	@ManyToOne(optional=false,targetEntity=Customer.class,fetch=FetchType.LAZY)
	@JoinColumn(name="customer_email",nullable=false)
	private Customer customer;
	/**
	 * ��������
	 */
	@Column(nullable=false)
	private Date apply_date;
	/**
	 * ȡ����������
	 */
	private Date cancel_date;
	/**
	 * �˻�����
	 */
	@Column(length=200,nullable=false)
	private String apply_reason;
	/**
	 * �˻��Ķ���
	 */
	@OneToOne(optional=false,targetEntity=Order.class,fetch=FetchType.LAZY)
	@JoinColumn(name="order_id",nullable=false)
	private Order order;
	/**
	 * �˻�����״̬
	 * 0���ȴ���ˣ�
	 * 1������ɹ���
	 * 2������ʧ�ܣ�
	 * 3���ջ��У�
	 * 4���˻��ɹ�
	 */
	private Integer status;
	public RejectedApply(){
		
	}
	public RejectedApply(String isnew){
		this.rejected_apply_id=UUID.randomUUID().toString();
	}
	public String getRejected_apply_id() {
		return rejected_apply_id.toLowerCase();
	}
	public void setRejected_apply_id(String rejected_apply_id) {
		this.rejected_apply_id = rejected_apply_id;
	}
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	public Date getApply_date() {
		return apply_date;
	}
	public void setApply_date(Date apply_date) {
		this.apply_date = apply_date;
	}
	public Date getCancel_date() {
		return cancel_date;
	}
	public void setCancel_date(Date cancel_date) {
		this.cancel_date = cancel_date;
	}
	public String getApply_reason() {
		return apply_reason;
	}
	public void setApply_reason(String apply_reason) {
		this.apply_reason = apply_reason;
	}
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	
	
}
