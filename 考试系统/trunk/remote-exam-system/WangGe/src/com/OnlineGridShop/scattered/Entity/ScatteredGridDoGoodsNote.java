package com.OnlineGridShop.scattered.Entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
@SuppressWarnings("serial")
@Entity
@Table(name="tb_scattered_dogoodsnote")
public class ScatteredGridDoGoodsNote implements Serializable {
	@Id
	private String doid;
	@ManyToOne(optional=false,fetch=FetchType.LAZY,targetEntity=ScatteredGrid.class)
	@JoinColumn(name="gridid",nullable=false,updatable=false)
	private ScatteredGrid scatteredGrid;
	@ManyToOne(optional=false,fetch=FetchType.LAZY,targetEntity=ScatteredGridGoods.class)
	@JoinColumn(name="goods_id",nullable=false,updatable=false)
	private ScatteredGridGoods scatteredGridGoods;
	private Date do_time;
	private Integer do_amount;
	private float do_privce;
	private float do_truePrivce;  //实际操作单价
	private Integer do_type; //1：上架2：下架（todo:延后开发）         3：售出
	private float total_price;
	
	
	
	public String getDoid() {
		return doid.toLowerCase();
	}
	public void setDoid(String doid) {
		this.doid = doid;
	}
	public ScatteredGrid getScatteredGrid() {
		return scatteredGrid;
	}
	public void setScatteredGrid(ScatteredGrid scatteredGrid) {
		this.scatteredGrid = scatteredGrid;
	}
	public ScatteredGridGoods getScatteredGridGoods() {
		return scatteredGridGoods;
	}
	public void setScatteredGridGoods(ScatteredGridGoods scatteredGridGoods) {
		this.scatteredGridGoods = scatteredGridGoods;
	}
	
	public Date getDo_time() {
		return do_time;
	}
	public void setDo_time(Date doTime) {
		do_time = doTime;
	}
	public Integer getDo_amount() {
		return do_amount;
	}
	public void setDo_amount(Integer doAmount) {
		do_amount = doAmount;
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
	public float getDo_privce() {
		return do_privce;
	}
	public void setDo_privce(float doPrivce) {
		do_privce = doPrivce;
	}
	public float getDo_truePrivce() {
		return do_truePrivce;
	}
	public void setDo_truePrivce(float doTruePrivce) {
		do_truePrivce = doTruePrivce;
	}


}
