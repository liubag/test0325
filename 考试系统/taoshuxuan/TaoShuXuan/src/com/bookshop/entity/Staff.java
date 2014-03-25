package com.bookshop.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import com.bookshop.util.CryptoUtils;
/**
 * Ա��
 */
@SuppressWarnings("serial")
@Entity
@Table(name="tb_staff")
public class Staff implements Serializable {
	/**
	 * Ա������
	 * ��¼�˺�
	 */
	@Id
	@Column(length=40)
	private String staff_id;
	/**
	 * ��¼����
	 */
	@Column(length=100,nullable=false)
	private String pw;
	/**
	 * ����
	 */
	@Column(length=40,nullable=false)
	private String name;
	/**
	 * �Ա�
	 */
	@Column(length=2,nullable=false)
	private String sex;
	/**
	 * ��������
	 */
	@Column(nullable=false)
	private Date birthday;
	/**
	 * ��������
	 */
	@Column(nullable=false)
	private Date join_date;
	/**
	 * ��ַ
	 */
	@Column(length=200)
	private String address;
	/**
	 * Ա���˺�״̬
	 * 1������״̬
	 * 0������״̬
	 */
	@Column(nullable=false)
	private Integer status;
	/**
	 * Ա���˺Ž���/��ְ����
	 */
	private Date remove_date;
	/**
	 * Ա�����֤��
	 */
	private String idcard;
	/**
	 * Ա����ϵ�绰
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
