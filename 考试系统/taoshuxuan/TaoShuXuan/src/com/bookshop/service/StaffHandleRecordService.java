package com.bookshop.service;

import java.util.List;

/**
 * Ա�������Ա�������˻������¼��ϢService��ӿ�
 * @author Winds
 *
 */
public interface StaffHandleRecordService {
	//����Ա�������¼
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
//	//����Ա��id��ʾ
	public List<?> show_by_page(int page, int perFolioAmount, String staffId);
	public Long hasNumbers(String entityName,String[] paramName,String[]value,boolean isLike);
	public List<?> show_by_page(int page,int perFolioAmount,String entityName,String[] paramName,String[]value,boolean isLike);
	
	//����ʱ����Ѳ��õ�ҳ������
	public Long hasNumbers(String entityName,String timeParam,String begin ,String end,String parm,String value);
	//����ҳ������
	public List<?> show_by_page(int page,int perFolioAmount,String entityName,String timeParam,String begin ,String end,String parm,String value);
	
	
}
