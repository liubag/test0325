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
@Table(name="tb_brandgrid_preferential")
public class BrandgridPreferential implements Serializable {
	@Id
	private String brandgrid_preferential_id;   
	@Column(length=250)
	private String brandgrid_preferential;
	@Column(length=1000)
	private String brandgrid_zk_goodsid;
	@Column(length=2000)
	private String brandgrid_zhekou;
	@Column(length=2)
	private String brandgrid_qcStatus;//全场折扣标志 1：需要 ，0：不需要，。不能同时与brandgrid_zhekou并存
	private float brandgrid_qcZK;  // 全场折扣多少
	private Date do_time;  //所有操作时间
	private Date brandgrid_preferential_sqtime;  //1、2操作时间
	private Date brandgrid_preferential_dotime;  
	private Date brandgrid_preferential_outtime;  //当天为标准，第三天为过期时间
	private Date brandgrid_preferential_maksuretime;  //5、6操作时间
	private Date brandgrid_preferential_uptime;  //7操作时间
	private Date brandgrid_preferential_downtime;  //8操作时间
	@Column(length=2)
	private String sure_status;   
	/*
	 * 0(上传申请上架)
		7（已上架）
		8（已下架）

	 */
	@Column(length=2)
	private String brandgrid_preferential_status; 
	/*
	1（申请下架）
	2(申请上架)
	3（申请上架过期）
	4（申请下架过期）
	5（申请上架失败）
	6（申请下架失败）
	7（已上架）
	8（已下架）
	*/
	private Date LZ_datetime; //置顶时间，排序时间，一开始为上架时间(brandgrid_preferential_uptime)，之后为置顶时间
	
	@ManyToOne(optional=false,fetch=FetchType.LAZY,targetEntity=Brandgrid.class)
	@JoinColumn(name="brandgrid_id",nullable=false,updatable=false)
	private Brandgrid brandgrid;
	@ManyToOne(optional=false,fetch=FetchType.LAZY,targetEntity=BrandgridGridOwner.class)
	@JoinColumn(name="brandgrid_gridowner_id",nullable=false,updatable=false)
	private BrandgridGridOwner brandgridGridOwner;
	
	
    public BrandgridPreferential(){
		
	}
	
	public BrandgridPreferential(String isnew){
		this.brandgrid_preferential_id = UUID.randomUUID().toString();
	}
	public String getBrandgrid_preferential_id() {
		return brandgrid_preferential_id.toLowerCase();
	}
	public void setBrandgrid_preferential_id(String brandgridPreferentialId) {
		brandgrid_preferential_id = brandgridPreferentialId;
	}
	public String getBrandgrid_preferential() {
		return brandgrid_preferential;
	}
	public void setBrandgrid_preferential(String brandgridPreferential) {
		brandgrid_preferential = brandgridPreferential;
	}
	public Date getBrandgrid_preferential_dotime() {
		return brandgrid_preferential_dotime;
	}
	public void setBrandgrid_preferential_dotime(Date brandgridPreferentialDotime) {
		brandgrid_preferential_dotime = brandgridPreferentialDotime;
	}
	public Date getBrandgrid_preferential_outtime() {
		return brandgrid_preferential_outtime;
	}
	public void setBrandgrid_preferential_outtime(Date brandgridPreferentialOuttime) {
		brandgrid_preferential_outtime = brandgridPreferentialOuttime;
	}
	public Date getBrandgrid_preferential_maksuretime() {
		return brandgrid_preferential_maksuretime;
	}
	public void setBrandgrid_preferential_maksuretime(
			Date brandgridPreferentialMaksuretime) {
		brandgrid_preferential_maksuretime = brandgridPreferentialMaksuretime;
	}
	public Date getBrandgrid_preferential_uptime() {
		return brandgrid_preferential_uptime;
	}
	public void setBrandgrid_preferential_uptime(Date brandgridPreferentialUptime) {
		brandgrid_preferential_uptime = brandgridPreferentialUptime;
	}
	public Date getBrandgrid_preferential_downtime() {
		return brandgrid_preferential_downtime;
	}
	public void setBrandgrid_preferential_downtime(
			Date brandgridPreferentialDowntime) {
		brandgrid_preferential_downtime = brandgridPreferentialDowntime;
	}
	public String getBrandgrid_preferential_status() {
		return brandgrid_preferential_status;
	}
	public void setBrandgrid_preferential_status(String brandgridPreferentialStatus) {
		brandgrid_preferential_status = brandgridPreferentialStatus;
	}
	public Brandgrid getBrandgrid() {
		return brandgrid;
	}
	public void setBrandgrid(Brandgrid brandgrid) {
		this.brandgrid = brandgrid;
	}

	
	public BrandgridGridOwner getBrandgridGridOwner() {
		return brandgridGridOwner;
	}

	public void setBrandgridGridOwner(BrandgridGridOwner brandgridGridOwner) {
		this.brandgridGridOwner = brandgridGridOwner;
	}

	public Date getLZ_datetime() {
		return LZ_datetime;
	}

	public void setLZ_datetime(Date lZDatetime) {
		LZ_datetime = lZDatetime;
	}

	public String getBrandgrid_zhekou() {
		return brandgrid_zhekou;
	}

	public void setBrandgrid_zhekou(String brandgridZhekou) {
		brandgrid_zhekou = brandgridZhekou;
	}

	public String getBrandgrid_qcStatus() {
		return brandgrid_qcStatus;
	}

	public void setBrandgrid_qcStatus(String brandgridQcStatus) {
		brandgrid_qcStatus = brandgridQcStatus;
	}

	public float getBrandgrid_qcZK() {
		return brandgrid_qcZK;
	}

	public void setBrandgrid_qcZK(float brandgridQcZK) {
		brandgrid_qcZK = brandgridQcZK;
	}

	public String getBrandgrid_zk_goodsid() {
		return brandgrid_zk_goodsid;
	}

	public void setBrandgrid_zk_goodsid(String brandgridZkGoodsid) {
		brandgrid_zk_goodsid = brandgridZkGoodsid;
	}

	public String getSure_status() {
		return sure_status;
	}

	public void setSure_status(String sureStatus) {
		sure_status = sureStatus;
	}

	public Date getBrandgrid_preferential_sqtime() {
		return brandgrid_preferential_sqtime;
	}

	public void setBrandgrid_preferential_sqtime(Date brandgridPreferentialSqtime) {
		brandgrid_preferential_sqtime = brandgridPreferentialSqtime;
	}

	public Date getDo_time() {
		return do_time;
	}

	public void setDo_time(Date doTime) {
		do_time = doTime;
	}

	
	
}
