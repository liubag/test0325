package com.bookshop.service;

import javax.annotation.Resource;

import org.hibernate.Session;
import com.bookshop.dao.RejectedApplyDao;
import com.bookshop.entity.Order;
import com.bookshop.entity.RejectedApply;
import com.bookshop.util.MyServiceParent;
/**
 * 会员退货申请信息Service层实现类
 * @author Winds
 *
 */
public class RejectedApplyServiceImpl extends MyServiceParent implements
		RejectedApplyService {
	@Resource
	private RejectedApplyDao rejectedApplyDao;
	@Resource
	private StaffHandleRecordService staffHandleRecordService;
	private Session session ;
	private String hql;
	/*
	 * 审核退货申请
	 */
	
	public void audit_rejectedApply(String staff_id,String rejected_apply_id, int isPass) {
		// TODO Auto-generated method stub
		this.session = getSession();
		hql = "from RejectedApply as rejectedApply where rejectedApply.rejected_apply_id='"+rejected_apply_id+"'";
		RejectedApply rejectedApply = (RejectedApply)rejectedApplyDao.find(hql, session);
		int before_handle_status =  rejectedApply.getStatus();
		if(isPass == 1)
			rejectedApply.setStatus(1);
		else if(isPass == 0)
			rejectedApply.setStatus(2);
		rejectedApplyDao.update(rejectedApply, session);
		int after_handle_status = rejectedApply.getStatus();
		staffHandleRecordService.addStaffHandleRecord(2, staff_id,rejected_apply_id , before_handle_status, after_handle_status);
	}

	public void complete_rejectedApply(String staff_id,String rejected_apply_id) {
		this.session = getSession();
		hql = "from RejectedApply as rejectedApply where rejectedApply.rejected_apply_id='"+rejected_apply_id+"'";
		RejectedApply rejectedApply = (RejectedApply)rejectedApplyDao.find(hql, session);
		int before_handle_status =  rejectedApply.getStatus();
		rejectedApply.setStatus(3);
		rejectedApplyDao.update(rejectedApply, session);
		int after_handle_status = rejectedApply.getStatus();
		staffHandleRecordService.addStaffHandleRecord(2, staff_id,rejected_apply_id , before_handle_status, after_handle_status);
	}
	public RejectedApply find(String rejected_apply_id){
		this.session = getSession();
		hql = "from RejectedApply as r where r.rejected_apply_id = '"+rejected_apply_id+"'";
		RejectedApply rejectedApply = (RejectedApply)rejectedApplyDao.find(hql, session);
		return rejectedApply;
	}
	
}
