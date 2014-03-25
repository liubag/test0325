package com.bookshop.service;

import javax.annotation.Resource;

import com.bookshop.dao.AdminDao;
import com.bookshop.entity.Admin;
import com.bookshop.util.CryptoUtils;
import com.bookshop.util.MyServiceParent;
/**
 * 网站管理员信息Service层实现类
 * @author Winds
 *
 */
public class AdminServiceImpl extends MyServiceParent implements AdminService {
	@Resource
	private AdminDao adminDao;
	private String hql;
	public int login(String account, String pw) {
		// TODO Auto-generated method stub
		String pw_k=CryptoUtils.getEncryptPwd(pw);
		this.session=getSession();
		hql="from Admin as a where a.account='"+account+"' and a.pw='"+pw_k+"'";
		Admin a =(Admin)adminDao.find(hql, session);
		if(a!=null)
			return a.getAdmin_id();
		else
			return -1;
	}

}
