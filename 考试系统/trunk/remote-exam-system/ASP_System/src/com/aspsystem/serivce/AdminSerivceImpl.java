package com.aspsystem.serivce;

import javax.annotation.Resource;

import com.aspsystem.dao.AdminDao;
import com.aspsystem.entity.Admin;
import com.aspsystem.util.MySerivceParent;

public class AdminSerivceImpl extends MySerivceParent implements
	AdminSerivce {
	@Resource
	private AdminDao adminDao;
	private String hql;
	/**
	 * ÐÞ¸ÄÍø¹ÜµÄµÇÂ¼ÃÜÂë
	 */
	public boolean changePassword(Admin a,String newpw,String permission_id) {
		// TODO Auto-generated method stub
		boolean flag=false;
		if(permission_id!=null){
			this.session=getSession();
			hql="from Admin as a where a.admin_id='"+a.getAdmin_id()+"' and a.pw='"+a.getPw()+"'";
			Admin admin =(Admin)adminDao.find(hql, session);
			if(admin!=null){
				admin.setPw(newpw);
				adminDao.save(admin, session);
				flag=true;
			}
		}
		return flag;
	}

	public Admin find(Integer admin_id,String permission_id) {
		// TODO Auto-generated method stub
		if(permission_id!=null){
			this.session=getSession();
			hql="from Admin as a where a.admin_id='"+admin_id+"'";
			return (Admin)adminDao.find(hql, session);
		}else
			return null;
	}

	public String login(String account, String pw) {
		// TODO Auto-generated method stub
		this.session=getSession();
		hql="from Admin as a where a.account='"+account+"' and a.pw='"+pw+"'";
		Admin a=(Admin)adminDao.find(hql, session);
		if(a!=null){
			return "admin_login_success,"+a.getAdmin_id();
		}
		return null;
			
	}
	
	
}
