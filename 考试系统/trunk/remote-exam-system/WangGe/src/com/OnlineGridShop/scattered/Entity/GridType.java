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
@Table(name="tb_grid_type")
public class GridType implements Serializable {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer gridtype_id;
	@Column(length=10)
	private String gridtypename;
	private Integer canshowgoods;
	private Integer unitprice;  //����
	private Integer amount;  //������>0������ɾ��
	private float hard_disk_space; //����Ӳ�̴�С����λ MB
	private Integer LZ_note;//ÿ����ö�����
	
	
	public Integer getGridtype_id() {
		return gridtype_id;
	}
	public void setGridtype_id(Integer gridtypeId) {
		gridtype_id = gridtypeId;
	}
	public String getGridtypename() {
		return gridtypename;
	}
	public void setGridtypename(String gridtypename) {
		this.gridtypename = gridtypename;
	}
	public Integer getCanshowgoods() {
		return canshowgoods;
	}
	public void setCanshowgoods(Integer canshowgoods) {
		this.canshowgoods = canshowgoods;
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
