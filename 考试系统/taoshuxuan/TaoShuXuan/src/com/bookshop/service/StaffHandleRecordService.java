package com.bookshop.service;

import java.util.List;

/**
 * 员工处理会员订单和退货申请记录信息Service层接口
 * @author Winds
 *
 */
public interface StaffHandleRecordService {
	//增加员工处理记录
	public void addStaffHandleRecord(int handle_type,String staff_id,String orderOrRejectedApply_id,int before_handle_status,int after_handle_status );
	
//	public Long hasNumbers(int status);
	public Long hasNumbers(String staffId);
//	
//	public int findPages(int perFolioAmount,int status);
//	public List<?> show_by_page(int page,int perFolioAmount,int status);
//	
//	public Long hasNumbers(String staffId,int status);
//	public int findPages(int perFolioAmount,String staffId,int status);
//	public List<?> show_by_page(int page,int perFolioAmount,String staffId,int status);
//	//根据员工id显示
	public List<?> show_by_page(int page, int perFolioAmount, String staffId);
	public Long hasNumbers(String entityName,String[] paramName,String[]value,boolean isLike);
	public List<?> show_by_page(int page,int perFolioAmount,String entityName,String[] paramName,String[]value,boolean isLike);
	
	//根据时间段搜查用的页数遍历
	public Long hasNumbers(String entityName,String timeParam,String begin ,String end,String parm,String value);
	//根据页数遍历
	public List<?> show_by_page(int page,int perFolioAmount,String entityName,String timeParam,String begin ,String end,String parm,String value);
	
	
}
