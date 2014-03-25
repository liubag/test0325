package com.bookshop.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
/**
 * 优惠信息
 */
@SuppressWarnings("serial")
@Entity
@Table(name="tb_promotion")
public class Promotion implements Serializable {
	/**
	 * 优惠信息编号
	 * UUID
	 */
	@Id
	@Column(length=40)
	private String promotion_id;
	/**
	 * 优惠类型
	 * 1：满额打折
	 * 2：满额减价
	 */
	@Column(nullable=false)
	private Integer promotion_type;
	/**
	 * 需要满足的金额
	 */
	@Column(nullable=false)
	private float need_amount;
	/**
	 * 优惠金额
	 */
	@Column(nullable=true)
	private float promotion_money;
	/**
	 * 优惠折扣
	 * 0到1
	 */
	@Column(nullable=true)
	private float promotion_discount;
	/**
	 * 优惠创建日期
	 */
	@Column(nullable=false)
	private Date create_date;
	/**
	 * 优惠活动开始日期
	 */
	@Column(nullable=false)
	private Date effective_date;
	/**
	 * 优惠活动结束日期
	 */
	@Column(nullable=false)
	private Date expiry_date;
	/**
	 * 优惠活动宣传图片
	 * promotion_id+".jpg"
	 */
	@Column(nullable=true)
	private String promotion_image;
	/**
	 * 参加优惠活动图书分类id的集合
	 * 以","隔开
	 */
	@Column(nullable=false)
	private String promotion_catagorys;
	public Promotion(){
		
	}
	public Promotion(String isnew){
		this.promotion_id=UUID.randomUUID().toString();
	}
	public String getPromotion_id() {
		return promotion_id.toLowerCase();
	}
	public void setPromotion_id(String promotion_id) {
		this.promotion_id = promotion_id;
	}
	public Integer getPromotion_type() {
		return promotion_type;
	}
	public void setPromotion_type(Integer promotion_type) {
		this.promotion_type = promotion_type;
	}
	public float getNeed_amount() {
		return need_amount;
	}
	public void setNeed_amount(float need_amount) {
		this.need_amount = need_amount;
	}
	public float getPromotion_money() {
		return promotion_money;
	}
	public void setPromotion_money(float promotion_money) {
		this.promotion_money = promotion_money;
	}
	public float getPromotion_discount() {
		return promotion_discount;
	}
	public void setPromotion_discount(float promotion_discount) {
		this.promotion_discount = promotion_discount;
	}
	public Date getCreate_date() {
		return create_date;
	}
	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}
	public Date getEffective_date() {
		return effective_date;
	}
	public void setEffective_date(Date effective_date) {
		this.effective_date = effective_date;
	}
	public Date getExpiry_date() {
		return expiry_date;
	}
	public void setExpiry_date(Date expiry_date) {
		this.expiry_date = expiry_date;
	}

	public void setPromotion_catagorys(String promotion_catagorys) {
		this.promotion_catagorys = promotion_catagorys;
	}
	public String getPromotion_catagorys() {
		return promotion_catagorys;
	}
	public String getPromotion_image() {
		return promotion_image;
	}
	public void setPromotion_image(String promotion_image) {
		this.promotion_image = promotion_image;
	}
	
	
}
