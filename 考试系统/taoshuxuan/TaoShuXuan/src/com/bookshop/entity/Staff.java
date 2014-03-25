package com.bookshop.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import com.bookshop.util.CryptoUtils;
/**
 * 员工
 */
@SuppressWarnings("serial")
@Entity
@Table(name="tb_staff")
public class Staff implements Serializable {
	/**
	 * 员工工号
	 * 登录账号
	 */
	@Id
	@Column(length=40)
	private String staff_id;
	/**
	 * 登录密码
	 */
	@Column(length=100,nullable=false)
	private String pw;
	/**
	 * 姓名
	 */
	@Column(length=40,nullable=false)
	private String name;
	/**
	 * 性别
	 */
	@Column(length=2,nullable=false)
	private String sex;
	/**
	 * 出生日期
	 */
	@Column(nullable=false)
	private Date birthday;
	/**
	 * 加入日期
	 */
	@Column(nullable=false)
	private Date join_date;
	/**
	 * 地址
	 */
	@Column(length=200)
	private String address;
	/**
	 * 员工账号状态
	 * 1：正常状态
	 * 0：禁用状态
	 */
	@Column(nullable=false)
	private Integer status;
	/**
	 * 员工账号禁用/离职日期
	 */
	private Date remove_date;
	/**
	 * 员工身份证号
	 */
	private String idcard;
	/**
	 * 员工联系电话
	 */
	private String phone;
	
	public String getStaff_id() {
		return staff_id;
	}
	public void setStaff_id(String staff_id) {
		this.staff_id = staff_id;
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
	public Date getJoin_date() {
		return join_date;
	}
	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Date getRemove_date() {
		return remove_date;
	}
	public void setRemove_date(Date remove_date) {
		this.remove_date = remove_date;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPhone() {
		return phone;
	}
	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}
	public String getIdcard() {
		return idcard;
	}
	
	
}
