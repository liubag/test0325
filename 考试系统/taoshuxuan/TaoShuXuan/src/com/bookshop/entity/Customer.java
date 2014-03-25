package com.bookshop.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import com.bookshop.util.CryptoUtils;

/**
 * 会员
 */

@SuppressWarnings("serial")
@Entity
@Table(name="tb_customer")
public class Customer implements Serializable{
	/**
	 * 会员的email 
	 * 登录账号
	 */
	@Id
	@Column(length=40)
	private String email; 
	/**
	 * 登录密码
	 */
	@Column(length=100,nullable=false)
	private String pw;
	/**
	 * 真实姓名
	 */
	@Column(length=40)
	private String name;
	/**
	 * 性别
	 */
	@Column(length=2)
	private String sex;
	/**
	 * 出生日期
	 */
	private Date birthday;
	/**
	 * 兴趣爱好
	 */
	@Column(length=40)
	private String hobbies;
	/**
	 * 地址
	 */
	@Column(length=200)
	private String address;
	/**
	 * 注册时间
	 */
	@Column(nullable=false)
	private Date join_date;
	/**
	 * 账户余额
	 */
	@Column(nullable=false)
	private float balance;
	
	/**
	 * 会员账号状态
	 * 1：正常状态 
	 * 0：禁用状态
	 * 2：未激活状态
	 */
	@Column(nullable=false)
	private Integer status; 
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPw() {
		return CryptoUtils.delEncryptPwd(pw);
	}
	public void setPw(String pw) {
		this.pw = CryptoUtils.getEncryptPwd(pw);
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getHobbies() {
		return hobbies;
	}
	public void setHobbies(String hobbies) {
		this.hobbies = hobbies;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Date getJoin_date() {
		return join_date;
	}
	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}
	public float getBalance() {
		return balance;
	}
	public void setBalance(float balance) {
		this.balance = balance;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	
	
	
}
