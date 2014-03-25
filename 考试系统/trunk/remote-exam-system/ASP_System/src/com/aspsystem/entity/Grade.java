package com.aspsystem.entity;
/*
 * 保存试题库信息
 * 
 */
import java.io.Serializable;
import java.util.Date;
import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
@SuppressWarnings("serial")
@Entity
@Table(name="tb_grade")
public class Grade implements Serializable {
	@Id
	@Column(length=40)
	private String grade_id;  //UUID
	private Integer grade;  //分数
	private Date join_time;
	@ManyToOne(optional=false,fetch=FetchType.EAGER,targetEntity=Exam.class)
	@JoinColumn(name="exam_id",nullable=false,updatable=false)
	private Exam exam;  //
	@ManyToOne(optional=false,fetch=FetchType.EAGER,targetEntity=Student.class)
	@JoinColumn(name="stu_id",nullable=false,updatable=false)
	private Student stu;
	
	public Grade(){
		
	}
	
	public Grade(String isnew){
		grade_id = UUID.randomUUID().toString();
	}

	public String getGrade_id() {
		return grade_id.toLowerCase();
	}

	public void setGrade_id(String gradeId) {
		grade_id = gradeId;
	}

	public Integer getGrade() {
		return grade;
	}

	public void setGrade(Integer grade) {
		this.grade = grade;
	}

	public Date getJoin_time() {
		return join_time;
	}

	public void setJoin_time(Date joinTime) {
		join_time = joinTime;
	}

	public Exam getExam() {
		return exam;
	}

	public void setExam(Exam exam) {
		this.exam = exam;
	}

	public Student getStu() {
		return stu;
	}

	public void setStu(Student stu) {
		this.stu = stu;
	}

	
	
}
