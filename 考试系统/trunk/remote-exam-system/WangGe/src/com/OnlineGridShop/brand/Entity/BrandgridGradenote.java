package com.OnlineGridShop.brand.Entity;

import java.io.Serializable;
import java.util.Date;
import java.util.UUID;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
@SuppressWarnings("serial")
@Entity
@Table(name="tb_brandgrid_gradenote")
public class BrandgridGradenote implements Serializable {
	@Id
	private String gradenote_id;
	private String brandgrid_id;
	@Temporal(TemporalType.DATE)
	private Date gradenote_time;
	private float total_price;
	
	public BrandgridGradenote(){
		
	}
	
	public BrandgridGradenote(String isnew){
		this.gradenote_id = UUID.randomUUID().toString();
	}

	public String getGradenote_id() {
		return gradenote_id;
	}

	public void setGradenote_id(String gradenoteId) {
		gradenote_id = gradenoteId;
	}

	public String getBrandgrid_id() {
		return brandgrid_id;
	}

	public void setBrandgrid_id(String brandgridId) {
		brandgrid_id = brandgridId;
	}

	public Date getGradenote_time() {
		return gradenote_time;
	}

	public void setGradenote_time(Date gradenoteTime) {
		gradenote_time = gradenoteTime;
	}

	public float getTotal_price() {
		return total_price;
	}

	public void setTotal_price(float totalPrice) {
		total_price = totalPrice;
	}

	
	
}
