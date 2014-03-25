package com.OnlineGridShop.admin.Entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.OnlineGridShop.AESEncryptor.AESEncryptor;
@SuppressWarnings("serial")
@Entity
@Table(name="tb_ultimateadmin")
public class UltimateAdmin implements Serializable {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	@Column(length=20)
	private String name;
	@Column(length=60)
	private String pw;
	public Integer getId() {
		return id;
	}
	
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	
	
	
	
}
