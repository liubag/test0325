package com.bookshop.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import com.bookshop.util.CryptoUtils;

/**
 * ��Ա
 */

@SuppressWarnings("serial")
@Entity
@Table(name="tb_customer")
public class Customer implements Serializable{
	/**
	 * ��Ա��email 
	 * ��¼�˺�
	 */
	@Id
	@Column(length=40)
	private String email; 
	/**
	 * ��¼����
	 */
	@Column(length=100,nullable=false)
	private String pw;
	/**
	 * ��ʵ����
	 */
	@Column(length=40)
	private String name;
	/**
	 * �Ա�
	 */
	@Column(length=2)
	private String sex;
	/**
	 * ��������
	 */
	private Date birthday;
	/**
	 * ��Ȥ����
	 */
	@Column(length=40)
	private String hobbies;
	/**
	 * ��ַ
	 */
	@Column(length=200)
	private String address;
	/**
	 * ע��ʱ��
	 */
	@Column(nullable=false)
	private Date join_date;
	/**
	 * �˻����
	 */
	@Column(nullable=false)
	private float balance;
	
	/**
	 * ��Ա�˺�״̬
	 * 1������״̬ 
	 * 0������״̬
	 * 2��δ����״̬
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
