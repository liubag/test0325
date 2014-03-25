package com.OnlineGridShop.scattered.Entity;

import java.io.Serializable;
import java.util.Date;
import java.util.UUID;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
@SuppressWarnings("serial")
@Entity
@Table(name="tb_scattered_agreement")
public class ScatteredGridAgreement implements Serializable {
	@Id
	private String agreement_id;
	@ManyToOne(optional=false,targetEntity=GridType.class,cascade=CascadeType.ALL)
	@JoinColumn(name="gridtype_id")
	private GridType gridType;
	private String account_id;
	@Column(length=30)
	private String type_called;
	private Integer months;
	private Integer unitprice;
	private float rendtype_agio;  //折扣
	@Column(length=30)
	private String rendtype_starttime;
	@Temporal(TemporalType.DATE)
	private Date nochangtime1;
	@Temporal(TemporalType.DATE)
	private Date nochangtime;
	@Column(length=30)
	private String rendtype_endtime;
	@Column(length=30)
	private String logout_time; //退租时间
	private Integer consume_month; //消费月数
	private float consume; //消费
	private float rendtype_totalprice;//总费用
	@Column(length=2)
	private String account_status;  //1（正常）0（注销）,2(可修改状态：未过注册那天为准线)
	
	public ScatteredGridAgreement(){
		
	}
	public ScatteredGridAgreement(String isnew){
		this.agreement_id = UUID.randomUUID().toString();
	}
	
	public String getAgreement_id() {
		return agreement_id.toLowerCase();
	}
	public void setAgreement_id(String agreementId) {
		agreement_id = agreementId;
	}
	
	public String getType_called() {
		return type_called;
	}
	public void setType_called(String typeCalled) {
		type_called = typeCalled;
	}
	public Integer getMonths() {
		return months;
	}
	public void setMonths(Integer months) {
		this.months = months;
	}
	public float getRendtype_agio() {
		return rendtype_agio;
	}
	public void setRendtype_agio(float rendtypeAgio) {
		rendtype_agio = rendtypeAgio;
	}
	public String getRendtype_starttime() {
		return rendtype_starttime;
	}
	public void setRendtype_starttime(String rendtypeStarttime) {
		rendtype_starttime = rendtypeStarttime;
	}
	public String getRendtype_endtime() {
		return rendtype_endtime;
	}
	public void setRendtype_endtime(String rendtypeEndtime) {
		rendtype_endtime = rendtypeEndtime;
	}
	public String getLogout_time() {
		return logout_time;
	}
	public void setLogout_time(String logoutTime) {
		logout_time = logoutTime;
	}
	
	public float getConsume() {
		return consume;
	}
	public void setConsume(float consume) {
		this.consume = consume;
	}
	public float getRendtype_totalprice() {
		return rendtype_totalprice;
	}
	public void setRendtype_totalprice(float rendtypeTotalprice) {
		rendtype_totalprice = rendtypeTotalprice;
	}
	public String getAccount_status() {
		return account_status;
	}
	public void setAccount_status(String accountStatus) {
		account_status = accountStatus;
	}
	
	
	public Integer getConsume_month() {
		return consume_month;
	}
	public void setConsume_month(Integer consumeMonth) {
		consume_month = consumeMonth;
	}
	
	public String getAccount_id() {
		return account_id;
	}
	public void setAccount_id(String accountId) {
		account_id = accountId;
	}
	public GridType getGridType() {
		return gridType;
	}
	public void setGridType(GridType gridType) {
		this.gridType = gridType;
	}
	public Integer getUnitprice() {
		return unitprice;
	}
	public void setUnitprice(Integer unitprice) {
		this.unitprice = unitprice;
	}
	public Date getNochangtime() {
		return nochangtime;
	}
	public void setNochangtime(Date nochangtime) {
		this.nochangtime = nochangtime;
	}
	public Date getNochangtime1() {
		return nochangtime1;
	}
	public void setNochangtime1(Date nochangtime1) {
		this.nochangtime1 = nochangtime1;
	}

	
}
