package com.aspsystem.serivce;

import java.util.List;

import com.aspsystem.entity.Admin;

public interface AdminSerivce {
	public boolean changePassword(Admin a,String newpw,String permission_id); 	
	public Admin find(Integer admin_id,String permission_id);
	public String login(String account,String pw);
	
	
	public int findPages(int perFolioAmount,String entityName);  //������ҳ��
	public Long hasNumbers(String entityName);     //���������ݸ���
	public List<?> show_by_page(int page,int perFolioAmount,String entityName);  //����ҳ������
}
