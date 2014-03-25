package com.aspsystem.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
@SuppressWarnings("serial")
@Entity
@Table(name="tb_teacher")
public class Teacher implements Serializable {
	@Id
	@Column(length=20)
	private String teacher_id;
	@Column(length=30)
	private String name;
	@Column(length=2)
	private String sex;
	@Column(length=30)
	private String pw;
	public String getTeacher_id() {
		return teacher_id;
	}
	public void setTeacher_id(String teacherId) {
		teacher_id = teacherId;
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
	
	
}
