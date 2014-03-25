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

import com.OnlineGridShop.AESEncryptor.AESEncryptor;
@SuppressWarnings("serial")
@Entity
@Table(name="tb_brandgrid_gridowner")
public class BrandgridGridOwner implements Serializable {
	@Id
	private String brandgrid_gridowner_id;
	@Column(length=40)
	private String brandgrid_gridowner_name;
	@Column(length=2)
	private String brandgrid_gridowner_sex;
	@Column(length=40)
	private String brandgrd_gridowner_username;
	@Column(length=60)
	private String brandgrid_gridowner_pw;
	@Column(length=15)
	private String brandgrid_gridowner_phone;
	@Column(length=2)
	private String brandgrid_gridowner_status;//1(正常)、0（过期）、-1（未非配格子）
	@ManyToOne(optional=false,fetch=FetchType.LAZY,targetEntity=Brandgrid.class)
	@JoinColumn(name="brandgrid_id",nullable=false,updatable=false)
	private Brandgrid brandgrid;
	@ManyToOne(optional=false,fetch=FetchType.LAZY,targetEntity=BrandgridGrid.class)
	@JoinColumn(name="brandgrid_grid_id",nullable=false,updatable=false)
	private BrandgridGrid brandgridGrid;
	private Date brandgrid_gridowner_newtime;
	private Date brandgrid_gridowner_outtime;
	@Column(length=60)
	private String brandgrid_gridowner_email;
	@Column(length=15)
	private String brandgrid_gridowner_qq;
	@Column(length=2)
	private String brandgrid_qcStatus;//全场折扣标志 1：需要 ，0：不需要，。不能同时与brandgrid_zhekou并存
	private float brandgrid_qcZK;  // 全场折扣多少
	private Integer brandgrid_grid_hasgoods;  //商品数
	private float brandgrid_hasused_space;
	private float brandgrid_outstanding;
	private Date LZ_time;  //每次登陆时都会判断，今天未更新，则更新可“置顶”次数
	private Integer LZ_note;//每天可剩余置顶的次数
	private Integer LZ_preferential;  //每天可以置顶优惠次数，为1次
	private int addgoods_no;  //用于商品的编号的后缀	规则：“格子商品编号前缀”+ 商品的编号后缀，从1开始
	private int u_hasgoods;   //在架商品数
	@Column(length=40)
	private String grid_name;
	@Column(length=50)
	private String grid_logo_img;  //格子logo图片名称	brandgrid_gridowner_id + .jpg
	
	public BrandgridGridOwner(){
		
	}
	
	public BrandgridGridOwner(String isnew){
		this.brandgrid_gridowner_id = UUID.randomUUID().toString();
	}
	
	public String getBrandgrid_gridowner_id() {
		return brandgrid_gridowner_id.toLowerCase();
	}
	public void setBrandgrid_gridowner_id(String brandgridGridownerId) {
		brandgrid_gridowner_id = brandgridGridownerId;
	}
	public String getBrandgrid_gridowner_name() {
		return brandgrid_gridowner_name;
	}
	public void setBrandgrid_gridowner_name(String brandgridGridownerName) {
		brandgrid_gridowner_name = brandgridGridownerName;
	}
	public String getBrandgrid_gridowner_sex() {
		return brandgrid_gridowner_sex;
	}
	public void setBrandgrid_gridowner_sex(String brandgridGridownerSex) {
		brandgrid_gridowner_sex = brandgridGridownerSex;
	}
	public String getBrandgrd_gridowner_username() {
		return brandgrd_gridowner_username;
	}
	public void setBrandgrd_gridowner_username(String brandgrdGridownerUsername) {
		brandgrd_gridowner_username = brandgrdGridownerUsername;
	}
	public String getBrandgrid_gridowner_pw() {
		try {
			return AESEncryptor.decrypt(brandgrid_gridowner_pw);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "";
		}
	}
	public void setBrandgrid_gridowner_pw(String brandgridGridownerPw) {
		try {
			brandgrid_gridowner_pw = AESEncryptor.encrypt(brandgridGridownerPw);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public String getBrandgrid_gridowner_phone() {
		return brandgrid_gridowner_phone;
	}
	public void setBrandgrid_gridowner_phone(String brandgridGridownerPhone) {
		brandgrid_gridowner_phone = brandgridGridownerPhone;
	}
	public String getBrandgrid_gridowner_status() {
		return brandgrid_gridowner_status;
	}
	public void setBrandgrid_gridowner_status(String brandgridGridownerStatus) {
		brandgrid_gridowner_status = brandgridGridownerStatus;
	}
	public Brandgrid getBrandgrid() {
		return brandgrid;
	}
	public void setBrandgrid(Brandgrid brandgrid) {
		this.brandgrid = brandgrid;
	}



	public BrandgridGrid getBrandgridGrid() {
		return brandgridGrid;
	}

	public void setBrandgridGrid(BrandgridGrid brandgridGrid) {
		this.brandgridGrid = brandgridGrid;
	}

	public Date getBrandgrid_gridowner_newtime() {
		return brandgrid_gridowner_newtime;
	}

	public void setBrandgrid_gridowner_newtime(Date brandgridGridownerNewtime) {
		brandgrid_gridowner_newtime = brandgridGridownerNewtime;
	}

	public Date getBrandgrid_gridowner_outtime() {
		return brandgrid_gridowner_outtime;
	}

	public void setBrandgrid_gridowner_outtime(Date brandgridGridownerOuttime) {
		brandgrid_gridowner_outtime = brandgridGridownerOuttime;
	}

	public String getBrandgrid_gridowner_email() {
		return brandgrid_gridowner_email;
	}

	public void setBrandgrid_gridowner_email(String brandgridGridownerEmail) {
		brandgrid_gridowner_email = brandgridGridownerEmail;
	}

	public String getBrandgrid_gridowner_qq() {
		return brandgrid_gridowner_qq;
	}

	public void setBrandgrid_gridowner_qq(String brandgridGridownerQq) {
		brandgrid_gridowner_qq = brandgridGridownerQq;
	}

	public String getBrandgrid_qcStatus() {
		return brandgrid_qcStatus;
	}

	public void setBrandgrid_qcStatus(String brandgridQcStatus) {
		brandgrid_qcStatus = brandgridQcStatus;
	}

	public float getBrandgrid_qcZK() {
		return brandgrid_qcZK;
	}

	public void setBrandgrid_qcZK(float brandgridQcZK) {
		brandgrid_qcZK = brandgridQcZK;
	}

	public Integer getBrandgrid_grid_hasgoods() {
		return brandgrid_grid_hasgoods;
	}

	public void setBrandgrid_grid_hasgoods(Integer brandgridGridHasgoods) {
		brandgrid_grid_hasgoods = brandgridGridHasgoods;
	}

	public float getBrandgrid_hasused_space() {
		return brandgrid_hasused_space;
	}

	public void setBrandgrid_hasused_space(float brandgridHasusedSpace) {
		brandgrid_hasused_space = brandgridHasusedSpace;
	}

	public float getBrandgrid_outstanding() {
		return brandgrid_outstanding;
	}

	public void setBrandgrid_outstanding(float brandgridOutstanding) {
		brandgrid_outstanding = brandgridOutstanding;
	}

	public Date getLZ_time() {
		return LZ_time;
	}

	public void setLZ_time(Date lZTime) {
		LZ_time = lZTime;
	}

	public Integer getLZ_note() {
		return LZ_note;
	}

	public void setLZ_note(Integer lZNote) {
		LZ_note = lZNote;
	}

	public Integer getLZ_preferential() {
		return LZ_preferential;
	}

	public void setLZ_preferential(Integer lZPreferential) {
		LZ_preferential = lZPreferential;
	}

	public int getAddgoods_no() {
		return addgoods_no;
	}

	public void setAddgoods_no(int addgoodsNo) {
		addgoods_no = addgoodsNo;
	}

	public int getU_hasgoods() {
		return u_hasgoods;
	}

	public void setU_hasgoods(int uHasgoods) {
		u_hasgoods = uHasgoods;
	}

	public String getGrid_name() {
		return grid_name;
	}

	public void setGrid_name(String gridName) {
		grid_name = gridName;
	}

	public String getGrid_logo_img() {
		return grid_logo_img;
	}

	public void setGrid_logo_img(String gridLogoImg) {
		grid_logo_img = gridLogoImg;
	}

	

	
}
