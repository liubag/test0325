package com.aspsystem.entity;
/*
 *答卷答案记录
 * 
 */
import java.io.Serializable;
import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
@SuppressWarnings("serial")
@Entity
@Table(name="tb_answer_note")
public class AanswerNote implements Serializable {
	@Id
	@Column(length=40)
	private String note_id;  //UUID
	@Column(length=40)
	private String exam_id;  
	@Column(length=40)
	private String stu_id;
	@Column(length=400)
	private String answer;//规则：class_id01,calss_id02,…
	public AanswerNote(){
		note_id = UUID.randomUUID().toString();
	}
	public AanswerNote(String isnew){
		
	}
	
	public String getNote_id() {
		return note_id.toLowerCase();
	}
	public void setNote_id(String noteId) {
		note_id = noteId;
	}
	public String getExam_id() {
		return exam_id;
	}
	public void setExam_id(String examId) {
		exam_id = examId;
	}
	public String getStu_id() {
		return stu_id;
	}
	public void setStu_id(String stuId) {
		stu_id = stuId;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	
}
