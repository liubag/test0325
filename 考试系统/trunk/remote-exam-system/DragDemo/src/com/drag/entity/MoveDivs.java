package com.drag.entity;

import java.util.Set;
import java.util.UUID;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="tb_MoveDivs")
public class MoveDivs {
	@Id
	@Column(length=40)
	private String moveDivs_id; //UUID
	@Column(length=2000)
	private String div_content;
	@OneToMany(cascade = CascadeType.REMOVE, fetch = FetchType.LAZY,targetEntity=Title.class)
	@JoinColumn(name="moveDivs_id")
	private Set<Title> title;

	public MoveDivs(){}
	
	public MoveDivs(String isnew){
		this.moveDivs_id=UUID.randomUUID().toString();
	}
	

	public String getMoveDivs_id() {
		return moveDivs_id.toLowerCase();
	}

	public void setMoveDivs_id(String moveDivs_id) {
		this.moveDivs_id = moveDivs_id;
	}

	public String getDiv_content() {
		return div_content;
	}
	public void setDiv_content(String div_content) {
		this.div_content = div_content;
	}
	public Set<Title> getTitle() {
		return title;
	}
	public void setTitle(Set<Title> title) {
		this.title = title;
	}
	
	
}
