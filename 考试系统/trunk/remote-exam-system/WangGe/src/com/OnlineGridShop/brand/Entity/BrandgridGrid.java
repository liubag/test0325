package com.OnlineGridShop.brand.Entity;

import java.io.Serializable;
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
@Table(name="tb_brandgrid_grid")
public class BrandgridGrid implements Serializable {
	@Id
	private String brandgrid_grid_id;
	@Column(length=20)
	private String brandgrid_grid_number;
	@Column(length=30)
	private String grid_name;   //没有分配时为“”，分配后及时更新 == owner中grid_name
	@Column(length=20)
	private String addgoods_no;  //用于商品编号前缀
	private String brandgrid_grid_owner_id;
	@ManyToOne(optional=false,fetch=FetchType.LAZY,targetEntity=Brandgrid.class)
	@JoinColumn(name="brandgrid_id")
	private Brandgrid brandgrid;
	

	
	public BrandgridGrid(){
		
	}
	
	public BrandgridGrid(String isnew){
		this.brandgrid_grid_id = UUID.randomUUID().toString();
	}
	
	public String getBrandgrid_grid_number() {
		return brandgrid_grid_number;
	}
	public void setBrandgrid_grid_number(String brandgridGridNumber) {
		brandgrid_grid_number = brandgridGridNumber;
	}
	
	public Brandgrid getBrandgrid() {
		return brandgrid;
	}
	public void setBrandgrid(Brandgrid brandgrid) {
		this.brandgrid = brandgrid;
	}
	public String getBrandgrid_grid_id() {
		return brandgrid_grid_id.toLowerCase();
	}
	public void setBrandgrid_grid_id(String brandgridGridId) {
		brandgrid_grid_id = brandgridGridId;
	}
	public String getBrandgrid_grid_owner_id() {
		return brandgrid_grid_owner_id.toLowerCase();
	}
	public void setBrandgrid_grid_owner_id(String brandgridGridOwnerId) {
		brandgrid_grid_owner_id = brandgridGridOwnerId;
	}

	public String getAddgoods_no() {
		return addgoods_no;
	}

	public void setAddgoods_no(String addgoodsNo) {
		addgoods_no = addgoodsNo;
	}

	public String getGrid_name() {
		return grid_name;
	}

	public void setGrid_name(String gridName) {
		grid_name = gridName;
	}

	
}
