package com.OnlineGridShop.brand.Entity;

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
@SuppressWarnings("serial")
@Entity
@Table(name="tb_brandgrid_sellnote")
public class BrandgridSellnote implements Serializable {
	@Id
	private String brandgrid_do_id;   //使用时间转int格式
	@Column(length=40)
	private String do_name;   //商品名称
	@Column(length=20)
	private String back_salesman_name;  //操作回滚人员名称
	private Date do_time;   
	private Date back_time;   //回滚时间
	private Integer do_amount;
	private float do_privce;
	private Integer do_type; 
	/*
	 * 1：上架
		2：下架
		3：售出
		4：回滚
	 */
	private float discount;  //折扣
	private float total_price;
	@ManyToOne(optional=false,targetEntity=BrandgridGridOwner.class,fetch=FetchType.LAZY)
	@JoinColumn(name="brandgrid_gridowner_id")
	private BrandgridGridOwner brandgridGridOwner;
	@ManyToOne(optional=false,fetch=FetchType.LAZY,targetEntity=Brandgrid.class)
	@JoinColumn(name="brandgrid_id",nullable=false,updatable=false)
	private Brandgrid brandgrid;
	@ManyToOne(optional=false,fetch=FetchType.LAZY,targetEntity=BrandgridGoods.class)
	@JoinColumn(name="brandgrid_goods_id",nullable=false,updatable=false)
	private BrandgridGoods brandgridGoods;
	@ManyToOne(optional=false,fetch=FetchType.LAZY,targetEntity=BrandgridSalesman.class)
	@JoinColumn(name="brandgrid_salesman_id",nullable=false,updatable=false)
	private BrandgridSalesman brandgridSalesman;
	
	public BrandgridSellnote(){
		
	}
	
	public BrandgridSellnote(String isnew){
		this.brandgrid_do_id = UUID.randomUUID().toString();
	}
	
	
	public String getBrandgrid_do_id() {
		return brandgrid_do_id.toLowerCase();
	}
	public void setBrandgrid_do_id(String brandgridDoId) {
		brandgrid_do_id = brandgridDoId;
	}
	
	public Date getDo_time() {
		return do_time;
	}

	public void setDo_time(Date doTime) {
		do_time = doTime;
	}

	public Date getBack_time() {
		return back_time;
	}

	public void setBack_time(Date backTime) {
		back_time = backTime;
	}

	public Integer getDo_amount() {
		return do_amount;
	}
	public void setDo_amount(Integer doAmount) {
		do_amount = doAmount;
	}
	public float getDo_privce() {
		return do_privce;
	}
	public void setDo_privce(float doPrivce) {
		do_privce = doPrivce;
	}
	public Integer getDo_type() {
		return do_type;
	}
	public void setDo_type(Integer doType) {
		do_type = doType;
	}
	public float getTotal_price() {
		return total_price;
	}
	public void setTotal_price(float totalPrice) {
		total_price = totalPrice;
	}
	
	public BrandgridGridOwner getBrandgridGridOwner() {
		return brandgridGridOwner;
	}

	public void setBrandgridGridOwner(BrandgridGridOwner brandgridGridOwner) {
		this.brandgridGridOwner = brandgridGridOwner;
	}

	public Brandgrid getBrandgrid() {
		return brandgrid;
	}
	public void setBrandgrid(Brandgrid brandgrid) {
		this.brandgrid = brandgrid;
	}
	public BrandgridGoods getBrandgridGoods() {
		return brandgridGoods;
	}
	public void setBrandgridGoods(BrandgridGoods brandgridGoods) {
		this.brandgridGoods = brandgridGoods;
	}
	public BrandgridSalesman getBrandgridSalesman() {
		return brandgridSalesman;
	}
	public void setBrandgridSalesman(BrandgridSalesman brandgridSalesman) {
		this.brandgridSalesman = brandgridSalesman;
	}

	public float getDiscount() {
		return discount;
	}

	public void setDiscount(float discount) {
		this.discount = discount;
	}

	public String getDo_name() {
		return do_name;
	}

	public void setDo_name(String doName) {
		do_name = doName;
	}

	public String getBack_salesman_name() {
		return back_salesman_name;
	}

	public void setBack_salesman_name(String backSalesmanName) {
		back_salesman_name = backSalesmanName;
	}

}
