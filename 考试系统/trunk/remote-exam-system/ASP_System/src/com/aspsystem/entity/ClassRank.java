package com.aspsystem.entity;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
@SuppressWarnings("serial")
@Entity
@Table(name="tb_class_rank")
public class ClassRank implements Serializable {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer class_rank_id;
	private Integer stu_num;  //参加考试人数
	private float avg_score;  //平均数
	private Integer rank;  //排名
	@ManyToOne(optional=false,fetch=FetchType.EAGER,targetEntity=Exam.class)
	@JoinColumn(name="exam_id",nullable=false,updatable=false)
	private Exam exam;  //
	@ManyToOne(optional=false,fetch=FetchType.EAGER,targetEntity=MyClass.class)
	@JoinColumn(name="class_id",nullable=false,updatable=false)
	private MyClass myclass;
	public Integer getClass_rank_id() {
		return class_rank_id;
	}
	public void setClass_rank_id(Integer classRankId) {
		class_rank_id = classRankId;
	}
	public Integer getStu_num() {
		return stu_num;
	}
	public void setStu_num(Integer stuNum) {
		stu_num = stuNum;
	}
	public float getAvg_score() {
		return avg_score;
	}
	public void setAvg_score(float avgScore) {
		avg_score = avgScore;
	}
	public Integer getRank() {
		return rank;
	}
	public void setRank(Integer rank) {
		this.rank = rank;
	}
	public Exam getExam() {
		return exam;
	}
	public void setExam(Exam exam) {
		this.exam = exam;
	}
	public MyClass getMyclass() {
		return myclass;
	}
	public void setMyclass(MyClass myclass) {
		this.myclass = myclass;
	}
	
	
}
