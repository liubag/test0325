package com.aspsystem.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@SuppressWarnings("serial")
@Entity
@Table(name="tb_admin")
public class Admin implements Serializable {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer admin_id;
	@Column(length=30)
	private String account;
	@Column(length=30)
	private String pw;
	public Integer getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(Integer adminId) {
		admin_id = adminId;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}

	
	
}
