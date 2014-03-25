package com.aspsystem.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
@SuppressWarnings("serial")
@Entity
@Table(name="tb_class")
public class MyClass implements Serializable {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer class_id;
	@Column(length=30)
	private String class_name;
	@OneToMany(mappedBy="myclass",cascade = CascadeType.REMOVE, fetch = FetchType.EAGER)
//	@JoinColumn(name="stu_id")
	private List<Student> student;
	
	/* Caused by: java.lang.NoSuchMethodError: javax.persistence.OneToMany.orphanRemoval()Z
	 * 
	 * ����ͻ
	 * 
	 java.lang.NoSuchMethodError: javax.persistence.OneToMany.orphanRemoval()Z

      ���������쳣ͨ��������Myeclipse�İ汾�ϵͣ���Hibernate���Դ���JPA�����˳�ͻ��

      ����İ취���ǽ�javaee.jar���е�persistence�ļ���ɾ�������ˡ� ��myelcpseĿ¼�²��� javaee.jar�ļ���RAR�򿪲�ɾ��persistenceΪ�ļ���
	 * 
	 */
	 
	
	public Integer getClass_id() {
		return class_id;
	}
	public void setClass_id(Integer class_id) {
		this.class_id = class_id;
	}
	public String getClass_name() {
		return class_name;
	}
	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}
	public List<Student> getStudent() {
		return student;
	}
	public void setStudent(List<Student> student) {
		this.student = student;
	}
	
}
