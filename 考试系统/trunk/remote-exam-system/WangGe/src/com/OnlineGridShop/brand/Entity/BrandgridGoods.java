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

import com.OnlineGridShop.scattered.Entity.GoodsType;
@SuppressWarnings("serial")
@Entity
@Table(name="tb_brandgrid_goods")
public class BrandgridGoods implements Serializable {
	@Id
	private String brandgrid_goods_id;  
	@Column(length=40)
	private String goods_name;   //20字内
	@Column(length=5000)
	private String goods_info;  //1500字内
	@Column(length=30)
	private String goods_no;  //规则：格子编号+“自动增长”
	@Column(length=40)
	private String goods_photoname1;
	@Column(length=40)
	private String goods_photoname2;
	@Column(length=40)
	private String goods_photoname3;
	@Column(length=4)
	private String unit;  //单位
	private float goods_price;
	private float market_price;
	private Integer goods_hasamount;
	private Integer residual_mount;
	private Date do_day_time;//售货员操作申请商品的时间	为了方便查询今天操作记录
	private Date upload_time; //上传|申请时间
	private Date overdue_time;  //过期时间
	private Date put_time;  //上架时间
	private Date undercarriage_time;  //下架时间)
	private Date makesure_time;  //8、9 操作时间
	private float goods_ZK;//全场折扣多少
	@Column(length=2)
	private String sure_status;  //确切状态     5（已上架）6（已下架）7（旧库存）
	@Column(length=2)
	private String status;  
	/*
	 * 0（上申请上架）
	 * 1（下申请上架）
		2（申请下架）
		3（申请上架过期）
		4（申请下架过期）
		5（已上架）
		6（已下架）
		7（旧库存）
		8（申请上架失败）
		9（申请下架失败）
	 * 
	 * */
	private Date LZ_datetime; //置顶时间，排序时间，一开始为上架时间(put_time)，之后为置顶时间
	@ManyToOne(optional=false,targetEntity=BrandgridGridOwner.class,fetch=FetchType.LAZY)
	@JoinColumn(name="brandgrid_gridowner_id")
	private BrandgridGridOwner brandgridGridOwner;
	@ManyToOne(optional=false,fetch=FetchType.LAZY,targetEntity=Brandgrid.class)
	@JoinColumn(name="brandgrid_id",nullable=false,updatable=false)
	private Brandgrid brandgrid;
	@ManyToOne(optional=false,fetch=FetchType.LAZY,targetEntity=GoodsType.class)
	@JoinColumn(name="id",nullable=false,updatable=false)
	private GoodsType goodsType;
	 public BrandgridGoods(){
			
		}
		
		public BrandgridGoods(String isnew){
			this.brandgrid_goods_id = UUID.randomUUID().toString();
		}
	public String getBrandgrid_goods_id() {
		return brandgrid_goods_id.toLowerCase();
	}
	public void setBrandgrid_goods_id(String brandgridGoodsId) {
		brandgrid_goods_id = brandgridGoodsId;
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
	public float getMarket_price() {
		return market_price;
	}
	public void setMarket_price(float marketPrice) {
		market_price = marketPrice;
	}
	public Integer getGoods_hasamount() {
		return goods_hasamount;
	}
	public void setGoods_hasamount(Integer goodsHasamount) {
		goods_hasamount = goodsHasamount;
	}
	public Integer getResidual_mount() {
		return residual_mount;
	}
	public void setResidual_mount(Integer residualMount) {
		residual_mount = residualMount;
	}
	public Date getUpload_time() {
		return upload_time;
	}
	public void setUpload_time(Date uploadTime) {
		upload_time = uploadTime;
	}
	public Date getOverdue_time() {
		return overdue_time;
	}
	public void setOverdue_time(Date overdueTime) {
		overdue_time = overdueTime;
	}
	public Date getPut_time() {
		return put_time;
	}
	public void setPut_time(Date putTime) {
		put_time = putTime;
	}
	public Date getUndercarriage_time() {
		return undercarriage_time;
	}
	public void setUndercarriage_time(Date undercarriageTime) {
		undercarriage_time = undercarriageTime;
	}
	public Date getMakesure_time() {
		return makesure_time;
	}
	public void setMakesure_time(Date makesureTime) {
		makesure_time = makesureTime;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	public BrandgridGridOwner getBrandgridGridOwner() {
		return brandgridGridOwner;
	}

	public void setBrandgridGridOwner(BrandgridGridOwner brandgridGridOwner) {
		this.brandgridGridOwner = brandgridGridOwner;
	}

	public Brandgrid getBrandgrid() {
		return brandgrid;
	}
	public void setBrandgrid(Brandgrid brandgrid) {
		this.brandgrid = brandgrid;
	}
	public GoodsType getGoodsType() {
		return goodsType;
	}
	public void setGoodsType(GoodsType goodsType) {
		this.goodsType = goodsType;
	}

	public String getGoods_no() {
		return goods_no;
	}

	public void setGoods_no(String goodsNo) {
		goods_no = goodsNo;
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


	public float getGoods_ZK() {
		return goods_ZK;
	}

	public void setGoods_ZK(float goodsZK) {
		goods_ZK = goodsZK;
	}

	public Date getDo_day_time() {
		return do_day_time;
	}

	public void setDo_day_time(Date doDayTime) {
		do_day_time = doDayTime;
	}

	public String getSure_status() {
		return sure_status;
	}

	public void setSure_status(String sureStatus) {
		sure_status = sureStatus;
	}
	
}
