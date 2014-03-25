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
	 * 包冲突
	 * 
	 java.lang.NoSuchMethodError: javax.persistence.OneToMany.orphanRemoval()Z

      出现这种异常通常是由于Myeclipse的版本较低，与Hibernate等自带的JPA出现了冲突，

      解决的办法就是将javaee.jar包中的persistence文件夹删除就行了。 到myelcpse目录下查找 javaee.jar文件，RAR打开并删除persistence为文件夹
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
