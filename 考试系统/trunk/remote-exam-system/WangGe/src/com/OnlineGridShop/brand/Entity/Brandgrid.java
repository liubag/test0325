package com.OnlineGridShop.brand.Entity;

import java.io.Serializable;
import java.util.Date;
import java.util.UUID;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
@SuppressWarnings("serial")
@Entity
@Table(name="tb_brandgrid")
public class Brandgrid implements Serializable {
	@Id
	private String brandgrid_id;
	@Column(length=20)
	private String brandgrid_name;
	@Column(length=100)
	private String brandgrid_address;
	@Column(length=15)
	private String brandgrid_qq;
	@Column(length=60)
	private String brandgrid_emailPw;
	@Column(length=50)
	private String brandgrid_logo_img;//店logo图片名称  brandgrid_id + .jpg
	private Integer brandgrid_hasgrids;
	private Date brandgrid_newtime;
	private Date brandgrid_starttime;
	private Date brandgrid_endtime;
	private Integer hireTime;
	private Date brandgrid_outtime;
	@Column(length=2) 
	private String brandgrid_status;  //1(正常)、0（过期）
	@Column(length=20) 
	private String brandgrid_ip;  //ip地址	绑定店里才能登录
	@OneToOne(targetEntity=BrandgridOwner.class,fetch = FetchType.LAZY,cascade = CascadeType.ALL)
	@JoinColumn(name="brandgrid_owner_id")
	private BrandgridOwner brandgridOwner;
	@OneToOne(optional=false,fetch=FetchType.LAZY,targetEntity=BrandgridGridtype.class)
	@JoinColumn(name="brandgrid_gridtype_id",nullable=false,updatable=false)
	private BrandgridGridtype brandgridGridtype;
	
	public Brandgrid(){
		
	}
	
	public Brandgrid(String isnew){
		this.brandgrid_id = UUID.randomUUID().toString();
	}

	public String getBrandgrid_id() {
		return brandgrid_id.toLowerCase();
	}

	public void setBrandgrid_id(String brandgridId) {
		brandgrid_id = brandgridId;
	}

	public String getBrandgrid_name() {
		return brandgrid_name;
	}

	public void setBrandgrid_name(String brandgridName) {
		brandgrid_name = brandgridName;
	}

	public String getBrandgrid_address() {
		return brandgrid_address;
	}

	public void setBrandgrid_address(String brandgridAddress) {
		brandgrid_address = brandgridAddress;
	}

	public String getBrandgrid_qq() {
		return brandgrid_qq;
	}

	public void setBrandgrid_qq(String brandgridQq) {
		brandgrid_qq = brandgridQq;
	}

	public Integer getBrandgrid_hasgrids() {
		return brandgrid_hasgrids;
	}

	public void setBrandgrid_hasgrids(Integer brandgridHasgrids) {
		brandgrid_hasgrids = brandgridHasgrids;
	}

	public Date getBrandgrid_newtime() {
		return brandgrid_newtime;
	}

	public void setBrandgrid_newtime(Date brandgridNewtime) {
		brandgrid_newtime = brandgridNewtime;
	}

	public Date getBrandgrid_starttime() {
		return brandgrid_starttime;
	}

	public void setBrandgrid_starttime(Date brandgridStarttime) {
		brandgrid_starttime = brandgridStarttime;
	}

	public Date getBrandgrid_endtime() {
		return brandgrid_endtime;
	}

	public void setBrandgrid_endtime(Date brandgridEndtime) {
		brandgrid_endtime = brandgridEndtime;
	}

	public Integer getHireTime() {
		return hireTime;
	}

	public void setHireTime(Integer hireTime) {
		this.hireTime = hireTime;
	}

	public Date getBrandgrid_outtime() {
		return brandgrid_outtime;
	}

	public void setBrandgrid_outtime(Date brandgridOuttime) {
		brandgrid_outtime = brandgridOuttime;
	}

	public String getBrandgrid_status() {
		return brandgrid_status;
	}

	public void setBrandgrid_status(String brandgridStatus) {
		brandgrid_status = brandgridStatus;
	}

	public BrandgridOwner getBrandgridOwner() {
		return brandgridOwner;
	}

	public void setBrandgridOwner(BrandgridOwner brandgridOwner) {
		this.brandgridOwner = brandgridOwner;
	}

	public BrandgridGridtype getBrandgridGridtype() {
		return brandgridGridtype;
	}

	public void setBrandgridGridtype(BrandgridGridtype brandgridGridtype) {
		this.brandgridGridtype = brandgridGridtype;
	}

	public String getBrandgrid_ip() {
		return brandgrid_ip;
	}

	public void setBrandgrid_ip(String brandgridIp) {
		brandgrid_ip = brandgridIp;
	}

	public String getBrandgrid_logo_img() {
		return brandgrid_logo_img;
	}

	public void setBrandgrid_logo_img(String brandgridLogoImg) {
		brandgrid_logo_img = brandgridLogoImg;
	}

	public String getBrandgrid_emailPw() {
		return brandgrid_emailPw;
	}

	public void setBrandgrid_emailPw(String brandgridEmailPw) {
		brandgrid_emailPw = brandgridEmailPw;
	}

	
}
