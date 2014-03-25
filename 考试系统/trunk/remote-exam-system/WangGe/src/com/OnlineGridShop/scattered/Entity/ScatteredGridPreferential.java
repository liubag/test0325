package com.OnlineGridShop.scattered.Entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
@SuppressWarnings("serial")
@Entity
@Table(name="tb_scattered_preferential")
public class ScatteredGridPreferential implements Serializable {
	@Id
	private String id;
	@ManyToOne(optional=false,fetch=FetchType.LAZY,targetEntity=ScatteredGrid.class)
	@JoinColumn(name="gridid",nullable=false,updatable=false)
	private ScatteredGrid scatteredGrid;
	@Column(length=100)
	private String preferential_text;
	@Column(length=30)
	private String do_time;
	@Column(length=30)
	private String used_time;
	@Column(length=30)
	private String down_time;
	@Column(length=3)
	private String status;  //1：正使用;0:下架;-11:强制废弃;
	private Date LZ_datetime;  //置顶时间	一开始== used_time
	
	public String getId() {
		return id.toLowerCase();
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPreferential_text() {
		return preferential_text;
	}
	public void setPreferential_text(String preferentialText) {
		preferential_text = preferentialText;
	}

	public String getDo_time() {
		return do_time;
	}
	public void setDo_time(String doTime) {
		do_time = doTime;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public ScatteredGrid getScatteredGrid() {
		return scatteredGrid;
	}
	public void setScatteredGrid(ScatteredGrid scatteredGrid) {
		this.scatteredGrid = scatteredGrid;
	}
	public String getUsed_time() {
		return used_time;
	}
	public void setUsed_time(String usedTime) {
		used_time = usedTime;
	}
	public String getDown_time() {
		return down_time;
	}
	public void setDown_time(String downTime) {
		down_time = downTime;
	}
	public Date getLZ_datetime() {
		return LZ_datetime;
	}
	public void setLZ_datetime(Date lZDatetime) {
		LZ_datetime = lZDatetime;
	}
	
	
}
