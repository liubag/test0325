package com.bookshop.service;

import java.util.Date;

import javax.annotation.Resource;

import org.hibernate.Session;

import com.bookshop.dao.StaffDao;
import com.bookshop.entity.Staff;
import com.bookshop.util.CryptoUtils;
import com.bookshop.util.MyServiceParent;
/**
 * Ա����ϢService��ʵ����
 * @author Winds
 *
 */
public class StaffServiceImpl extends MyServiceParent implements StaffService {
	@Resource
	private StaffDao staffDao;
	private Session session;
	private String hql;
	
	/*
	 * ����idΪstaff_id��Ա��
	 * @see com.bookshop.service.StaffService#find(java.lang.String)
	 */
	public Staff find(String staff_id) {
		// TODO Auto-generated method stub
		Staff staff=null;
		session = getSession();
		hql="from Staff as s where s.staff_id='"+staff_id+"'";
		if(staffDao.find(hql, session)!=null){
			staff=(Staff)staffDao.find(hql, session);
		}
		return staff;
	}
	public String login(String staff_id,String pw){
		Staff staff = null;
		this.session = getSession();
		String EncryptPw = CryptoUtils.getEncryptPwd(pw);
		hql = "from Staff as s where s.staff_id ='"+staff_id+"'"+" and s.pw = '"+EncryptPw+"'" + "and s.status = 1";
		staff=(Staff)staffDao.find(hql, session);
		if(staff !=null){
			return "success";
		}
		else{
			return null;
		}
		
	}
	/**
	 * ʵ�����Ա������
	 * 
	 */
	public boolean save(Staff staff) {
		// TODO Auto-generated method stub
		session = getSession();
		staffDao.save(staff, session);
		return true;
	}

	/**
	 * �л�Ա��״̬
	 */
	public Integer updateState(String staff_id) {
		// TODO Auto-generated method stub
		session = getSession();
		hql="from Staff as s where s.staff_id='"+staff_id+"'";
		Staff staff=(Staff)staffDao.find(hql, session);
		if(staff!=null){
			if(staff.getStatus()==1){
				staff.setStatus(0);
				staff.setRemove_date(new Date());
			}else if(staff.getStatus()==0){
				staff.setStatus(1);
				staff.setRemove_date(null);
			}			
			staffDao.update(staff, session);
			return staff.getStatus();
		}else
			return -1;
	}

	/**
	 * �޸�Ա����Ϣ
	 */
	public boolean update(Staff staff) {
		// TODO Auto-generated method stub
		session = getSession();
		hql="from Staff as s where s.staff_id='"+staff.getStaff_id()+"'";
		Staff newStaff=(Staff)staffDao.find(hql, session);
		if(newStaff!=null){
			newStaff.setPhone(staff.getPhone());
			newStaff.setAddress(staff.getAddress());
			staffDao.update(newStaff, session);
		}
		return true;
	}
	/**
	 * �޸�Ա������
	 */
	public String changePassword(String staff_id,String oldPassword,String newPassword){
		session = getSession();
		Staff staff = find(staff_id);
		if(staff != null){
			if(staff.getPw().equals(oldPassword)){
				 staff.setPw(newPassword);
				 staffDao.update(staff, session);
				 return "success";
			}else{
				return "oldPasswordWrong";
			}
		}
		return "error";
	}
	
	
}
