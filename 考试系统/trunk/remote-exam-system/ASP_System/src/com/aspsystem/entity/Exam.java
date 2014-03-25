package com.aspsystem.entity;
/*
 * 保存考试信息
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
@Table(name="tb_exam")
public class Exam implements Serializable {
	@Id
	@Column(length=40)
	private String exam_id;  //UUID
	@Column(length=60)
	private String exam_name;  //试卷名称
	@Column(length=40)
	private String exam_wordPath;//文件名
	@Column(length=100)
	private String class_id;//规则：class_id01,calss_id02,…
	@Column(length=1600)
	private String ques_id;  //拿题可以通过HQL的 “or“多条拿出直接使用“id01,id02,…“记录
	private Date begin_time;
	private float exam_time; //时间长度
	private Date end_time;
	@ManyToOne(optional=false,fetch=FetchType.EAGER,targetEntity=Course.class)
	@JoinColumn(name="course_id",nullable=false,updatable=false)
	private Course course;  //考试科目
	@ManyToOne(optional=false,fetch=FetchType.EAGER,targetEntity=Teacher.class)
	@JoinColumn(name="teacher_id",nullable=false,updatable=false)
	private Teacher teacher;
	
	public Exam(){
		
	}
	
	public Exam(String isnew){
		exam_id = UUID.randomUUID().toString();
	}

	public String getExam_id() {
		return exam_id.toLowerCase();
	}

	public void setExam_id(String examId) {
		exam_id = examId;
	}

	public String getExam_name() {
		return exam_name;
	}

	public void setExam_name(String examName) {
		exam_name = examName;
	}

	public String getExam_wordPath() {
		return exam_wordPath;
	}

	public void setExam_wordPath(String examWordPath) {
		exam_wordPath = examWordPath;
	}

	public String getClass_id() {
		return class_id;
	}

	public void setClass_id(String classId) {
		class_id = classId;
	}

	public String getQues_id() {
		return ques_id;
	}

	public void setQues_id(String quesId) {
		ques_id = quesId;
	}

	public Date getBegin_time() {
		return begin_time;
	}

	public void setBegin_time(Date beginTime) {
		begin_time = beginTime;
	}

	public float getExam_time() {
		return exam_time;
	}

	public void setExam_time(float examTime) {
		exam_time = examTime;
	}

	public Date getEnd_time() {
		return end_time;
	}

	public void setEnd_time(Date endTime) {
		end_time = endTime;
	}

	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	public Teacher getTeacher() {
		return teacher;
	}

	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}
	
	
	
}
