package com.OnlineGridShop.audience.Entity;

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
@Table(name="tb_attention")
public class Attention implements Serializable{
	@Id
	@Column(length=40)
	private String attention_id;
	@Column(length=40)
	private String obj_id;
	@ManyToOne(optional=false,fetch=FetchType.LAZY,targetEntity=Audience.class)
	@JoinColumn(name="audience_id",nullable=false,updatable=false)
	private Audience audience;
	private Integer type;  //0:格子  1：商品
	private Integer subType; //0:品牌格子or品牌商品  1：散租格子or散租商品
	private Integer state; //0：未读  1：已读
	
	public Attention(){}
	public Attention(String isnew){
		this.attention_id=UUID.randomUUID().toString();
	}
	public String getAttention_id() {
		return attention_id.toLowerCase();
	}
	public void setAttention_id(String attention_id) {
		this.attention_id = attention_id;
	}
	public String getObj_id() {
		return obj_id.toLowerCase();
	}
	public void setObj_id(String obj_id) {
		this.obj_id = obj_id;
	}

	public Audience getAudience() {
		return audience;
	}
	public void setAudience(Audience audience) {
		this.audience = audience;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	public Integer getSubType() {
		return subType;
	}
	public void setSubType(Integer subType) {
		this.subType = subType;
	}	
	
}
