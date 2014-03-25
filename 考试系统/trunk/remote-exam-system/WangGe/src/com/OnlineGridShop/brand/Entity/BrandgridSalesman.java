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
@Table(name="tb_brandgrid_salesman")
public class BrandgridSalesman implements Serializable {
	@Id
	private String brandgrid_salesman_id;
	@ManyToOne(optional=false,fetch=FetchType.LAZY,targetEntity=Brandgrid.class)
	@JoinColumn(name="brandgrid_id",nullable=false,updatable=false)
	private Brandgrid brandgrid;
	@Column(length=20)
	private String brandgrid_salesman_name;
	@Column(length=60)
	private String brandgrid_salesman_pw;
	@Column(length=2)
	private String brandgrid_salesman_sex;
	@Column(length=15)
	private String brandgrid_salesman_phone;
	@Column(length=15)
	private String brandgrid_salesman_qq;
	@Column(length=60)
	private String brandgrid_salesman_email;
	@Column(length=20)
	private String brandgrid_salesman_idcard;
	private Date brandgrid_salesman_newtime;  //创建时间
	private Date brandgrid_salesman_outtime;  //最近注销时间
	private Date brandgrid_salesman_intime;  //最近激活时间
	@Column(length=2) 
	private String brandgrid_salesman_status;  //1(正常)、0（过期）
	
	public BrandgridSalesman(){
		
	}
	
	public BrandgridSalesman(String isnew){
		this.brandgrid_salesman_id = UUID.randomUUID().toString();
	}
	
	public String getBrandgrid_salesman_id() {
		return brandgrid_salesman_id.toLowerCase();
	}
	public void setBrandgrid_salesman_id(String brandgridSalesmanId) {
		brandgrid_salesman_id = brandgridSalesmanId;
	}
	public void setBrandgrid_salesman_newtime(Date brandgridSalesmanNewtime) {
		brandgrid_salesman_newtime = brandgridSalesmanNewtime;
	}
	public void setBrandgrid_salesman_outtime(Date brandgridSalesmanOuttime) {
		brandgrid_salesman_outtime = brandgridSalesmanOuttime;
	}
	public Brandgrid getBrandgrid() {
		return brandgrid;
	}
	public void setBrandgrid(Brandgrid brandgrid) {
		this.brandgrid = brandgrid;
	}
	public String getBrandgrid_salesman_name() {
		return brandgrid_salesman_name;
	}
	public void setBrandgrid_salesman_name(String brandgridSalesmanName) {
		brandgrid_salesman_name = brandgridSalesmanName;
	}
	public String getBrandgrid_salesman_pw() {
		try {
			return AESEncryptor.decrypt(brandgrid_salesman_pw);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "";
		}
	}
	public void setBrandgrid_salesman_pw(String brandgridSalesmanPw) {
		try {
			brandgrid_salesman_pw = AESEncryptor.encrypt(brandgridSalesmanPw);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public String getBrandgrid_salesman_sex() {
		return brandgrid_salesman_sex;
	}
	public void setBrandgrid_salesman_sex(String brandgridSalesmanSex) {
		brandgrid_salesman_sex = brandgridSalesmanSex;
	}
	public String getBrandgrid_salesman_phone() {
		return brandgrid_salesman_phone;
	}
	public void setBrandgrid_salesman_phone(String brandgridSalesmanPhone) {
		brandgrid_salesman_phone = brandgridSalesmanPhone;
	}
	public String getBrandgrid_salesman_status() {
		return brandgrid_salesman_status;
	}
	public void setBrandgrid_salesman_status(String brandgridSalesmanStatus) {
		brandgrid_salesman_status = brandgridSalesmanStatus;
	}
	public Date getBrandgrid_salesman_newtime() {
		return brandgrid_salesman_newtime;
	}
	public Date getBrandgrid_salesman_outtime() {
		return brandgrid_salesman_outtime;
	}

	public String getBrandgrid_salesman_qq() {
		return brandgrid_salesman_qq;
	}

	public void setBrandgrid_salesman_qq(String brandgridSalesmanQq) {
		brandgrid_salesman_qq = brandgridSalesmanQq;
	}

	public String getBrandgrid_salesman_email() {
		return brandgrid_salesman_email;
	}

	public void setBrandgrid_salesman_email(String brandgridSalesmanEmail) {
		brandgrid_salesman_email = brandgridSalesmanEmail;
	}

	public String getBrandgrid_salesman_idcard() {
		return brandgrid_salesman_idcard;
	}

	public void setBrandgrid_salesman_idcard(String brandgridSalesmanIdcard) {
		brandgrid_salesman_idcard = brandgridSalesmanIdcard;
	}

	public Date getBrandgrid_salesman_intime() {
		return brandgrid_salesman_intime;
	}

	public void setBrandgrid_salesman_intime(Date brandgridSalesmanIntime) {
		brandgrid_salesman_intime = brandgridSalesmanIntime;
	}
	
	
}
