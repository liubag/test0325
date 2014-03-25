package com.bookshop.service;

import java.util.List;

import com.bookshop.entity.RejectedApply;

/**
 * ��Ա�˻�������ϢService��ӿ�
 * @author Winds
 *
 */
public interface RejectedApplyService {
	public void audit_rejectedApply(String staff_id,String rejected_apply_id, int isPass);//����˻�����
	public void complete_rejectedApply(String staff_id,String rejected_apply_id);//ȷ���ջ���ɽ���
	public int findPages(int perFolioAmount,String entityName);  //������ҳ��
	public RejectedApply find(String rejected_apply_id);
	public Long hasNumbers(String entityName,String[] paramName,String[]value,boolean isLike); // �����ܸ���
	//����ҳ������
	public List<?> show_by_page(int page,int perFolioAmount,String entityName,String[] paramName,String[]value,boolean isLike);
	//����ʱ����Ѳ��õ�ҳ������
	public Long hasNumbers(String entityName,String timeParam,String begin ,String end,String parm,String value);
	//����ҳ������
	public List<?> show_by_page(int page,int perFolioAmount,String entityName,String timeParam,String begin ,String end,String parm,String value);
	
}
