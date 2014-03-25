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
@Table(name="tb_brandgrid_infocote")
public class BrandgridInfocote implements Serializable {
	@Id
	private String brandgrid_infocote_id;
	@ManyToOne(optional=false,fetch=FetchType.LAZY,targetEntity=Brandgrid.class)
	@JoinColumn(name="brandgrid_id",nullable=false,updatable=false)
	private Brandgrid brandgrid;
	@Column(length=200)
	private String brandgrid_infocote;
	@Column(length=2)
	private String brandgrid_infocote_status;
	private Date brandgrid_infocote_dotime;
	private Date brandgrid_infocote_outtime;
	private Date brandgrid_infocote_uptime;
	public BrandgridInfocote(){
		
	}
	
	public BrandgridInfocote(String isnew){
		this.brandgrid_infocote_id = UUID.randomUUID().toString();
	}

	public String getBrandgrid_infocote_id() {
		return brandgrid_infocote_id.toLowerCase();
	}

	public void setBrandgrid_infocote_id(String brandgridInfocoteId) {
		brandgrid_infocote_id = brandgridInfocoteId;
	}

	public Brandgrid getBrandgrid() {
		return brandgrid;
	}

	public void setBrandgrid(Brandgrid brandgrid) {
		this.brandgrid = brandgrid;
	}

	public String getBrandgrid_infocote_status() {
		return brandgrid_infocote_status;
	}

	public void setBrandgrid_infocote_status(String brandgridInfocoteStatus) {
		brandgrid_infocote_status = brandgridInfocoteStatus;
	}

	public Date getBrandgrid_infocote_dotime() {
		return brandgrid_infocote_dotime;
	}

	public void setBrandgrid_infocote_dotime(Date brandgridInfocoteDotime) {
		brandgrid_infocote_dotime = brandgridInfocoteDotime;
	}

	public Date getBrandgrid_infocote_outtime() {
		return brandgrid_infocote_outtime;
	}

	public void setBrandgrid_infocote_outtime(Date brandgridInfocoteOuttime) {
		brandgrid_infocote_outtime = brandgridInfocoteOuttime;
	}

	public Date getBrandgrid_infocote_uptime() {
		return brandgrid_infocote_uptime;
	}

	public void setBrandgrid_infocote_uptime(Date brandgridInfocoteUptime) {
		brandgrid_infocote_uptime = brandgridInfocoteUptime;
	}

	public String getBrandgrid_infocote() {
		return brandgrid_infocote;
	}

	public void setBrandgrid_infocote(String brandgridInfocote) {
		brandgrid_infocote = brandgridInfocote;
	}
	
	
}
