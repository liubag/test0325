package com.aspsystem.entity;
/*
 * 保存试题库信息
 * 
 */
import java.io.Serializable;
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
@Table(name="tb_questions")
public class Questions implements Serializable {
	@Id
	@Column(length=40)
	private String ques_id;  //UUID
	@ManyToOne(optional=false,fetch=FetchType.EAGER,targetEntity=Course.class)
	@JoinColumn(name="course_id",nullable=false,updatable=false)
	private Course course;
	private Integer type;  //题目类型 分为：1.单选，2.多选，3.不定项
	@Column(length=400)
	private String topic;  //题目
	@Column(length=200)
	private String options;//规则：A.xxxx;B.xxx;
	@Column(length=10)
	private String  answer;
	@Column(length=400)
	private String analysis;  //解释
	@ManyToOne(optional=false,fetch=FetchType.EAGER,targetEntity=Teacher.class)
	@JoinColumn(name="teacher_id",nullable=false,updatable=false)
	private Teacher teacher;
	
	public Questions(){
		
	}
	
	public Questions(String isnew){
		ques_id = UUID.randomUUID().toString();
	}
	
	public String getQues_id() {
		return ques_id.toLowerCase();  //注意这里要全部制小写
	}
	public void setQues_id(String quesId) {
		ques_id = quesId;
	}
	public Course getCourse() {
		return course;
	}
	public void setCourse(Course course) {
		this.course = course;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public String getTopic() {
		return topic;
	}
	public void setTopic(String topic) {
		this.topic = topic;
	}
	public String getOptions() {
		return options;
	}
	public void setOptions(String options) {
		this.options = options;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getAnalysis() {
		return analysis;
	}
	public void setAnalysis(String analysis) {
		this.analysis = analysis;
	}
	public Teacher getTeacher() {
		return teacher;
	}
	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}
	
	
}
