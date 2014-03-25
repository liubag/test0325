package com.bookshop.action;

import java.util.Map;

import javax.annotation.Resource;

import com.bookshop.entity.Admin;
import com.bookshop.service.AdminService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
/**
 * ��վ����ԱAction��
 * @author Winds
 *
 */

@SuppressWarnings("serial")
public class AdminAction extends ActionSupport{
	@Resource
	private AdminService adminService;
	private Map<String,Object> session;
	private Admin admin;
	
	/**
	 * ��¼
	 * @return
	 */
	public String login(){
		int isLogin=adminService.login(admin.getAccount(), admin.getPw());
		if(isLogin!=-1){
			session=ActionContext.getContext().getSession();
			session.put("admin_id",isLogin);
			session.put("admin_account", admin.getAccount());
			return SUCCESS;
		}
		return LOGIN;
	}
	/**
	 * ��ȫ�˳�
	 * @return
	 */
	public String logout(){
		session=ActionContext.getContext().getSession();
		if(session.get("admin_account")!=null){
			session.remove("admin_account");
		}
		if(session.get("admin_id")!=null){
			session.remove("admin_id");
		}
		return SUCCESS;
	}
	public void setAdmin(Admin admin) {
		this.admin = admin;
	}

	public Admin getAdmin() {
		return admin;
	}
}
