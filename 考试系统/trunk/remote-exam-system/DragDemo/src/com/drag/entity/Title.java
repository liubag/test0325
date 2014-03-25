package com.drag.entity;

import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;



@Entity
@Table(name="tb_Title")
public class Title {
	@Id
	@Column(length=40)
	private String title_id; //UUID
	@Column(length=20)
	private String file;
	@Column(length=20)
	private String version;
	@Column(length=10)
	private String div_id; 
	@Column(length=40)
	private String moveDivs_id;
	
	
	public Title(){}
	
	public Title(String isnew){
		this.title_id=UUID.randomUUID().toString();
	}
	public String getTitle_id() {
		if(title_id==null){
			return null;
		}
		return title_id.toLowerCase();
	}
	public void setTitle_id(String title_id) {
		this.title_id = title_id;
	}
	public String getDiv_id() {
		return div_id;
	}
	public void setDiv_id(String div_id) {
		this.div_id = div_id;
	}
	public String getMoveDivs_id() {
		return moveDivs_id;
	}
	public void setMoveDivs_id(String moveDivs_id) {
		this.moveDivs_id = moveDivs_id;
	}
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	public String getVersion() {
		return version;
	}
	public void setVersion(String version) {
		this.version = version;
	}
}
