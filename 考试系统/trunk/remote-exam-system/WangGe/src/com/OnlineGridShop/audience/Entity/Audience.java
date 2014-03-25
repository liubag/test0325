package com.OnlineGridShop.audience.Entity;

import java.io.Serializable;
import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import com.OnlineGridShop.AESEncryptor.AESEncryptor;
@SuppressWarnings("serial")
@Entity
@Table(name="tb_audience")
public class Audience implements Serializable {
	@Id
	private String id;
	@Column(length=20)
	private String audience_truename;
	@Column(length=20)
	private String audience_nickname;
	@Column(length=100)
	private String audience_idcard;
	@Column(length=20)
	private String audience_status;
	@Column(length=60)
	private String audience_pw;
	private Integer audience_point;
	@Column(length=1)
	private String sex;
	@Column(length=15)
	private String phone;
	@Column(length=30)
	private String address;
	
	public Audience(){
		
	}
	public Audience(String isnew){
		this.setId(UUID.randomUUID().toString());
	}
	public String getId() {
		return this.id.toLowerCase();
	}



	public void setId(String id) {
		this.id = id;
	}



	public String getAudience_truename() {
		return audience_truename;
	}
	public void setAudience_truename(String audienceTruename) {
		audience_truename = audienceTruename;
	}
	public String getAudience_nickname() {
		return audience_nickname;
	}
	public void setAudience_nickname(String audienceNickname) {
		audience_nickname = audienceNickname;
	}
	
	public String getAudience_idcard() {
		return audience_idcard;
	}



	public void setAudience_idcard(String audience_idcard) {
		this.audience_idcard = audience_idcard;
	}



	public String getAudience_status() {
		return audience_status;
	}
	public void setAudience_status(String audienceStatus) {
		audience_status = audienceStatus;
	}
	public String getAudience_pw() {
		try {
			return AESEncryptor.decrypt(audience_pw);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "";
		}
	}
	public void setAudience_pw(String audiencePw) {
		try {
			audience_pw = AESEncryptor.encrypt(audiencePw);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public Integer getAudience_point() {
		return audience_point;
	}
	public void setAudience_point(Integer audiencePoint) {
		audience_point = audiencePoint;
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
	
	
	
}
