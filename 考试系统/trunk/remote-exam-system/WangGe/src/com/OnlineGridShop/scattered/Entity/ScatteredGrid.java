package com.OnlineGridShop.scattered.Entity;

import java.io.Serializable;
import java.util.Date;
import java.util.UUID;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
@SuppressWarnings("serial")
@Entity
@Table(name="tb_scattered_grid")
public class ScatteredGrid implements Serializable {
	@Id
	private String gridid;
	private String owner_id;
	@OneToOne(optional=false,targetEntity=ScatteredGridAgreement.class,cascade=CascadeType.ALL)
	@JoinColumn(name="agreement_id")
	private ScatteredGridAgreement scatteredGridAgreement;
	private Integer gridtype_id;
	private Date LZ_time;  //每次登陆时都会判断，今天未更新，则更新可“置顶”次数
	private Integer LZ_note;//每天可剩余置顶的次数
	private Integer LZ_preferential;  //每天可以置顶优惠次数，为1次
	@Column(length=30)
	private String grid_name;
	private float rendtype_evaluation;  //评价
	private String scattered_preferential_id;   //优惠信息
	@Temporal(TemporalType.DATE)
	private Date preferential_do_time;
	private String status;   //1（正常）0（注销）,2(可修改状态：未过注册那天为准线)
	
	public ScatteredGrid(){

	}
	
	
	public ScatteredGrid(String isnew){
		this.gridid = UUID.randomUUID().toString();
	}
	
	public float getRendtype_evaluation() {
		return rendtype_evaluation;
	}
	public void setRendtype_evaluation(float rendtypeEvaluation) {
		rendtype_evaluation = rendtypeEvaluation;
	}
	

	
	
	public String getGridid() {
		return gridid.toLowerCase();
	}
	public void setGridid(String gridid) {
		this.gridid = gridid;
	}
	public String getOwner_id() {
		return owner_id.toLowerCase();
	}
	public void setOwner_id(String ownerId) {
		owner_id = ownerId;
	}
	public String getScattered_preferential_id() {
		return scattered_preferential_id;
	}
	public void setScattered_preferential_id(String scatteredPreferentialId) {
		scattered_preferential_id = scatteredPreferentialId;
	}
	
	public ScatteredGridAgreement getScatteredGridAgreement() {
		return scatteredGridAgreement;
	}


	public void setScatteredGridAgreement(
			ScatteredGridAgreement scatteredGridAgreement) {
		this.scatteredGridAgreement = scatteredGridAgreement;
	}


	public String getGrid_name() {
		return grid_name;
	}
	public void setGrid_name(String gridName) {
		grid_name = gridName;
	}
	
	public Date getPreferential_do_time() {
		return preferential_do_time;
	}
	public void setPreferential_do_time(Date preferentialDoTime) {
		preferential_do_time = preferentialDoTime;
	}


	public Integer getGridtype_id() {
		return gridtype_id;
	}


	public void setGridtype_id(Integer gridtypeId) {
		gridtype_id = gridtypeId;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public Date getLZ_time() {
		return LZ_time;
	}


	public void setLZ_time(Date lZTime) {
		LZ_time = lZTime;
	}


	public Integer getLZ_note() {
		return LZ_note;
	}


	public void setLZ_note(Integer lZNote) {
		LZ_note = lZNote;
	}


	public Integer getLZ_preferential() {
		return LZ_preferential;
	}


	public void setLZ_preferential(Integer lZPreferential) {
		LZ_preferential = lZPreferential;
	}

	 
	
}
