package com.bookshop.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.bookshop.util.CryptoUtils;
/**
 * Õ¯’æπ‹¿Ì‘±
 */
@SuppressWarnings("serial")
@Entity
@Table(name="tb_admin")
public class Admin implements Serializable {
	/**
	 * ±‡∫≈
	 */
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer admin_id;
	
	/**
	 * π‹¿Ì‘±µ«¬º’À∫≈
	 */
	@Column(length=40,nullable=false)
	private String account;
	/**
	 * µ«¬º√‹¬Î
	 */
	@Column(length=100,nullable=false)
	private String pw;
	
	public Integer getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(Integer admin_id) {
		this.admin_id = admin_id;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getPw() {
		return CryptoUtils.delEncryptPwd(pw);
	}
	public void setPw(String pw) {
		this.pw = CryptoUtils.getEncryptPwd(pw);
	}
	
	
}
