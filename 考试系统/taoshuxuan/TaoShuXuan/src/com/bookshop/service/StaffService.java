package com.bookshop.service;

import java.util.List;

import com.bookshop.entity.Staff;

/**
 * Ա����ϢService��ӿ�
 * @author Winds
 *
 */
public interface StaffService {
	public Staff find(String staff_id);
	public boolean save(Staff staff);
	public Integer updateState(String staff_id);
	public boolean update(Staff staff);
	public String login(String staff_id,String pw);//Ա����¼
	/**
	 * �޸�Ա������
	 * @param staff_id
	 * @param oldPassword
	 * @param newPassword
	 * @return "oldPasswordWrong" "success" "error"
	 */
	public String changePassword(String staff_id,String oldPassword,String newPassword);
	
//	public Long hasNumbers(String entityName);
//	public int findPages(int perFolioAmount,String entityName);
//	public List<?> show_by_page(int page,int perFolioAmount,String entityName);

	public Long hasNumbers(String entityName,String[] paramName,String[]value,boolean isLike);
	public List<?> show_by_page(int page,int perFolioAmount,String entityName,String[] paramName,String[]value,boolean isLike);

}
