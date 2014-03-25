package com.OnlineGridShop.scattered.Entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@SuppressWarnings("serial")
@Entity
@Table(name="tb_scattered_grid_rendtype_make")
public class ScatteredGridRendtypeMake implements Serializable {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer rendtype_id;
	@Column(length=15)
	private String type_called;
	private Integer months;
	private float rendtype_agio;  //уш©ш
	@Column(length=1)
	private String status;
	
	public String getType_called() {
		return type_called;
	}
	public void setType_called(String typeCalled) {
		type_called = typeCalled;
	}
	
	public Integer getMonths() {
		return months;
	}
	public void setMonths(Integer months) {
		this.months = months;
	}
	
	public float getRendtype_agio() {
		return rendtype_agio;
	}
	public void setRendtype_agio(float rendtypeAgio) {
		rendtype_agio = rendtypeAgio;
	}
	public Integer getRendtype_id() {
		return rendtype_id;
	}
	public void setRendtype_id(Integer rendtypeId) {
		rendtype_id = rendtypeId;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
}
