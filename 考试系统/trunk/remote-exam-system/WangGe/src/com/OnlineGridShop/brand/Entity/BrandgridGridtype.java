package com.OnlineGridShop.brand.Entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@SuppressWarnings("serial")
@Entity
@Table(name="tb_brandgrid_gridtype")
public class BrandgridGridtype implements Serializable {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer brandgrid_gridtype_id;
	@Column(length=20)
	private String brandgrid_gridtype_name;
	private Integer can_show_goods;
	private Integer unitprice;
	private Integer amount;
	private float hard_disk_space;
	private Integer LZ_note;   //每天可以置顶次数
	public Integer getBrandgrid_gridtype_id() {
		return brandgrid_gridtype_id;
	}
	public void setBrandgrid_gridtype_id(Integer brandgridGridtypeId) {
		brandgrid_gridtype_id = brandgridGridtypeId;
	}
	public String getBrandgrid_gridtype_name() {
		return brandgrid_gridtype_name;
	}
	public void setBrandgrid_gridtype_name(String brandgridGridtypeName) {
		brandgrid_gridtype_name = brandgridGridtypeName;
	}
	public Integer getCan_show_goods() {
		return can_show_goods;
	}
	public void setCan_show_goods(Integer canShowGoods) {
		can_show_goods = canShowGoods;
	}
	public Integer getUnitprice() {
		return unitprice;
	}
	public void setUnitprice(Integer unitprice) {
		this.unitprice = unitprice;
	}
	public Integer getAmount() {
		return amount;
	}
	public void setAmount(Integer amount) {
		this.amount = amount;
	}
	public float getHard_disk_space() {
		return hard_disk_space;
	}
	public void setHard_disk_space(float hardDiskSpace) {
		hard_disk_space = hardDiskSpace;
	}
	public Integer getLZ_note() {
		return LZ_note;
	}
	public void setLZ_note(Integer lZNote) {
		LZ_note = lZNote;
	}
	
}
