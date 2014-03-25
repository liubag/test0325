package com.OnlineGridShop.brand.Entity;

import java.io.Serializable;
import java.util.Date;
import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import com.OnlineGridShop.AESEncryptor.AESEncryptor;
@SuppressWarnings("serial")
@Entity
@Table(name="tb_brandgrid_owner")
public class BrandgridOwner implements Serializable {
	@Id
	private String brandgrid_owner_id;
	@Column(length=20)
	private String brandgrid_owner_name;
	@Column(length=100)
	private String brandgrid_owner_username;
	@Column(length=60)
	private String brandgrid_owner_pw;
	@Column(length=2)
	private String brandgrid_owner_sex;
	@Column(length=15)
	private String brandgrid_owner_phone;
	private Date brandgrid_gridowner_newtime;
	private Date brandgrid_gridowner_outtime;
	
	public BrandgridOwner(){
		
	}
	
	public BrandgridOwner(String isnew){
		this.brandgrid_owner_id = UUID.randomUUID().toString();
	}
	
	public String getBrandgrid_owner_id() {
		return brandgrid_owner_id.toLowerCase();
	}
	public void setBrandgrid_owner_id(String brandgridOwnerId) {
		brandgrid_owner_id = brandgridOwnerId;
	}
	public String getBrandgrid_owner_name() {
		return brandgrid_owner_name;
	}
	public void setBrandgrid_owner_name(String brandgridOwnerName) {
		brandgrid_owner_name = brandgridOwnerName;
	}
	public String getBrandgrid_owner_username() {
		return brandgrid_owner_username;
	}
	public void setBrandgrid_owner_username(String brandgridOwnerUsername) {
		brandgrid_owner_username = brandgridOwnerUsername;
	}
	public String getBrandgrid_owner_pw() {
		try {
			return AESEncryptor.decrypt(brandgrid_owner_pw);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "";
		}
	}
	public void setBrandgrid_owner_pw(String brandgridOwnerPw) {
		try {
			brandgrid_owner_pw = AESEncryptor.encrypt(brandgridOwnerPw);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	public String getBrandgrid_owner_sex() {
		return brandgrid_owner_sex;
	}
	public void setBrandgrid_owner_sex(String brandgridOwnerSex) {
		brandgrid_owner_sex = brandgridOwnerSex;
	}
	public String getBrandgrid_owner_phone() {
		return brandgrid_owner_phone;
	}
	public void setBrandgrid_owner_phone(String brandgridOwnerPhone) {
		brandgrid_owner_phone = brandgridOwnerPhone;
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
	
	
}
