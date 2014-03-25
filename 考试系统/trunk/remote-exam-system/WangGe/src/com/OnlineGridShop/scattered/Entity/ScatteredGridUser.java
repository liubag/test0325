package com.OnlineGridShop.scattered.Entity;

import java.io.Serializable;
import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import com.OnlineGridShop.AESEncryptor.AESEncryptor;
@SuppressWarnings("serial")
@Entity
@Table(name="tb_scattered_grid_user")
public class ScatteredGridUser implements Serializable {
	@Id
	private String id;
	@Column(length=20)
	private String truename;
	@Column(length=20)
	private String username;
	@Column(length=100)
	private String idcard;
	@Column(length=60)
	private String pw;
	@Column(length=1)
	private String sex;
	@Column(length=13)
	private String qq_number;  //QQ客服
	@Column(length=20)
	private String phone;
	@Column(length=30)
	private String address;
	@Column(length=50)
	private String tipInfo;
	@Column(length=1)
	private String status;  //1（正常）0（注销）,2(可修改状态：未过注册那天为准线)
	
	
	public ScatteredGridUser(){
		
	}
	public ScatteredGridUser(String isnew){
		this.id = UUID.randomUUID().toString();
	}
	
	public String getId() {
		return id.toLowerCase();
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTruename() {
		return truename;
	}
	public void setTruename(String truename) {
		this.truename = truename;
	}
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getIdcard() {
		try {
			return AESEncryptor.decrypt(idcard);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "";
		}
	}
	public void setIdcard(String idcard) {
		try {
			idcard = AESEncryptor.encrypt(idcard);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public String getPw() {
		try {
			return AESEncryptor.decrypt(pw);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "";
		}
	}
	public void setPw(String pw) {
		try {
			pw = AESEncryptor.encrypt(pw);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTipInfo() {
		return tipInfo;
	}
	public void setTipInfo(String tipInfo) {
		this.tipInfo = tipInfo;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getQq_number() {
		return qq_number;
	}
	public void setQq_number(String qqNumber) {
		qq_number = qqNumber;
	}
	
	
	
	
	
}
