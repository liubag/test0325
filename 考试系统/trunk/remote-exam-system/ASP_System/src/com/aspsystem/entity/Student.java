package com.aspsystem.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
@SuppressWarnings("serial")
@Entity
@Table(name="tb_student")
public class Student implements Serializable {
	@Id
	@Column(length=20)
	private String stu_id;
	@Column(length=30)
	private String name;
	@Column(length=30)
	private String sex;
	@Column(length=30)
	private String pw;
	private Date join_time;
	@ManyToOne(optional=false,fetch=FetchType.EAGER,targetEntity=MyClass.class)
	@JoinColumn(name="class_id",nullable=false,updatable=false)
	private MyClass myclass;
	@Column(length=2,nullable=false)
	private Integer status;  //0表示此学生已经撤销，1可用
	public String getStu_id() {
		return stu_id;
	}
	public void setStu_id(String stuId) {
		stu_id = stuId;
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
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public Date getJoin_time() {
		return join_time;
	}
	public void setJoin_time(Date joinTime) {
		join_time = joinTime;
	}
	public MyClass getMyclass() {
		return myclass;
	}
	public void setMyclass(MyClass myclass) {
		this.myclass = myclass;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}

	
	
}
