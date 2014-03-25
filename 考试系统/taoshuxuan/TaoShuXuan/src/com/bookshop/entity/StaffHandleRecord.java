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
 * 员工处理会员订单和会员退货申请记录
 */
@SuppressWarnings("serial")
@Entity
@Table(name="tb_staff_handle_record")
public class StaffHandleRecord implements Serializable {
	/**
	 * 员工处理记录编号
	 * UUID
	 */
	@Id
	@Column(length=40)
	private String staff_handle_record_id;
	/**
	 * 处理日期
	 */
	@Column(nullable=false)
	private Date handle_date;
	/**
	 * 处理类型
	 * 1：处理用户订单
	 * 2：处理用户退货申请
	 */
	@Column(nullable=false)
	private Integer handle_type;
	/**
	 * 处理员工
	 */
	@ManyToOne(optional=false,targetEntity=Staff.class,fetch=FetchType.LAZY)
	@JoinColumn(name="staff_id",nullable=false)
	private Staff staff;
	/**
	 * 处理订单
	 */
	@ManyToOne(optional=true,targetEntity=Order.class,fetch=FetchType.LAZY)
	@JoinColumn(name="order_id",nullable=true)
	private Order order;
	/**
	 * 处理用户退货申请
	 */
	@ManyToOne(optional=true,targetEntity=RejectedApply.class,fetch=FetchType.LAZY)
	@JoinColumn(name="rejected_apply_id",nullable=true)
	private RejectedApply rejectedApply;
	/**
	 * 处理前的状态
	 */
	@Column(nullable=false)
	private Integer before_handle_status;
	/**
	 * 处理后的状态
	 */
	@Column(nullable=false)
	private Integer after_handle_status;
	
	public StaffHandleRecord(){
		
	}
	public StaffHandleRecord(String isnew){
		this.staff_handle_record_id=UUID.randomUUID().toString();
	}
	public String getStaff_handle_record_id() {
		return staff_handle_record_id.toLowerCase();
	}
	public void setStaff_handle_record_id(String staff_handle_record_id) {
		this.staff_handle_record_id = staff_handle_record_id;
	}
	public Date getHandle_date() {
		return handle_date;
	}
	public void setHandle_date(Date handle_date) {
		this.handle_date = handle_date;
	}
	public Integer getHandle_type() {
		return handle_type;
	}
	public void setHandle_type(Integer handle_type) {
		this.handle_type = handle_type;
	}
	public Staff getStaff() {
		return staff;
	}
	public void setStaff(Staff staff) {
		this.staff = staff;
	}
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	public RejectedApply getRejectedApply() {
		return rejectedApply;
	}
	public void setRejectedApply(RejectedApply rejectedApply) {
		this.rejectedApply = rejectedApply;
	}
	public Integer getBefore_handle_status() {
		return before_handle_status;
	}
	public void setBefore_handle_status(Integer before_handle_status) {
		this.before_handle_status = before_handle_status;
	}
	public Integer getAfter_handle_status() {
		return after_handle_status;
	}
	public void setAfter_handle_status(Integer after_handle_status) {
		this.after_handle_status = after_handle_status;
	}
	
	
	
}
