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
@Table(name="tb_scattered_goods")
public class ScatteredGridGoods implements Serializable {
	@Id
	private String goods_id;
	@ManyToOne(optional=false,fetch=FetchType.LAZY,targetEntity=ScatteredGrid.class)
	@JoinColumn(name="gridid",nullable=false,updatable=false)
	private ScatteredGrid scatteredGrid;
	private Integer goods_type_id;
	@Column(length=10)
	private String goods_type_name;
	@Column(length=20)
	private String goods_name;
	@Column(length=4000)
	private String goods_info;
	@Column(length=45)
	private String goods_photoname1;  //规则：grid_id +时间1.jpg
	@Column(length=45)
	private String goods_photoname2;  //规则：grid_id +时间2.jpg
	@Column(length=45)
	private String goods_photoname3;  //规则：grid_id +时间3.jpg
	private float goods_price;
	private float market_price;
	@Column(length=4)
	private String unit;//单位
	private Integer goods_hasamount;
	private Integer residual_mount; //剩余数量
	@Column(length=20)
	private String upload_time;  //上传时间
	@Column(length=20)
	private String put_time;  //上架时间
	@Column(length=20)
	private String undercarriage_time; //下架时间
	@Column(length=3)
	private String Status; //2（旧存库）、1（上架）、0（下架）注：只有拥有者操作下架才会执行下架操作、-11（违禁物品，恢复是直接转到2）
	private Integer bunkid; //记录上架后所排的位置，下架后归零
	private float rendtype_evaluation;  //评价
	private Date LZ_datetime; // 置顶时间	一开始== put_time
	
	
	
	public String getGoods_id() {
		return goods_id.toLowerCase();
	}
	public void setGoods_id(String goodsId) {
		goods_id = goodsId;
	}
	
	public ScatteredGrid getScatteredGrid() {
		return scatteredGrid;
	}
	public void setScatteredGrid(ScatteredGrid scatteredGrid) {
		this.scatteredGrid = scatteredGrid;
	}
	public Integer getGoods_type_id() {
		return goods_type_id;
	}
	public void setGoods_type_id(Integer goodsTypeId) {
		goods_type_id = goodsTypeId;
	}
	public String getGoods_name() {
		return goods_name;
	}
	public void setGoods_name(String goodsName) {
		goods_name = goodsName;
	}
	public String getGoods_info() {
		return goods_info;
	}
	public void setGoods_info(String goodsInfo) {
		goods_info = goodsInfo;
	}
	
	public String getGoods_photoname1() {
		return goods_photoname1;
	}
	public void setGoods_photoname1(String goodsPhotoname1) {
		goods_photoname1 = goodsPhotoname1;
	}
	public String getGoods_photoname2() {
		return goods_photoname2;
	}
	public void setGoods_photoname2(String goodsPhotoname2) {
		goods_photoname2 = goodsPhotoname2;
	}
	public String getGoods_photoname3() {
		return goods_photoname3;
	}
	public void setGoods_photoname3(String goodsPhotoname3) {
		goods_photoname3 = goodsPhotoname3;
	}
	public float getGoods_price() {
		return goods_price;
	}
	public void setGoods_price(float goodsPrice) {
		goods_price = goodsPrice;
	}
	public Integer getGoods_hasamount() {
		return goods_hasamount;
	}
	public void setGoods_hasamount(Integer goodsHasamount) {
		goods_hasamount = goodsHasamount;
	}
	public String getStatus() {
		return Status;
	}
	public void setStatus(String status) {
		Status = status;
	}
	
	public Integer getBunkid() {
		return bunkid;
	}
	public void setBunkid(Integer bunkid) {
		this.bunkid = bunkid;
	}
	public float getRendtype_evaluation() {
		return rendtype_evaluation;
	}
	public void setRendtype_evaluation(float rendtypeEvaluation) {
		rendtype_evaluation = rendtypeEvaluation;
	}
	public String getGoods_type_name() {
		return goods_type_name;
	}
	public void setGoods_type_name(String goodsTypeName) {
		goods_type_name = goodsTypeName;
	}
	public float getMarket_price() {
		return market_price;
	}
	public void setMarket_price(float marketPrice) {
		market_price = marketPrice;
	}
	public Integer getResidual_mount() {
		return residual_mount;
	}
	public void setResidual_mount(Integer residualMount) {
		residual_mount = residualMount;
	}
	public String getUpload_time() {
		return upload_time;
	}
	public void setUpload_time(String uploadTime) {
		upload_time = uploadTime;
	}
	public String getPut_time() {
		return put_time;
	}
	public void setPut_time(String putTime) {
		put_time = putTime;
	}
	public String getUndercarriage_time() {
		return undercarriage_time;
	}
	public void setUndercarriage_time(String undercarriageTime) {
		undercarriage_time = undercarriageTime;
	}
	public Date getLZ_datetime() {
		return LZ_datetime;
	}
	public void setLZ_datetime(Date lZDatetime) {
		LZ_datetime = lZDatetime;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	
	
}
