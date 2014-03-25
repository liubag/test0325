package com.OnlineGridShop.scattered.Entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
@SuppressWarnings("serial")
@Entity
@Table(name="tb_scattered_accounts")
public class ScatteredGridAccounts implements Serializable {
	@Id
	private String account_id;
	@OneToOne(optional=false,targetEntity=ScatteredGridUser.class,cascade=CascadeType.ALL)
	@JoinColumn(name="ownerid")
	private ScatteredGridUser scatteredGridUser;
	@OneToOne(optional=false,targetEntity=ScatteredGrid.class,cascade=CascadeType.ALL)
	@JoinColumn(name="gridid")
	private ScatteredGrid scatteredGrid;
	@Column(length=30)
	private String rendtype_starttime;
	@Column(length=30)
	private String rendtype_endtime;
	private float hasused_space;
	
	@OneToMany(targetEntity=ScatteredGridAgreement.class,cascade=CascadeType.ALL)
	@JoinColumn(name="account_id")
	List<ScatteredGridAgreement> scatteredGridAgreement_l = new ArrayList<ScatteredGridAgreement>();
	
	public ScatteredGridAccounts(){
		
	}
	
	public ScatteredGridAccounts(String isnew){
		this.account_id = UUID.randomUUID().toString();
	}
	public String getAccount_id() {
		return account_id.toLowerCase();
	}
	public void setAccount_id(String accountId) {
		account_id = accountId;
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
	
	public float getHasused_space() {
		return hasused_space;
	}

	public void setHasused_space(float hasusedSpace) {
		hasused_space = hasusedSpace;
	}

	public List<ScatteredGridAgreement> getScatteredGridAgreement_l() {
		return scatteredGridAgreement_l;
	}

	public void setScatteredGridAgreement_l(
			List<ScatteredGridAgreement> scatteredGridAgreementL) {
		scatteredGridAgreement_l = scatteredGridAgreementL;
	}

	public ScatteredGridUser getScatteredGridUser() {
		return scatteredGridUser;
	}
	public void setScatteredGridUser(ScatteredGridUser scatteredGridUser) {
		this.scatteredGridUser = scatteredGridUser;
	}
	public ScatteredGrid getScatteredGrid() {
		return scatteredGrid;
	}
	public void setScatteredGrid(ScatteredGrid scatteredGrid) {
		this.scatteredGrid = scatteredGrid;
	}

	
	
}
