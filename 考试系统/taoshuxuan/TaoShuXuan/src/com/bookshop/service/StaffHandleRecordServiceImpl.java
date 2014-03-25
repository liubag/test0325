package com.bookshop.service;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Session;

import com.bookshop.dao.StaffHandleRecordDao;
import com.bookshop.entity.Order;
import com.bookshop.entity.RejectedApply;
import com.bookshop.entity.Staff;
import com.bookshop.entity.StaffHandleRecord;
import com.bookshop.util.MyServiceParent;
/**
 * 员工处理会员订单和退货申请记录信息Service层实现类
 * @author Winds
 *
 */
public class StaffHandleRecordServiceImpl extends MyServiceParent implements
		StaffHandleRecordService {
	@Resource
	private StaffHandleRecordDao staffHandleRecordDao;

	private String hql;
	private Session session;
	/**
	 * 增加员工处理记录
	 */
	public void addStaffHandleRecord(int handle_type,String staff_id,String orderOrRejectedApply_id,int before_handle_status,int after_handle_status ){
		this.session = getSession();
		try{
		StaffHandleRecord staffHandleRecord = new StaffHandleRecord("sb");
		staffHandleRecord.setHandle_date(new Date());
		staffHandleRecord.setHandle_type(handle_type);
		hql = "from Staff as s where s.staff_id = '"+staff_id+"'";
		Staff staff = (Staff)staffHandleRecordDao.find(hql, session);
		staffHandleRecord.setStaff(staff);
		if(handle_type == 1){
			hql = "from Order as o where o.order_id = '"+orderOrRejectedApply_id+"'";
			Order order = (Order)staffHandleRecordDao.find(hql,session);
			staffHandleRecord.setOrder(order);
		}else if(handle_type == 2){
			hql = "from RejectedApply as r where r.rejected_apply_id = '"+orderOrRejectedApply_id+"'";
			RejectedApply rejectedApply = (RejectedApply)staffHandleRecordDao.find(hql, session);
			staffHandleRecord.setRejectedApply(rejectedApply);
		}
		staffHandleRecord.setBefore_handle_status(before_handle_status);
		staffHandleRecord.setAfter_handle_status(after_handle_status);
		System.out.print("save--------.");
		staffHandleRecordDao.save(staffHandleRecord, session);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	
	/*
	 * //返回总页数
	 */
	public int findPages(int perFolioAmount, int status) {
		// TODO Auto-generated method stub
		this.session=this.getSession();	
		int pagenum;
		String hql;
		hql="select count(*) from StaffHandleRecord as shr where shr.handle_type="+status;
		Long num1 = myDaoParent.findCount_all(session, hql);
		int num = num1.intValue();
		pagenum = num/perFolioAmount;
		num = num%perFolioAmount;
		if(num>0){
			pagenum++;
		}
		return pagenum;
	}
	
	/*
	 * //返回总数据个数
	 */
	public Long hasNumbers(int status) {
		// TODO Auto-generated method stub
		this.session=this.getSession();	
		String hql;
		hql="select count(*) from StaffHandleRecord as shr where shr.handle_type="+status;
		return myDaoParent.findCount_all(session, hql);
	}
	public Long hasNumbers(String staff_id){
		this.session=this.getSession();	
		hql="select count(*) from StaffHandleRecord as shr where shr.staff='"+staff_id+"'";
		return myDaoParent.findCount_all(session, hql);
	}
	public List<?> show_by_page(int page, int perFolioAmount, int status) {
		// TODO Auto-generated method stub
		this.session=this.getSession();	
		String hql;
		hql="from StaffHandleRecord as shr where shr.handle_type='"+status+"' order by shr.handle_date ASC";	
		return myDaoParent.show_by_page_all( page, perFolioAmount, session, hql);
	}
	
	
	/*
	 *
	 * //根据页数遍历
	 */
	public int findPages(int perFolioAmount, String staffId,int status) {
		// TODO Auto-generated method stub
		this.session=this.getSession();	
		int pagenum;
		String hql;
		hql="select count(*) from StaffHandleRecord as shr where shr.handle_type='"+status+"' and shr.staff.staff_id='"+staffId+"'";
		Long num1 = myDaoParent.findCount_all(session, hql);
		int num = num1.intValue();
		pagenum = num/perFolioAmount;
		num = num%perFolioAmount;
		if(num>0){
			pagenum++;
		}
		return pagenum;
	}
	public Long hasNumbers(String staffId,int status) {
		// TODO Auto-generated method stub
		this.session=this.getSession();	
		String hql;
		hql="select count(*) from StaffHandleRecord as shr where shr.handle_type='"+status+"' and shr.staff.staff_id='"+staffId+"'";
		return myDaoParent.findCount_all(session, hql);
	}
	
	public List<?> show_by_page(int page, int perFolioAmount, String staffId){
		this.session=this.getSession();	
		String hql;
		hql="from StaffHandleRecord as shr where shr.staff.staff_id='"+staffId+"' order by shr.handle_date ASC";	
		return myDaoParent.show_by_page_all( page, perFolioAmount, session, hql);
	}
	public List<?> show_by_page(int page, int perFolioAmount, String staffId,int status) {
		// TODO Auto-generated method stub
		this.session=this.getSession();	
		String hql;
		hql="from StaffHandleRecord as shr where shr.handle_type='"+status+"' and shr.staff.staff_id='"+staffId+"' order by shr.handle_date ASC";	
		return myDaoParent.show_by_page_all( page, perFolioAmount, session, hql);
	}
}
