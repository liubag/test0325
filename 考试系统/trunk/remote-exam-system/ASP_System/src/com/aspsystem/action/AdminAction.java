package com.aspsystem.action;

import java.util.Map;

import javax.annotation.Resource;

import com.aspsystem.entity.Admin;
import com.aspsystem.serivce.AdminSerivce;
import com.aspsystem.util.MyStringAppConfigs;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings({"serial"})
public class AdminAction extends  ActionSupport{
	
	@Resource
	private AdminSerivce adminSerivce;			
	private Admin admin;
	private String account;
	private String pw;
	private Map<String,Object> session;
	private String permission_id;
	private MyStringAppConfigs myStringAppConfigs;  
	private String tip;	
	private boolean isChangePassword=false;
	private String isTologin;
	public String login(){
		try{			
			permission_id=adminSerivce.login(account,pw);
			session=ActionContext.getContext().getSession();	
			System.out.println(permission_id);
			if(permission_id!=null){				
				session.put("admin_permission", permission_id);							
				session.put("adminInfo", account);				
				return SUCCESS;
			}	
			else{
				isTologin=new String("µÇÂ¼Ê§°Ü");				
				return INPUT;
			}
				
		}catch(Exception e){
			e.printStackTrace();
			return INPUT;
		}		
	}
	public String changePassword(){
		try {
			isChangePassword=true;
			String flag="";
			tip="";
			session=ActionContext.getContext().getSession();
			permission_id=(String) session.get("admin_permission");
			if(adminSerivce.changePassword(admin, pw, permission_id)){
				myStringAppConfigs=MyStringAppConfigs.change_password_success;
				flag="success";
			}else{
				myStringAppConfigs=MyStringAppConfigs.change_password_fail;
				flag="fail";
			}
			tip=myStringAppConfigs.getValue();
			
			return flag;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			tip=e.getMessage();
			e.printStackTrace();
			return "fail";
		}
	}
	
	public String logout(){
		session=ActionContext.getContext().getSession();
		session.clear();
		if(isChangePassword){
			session.put("isChangePassword", isChangePassword);
			isChangePassword=false;
			return "success1";
		}
		return "success";
	}

	public void setTip(String tip) {
		this.tip = tip;
	}
	public String getTip() {
		return tip;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public Admin getAdmin() {
		return admin;
	}
	public void setAdmin(Admin admin) {
		this.admin = admin;
	}
	public String getIsTologin() {
		return isTologin;
	}
	public void setIsTologin(String isTologin) {
		this.isTologin = isTologin;
	}
	
}
