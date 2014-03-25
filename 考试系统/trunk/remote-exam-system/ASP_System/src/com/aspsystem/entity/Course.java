package com.aspsystem.entity;
/*
 * 保存科目的信息
 */
import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@SuppressWarnings("serial")
@Entity
@Table(name="tb_course")
public class Course implements Serializable {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer course_id;
	@Column(length=40)
	private String  course_name;
	public Integer getCourse_id() {
		return course_id;
	}
	public void setCourse_id(Integer courseId) {
		course_id = courseId;
	}
	public String getCourse_name() {
		return course_name;
	}
	public void setCourse_name(String courseName) {
		course_name = courseName;
	}
	

	
	
}
