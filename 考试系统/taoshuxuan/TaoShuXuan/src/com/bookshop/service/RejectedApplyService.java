package com.bookshop.service;

import java.util.List;

import com.bookshop.entity.RejectedApply;

/**
 * 会员退货申请信息Service层接口
 * @author Winds
 *
 */
public interface RejectedApplyService {
	public void audit_rejectedApply(String staff_id,String rejected_apply_id, int isPass);//审核退货申请
	public void complete_rejectedApply(String staff_id,String rejected_apply_id);//确认收货完成交易
	public int findPages(int perFolioAmount,String entityName);  //返回总页数
	public RejectedApply find(String rejected_apply_id);
	public Long hasNumbers(String entityName,String[] paramName,String[]value,boolean isLike); // 返回总个数
	//根据页数遍历
	public List<?> show_by_page(int page,int perFolioAmount,String entityName,String[] paramName,String[]value,boolean isLike);
	//根据时间段搜查用的页数遍历
	public Long hasNumbers(String entityName,String timeParam,String begin ,String end,String parm,String value);
	//根据页数遍历
	public List<?> show_by_page(int page,int perFolioAmount,String entityName,String timeParam,String begin ,String end,String parm,String value);
	
}
