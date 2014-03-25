package com.OnlineGridShop.brand.Entity;

import java.io.Serializable;
import java.util.Date;
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
@Table(name="tb_brandgrid_preferential")
public class BrandgridPreferential implements Serializable {
	@Id
	private String brandgrid_preferential_id;   
	@Column(length=250)
	private String brandgrid_preferential;
	@Column(length=1000)
	private String brandgrid_zk_goodsid;
	@Column(length=2000)
	private String brandgrid_zhekou;
	@Column(length=2)
	private String brandgrid_qcStatus;//ȫ���ۿ۱�־ 1����Ҫ ��0������Ҫ��������ͬʱ��brandgrid_zhekou����
	private float brandgrid_qcZK;  // ȫ���ۿ۶���
	private Date do_time;  //���в���ʱ��
	private Date brandgrid_preferential_sqtime;  //1��2����ʱ��
	private Date brandgrid_preferential_dotime;  
	private Date brandgrid_preferential_outtime;  //����Ϊ��׼��������Ϊ����ʱ��
	private Date brandgrid_preferential_maksuretime;  //5��6����ʱ��
	private Date brandgrid_preferential_uptime;  //7����ʱ��
	private Date brandgrid_preferential_downtime;  //8����ʱ��
	@Column(length=2)
	private String sure_status;   
	/*
	 * 0(�ϴ������ϼ�)
		7�����ϼܣ�
		8�����¼ܣ�

	 */
	@Column(length=2)
	private String brandgrid_preferential_status; 
	/*
	1�������¼ܣ�
	2(�����ϼ�)
	3�������ϼܹ��ڣ�
	4�������¼ܹ��ڣ�
	5�������ϼ�ʧ�ܣ�
	6�������¼�ʧ�ܣ�
	7�����ϼܣ�
	8�����¼ܣ�
	*/
	private Date LZ_datetime; //�ö�ʱ�䣬����ʱ�䣬һ��ʼΪ�ϼ�ʱ��(brandgrid_preferential_uptime)��֮��Ϊ�ö�ʱ��
	
	@ManyToOne(optional=false,fetch=FetchType.LAZY,targetEntity=Brandgrid.class)
	@JoinColumn(name="brandgrid_id",nullable=false,updatable=false)
	private Brandgrid brandgrid;
	@ManyToOne(optional=false,fetch=FetchType.LAZY,targetEntity=BrandgridGridOwner.class)
	@JoinColumn(name="brandgrid_gridowner_id",nullable=false,updatable=false)
	private BrandgridGridOwner brandgridGridOwner;
	
	
    public BrandgridPreferential(){
		
	}
	
	public BrandgridPreferential(String isnew){
		this.brandgrid_preferential_id = UUID.randomUUID().toString();
	}
	public String getBrandgrid_preferential_id() {
		return brandgrid_preferential_id.toLowerCase();
	}
	public void setBrandgrid_preferential_id(String brandgridPreferentialId) {
		brandgrid_preferential_id = brandgridPreferentialId;
	}
	public String getBrandgrid_preferential() {
		return brandgrid_preferential;
	}
	public void setBrandgrid_preferential(String brandgridPreferential) {
		brandgrid_preferential = brandgridPreferential;
	}
	public Date getBrandgrid_preferential_dotime() {
		return brandgrid_preferential_dotime;
	}
	public void setBrandgrid_preferential_dotime(Date brandgridPreferentialDotime) {
		brandgrid_preferential_dotime = brandgridPreferentialDotime;
	}
	public Date getBrandgrid_preferential_outtime() {
		return brandgrid_preferential_outtime;
	}
	public void setBrandgrid_preferential_outtime(Date brandgridPreferentialOuttime) {
		brandgrid_preferential_outtime = brandgridPreferentialOuttime;
	}
	public Date getBrandgrid_preferential_maksuretime() {
		return brandgrid_preferential_maksuretime;
	}
	public void setBrandgrid_preferential_maksuretime(
			Date brandgridPreferentialMaksuretime) {
		brandgrid_preferential_maksuretime = brandgridPreferentialMaksuretime;
	}
	public Date getBrandgrid_preferential_uptime() {
		return brandgrid_preferential_uptime;
	}
	public void setBrandgrid_preferential_uptime(Date brandgridPreferentialUptime) {
		brandgrid_preferential_uptime = brandgridPreferentialUptime;
	}
	public Date getBrandgrid_preferential_downtime() {
		return brandgrid_preferential_downtime;
	}
	public void setBrandgrid_preferential_downtime(
			Date brandgridPreferentialDowntime) {
		brandgrid_preferential_downtime = brandgridPreferentialDowntime;
	}
	public String getBrandgrid_preferential_status() {
		return brandgrid_preferential_status;
	}
	public void setBrandgrid_preferential_status(String brandgridPreferentialStatus) {
		brandgrid_preferential_status = brandgridPreferentialStatus;
	}
	public Brandgrid getBrandgrid() {
		return brandgrid;
	}
	public void setBrandgrid(Brandgrid brandgrid) {
		this.brandgrid = brandgrid;
	}

	
	public BrandgridGridOwner getBrandgridGridOwner() {
		return brandgridGridOwner;
	}

	public void setBrandgridGridOwner(BrandgridGridOwner brandgridGridOwner) {
		this.brandgridGridOwner = brandgridGridOwner;
	}

	public Date getLZ_datetime() {
		return LZ_datetime;
	}

	public void setLZ_datetime(Date lZDatetime) {
		LZ_datetime = lZDatetime;
	}

	public String getBrandgrid_zhekou() {
		return brandgrid_zhekou;
	}

	public void setBrandgrid_zhekou(String brandgridZhekou) {
		brandgrid_zhekou = brandgridZhekou;
	}

	public String getBrandgrid_qcStatus() {
		return brandgrid_qcStatus;
	}

	public void setBrandgrid_qcStatus(String brandgridQcStatus) {
		brandgrid_qcStatus = brandgridQcStatus;
	}

	public float getBrandgrid_qcZK() {
		return brandgrid_qcZK;
	}

	public void setBrandgrid_qcZK(float brandgridQcZK) {
		brandgrid_qcZK = brandgridQcZK;
	}

	public String getBrandgrid_zk_goodsid() {
		return brandgrid_zk_goodsid;
	}

	public void setBrandgrid_zk_goodsid(String brandgridZkGoodsid) {
		brandgrid_zk_goodsid = brandgridZkGoodsid;
	}

	public String getSure_status() {
		return sure_status;
	}

	public void setSure_status(String sureStatus) {
		sure_status = sureStatus;
	}

	public Date getBrandgrid_preferential_sqtime() {
		return brandgrid_preferential_sqtime;
	}

	public void setBrandgrid_preferential_sqtime(Date brandgridPreferentialSqtime) {
		brandgrid_preferential_sqtime = brandgridPreferentialSqtime;
	}

	public Date getDo_time() {
		return do_time;
	}

	public void setDo_time(Date doTime) {
		do_time = doTime;
	}

	
	
}
