package com.aspsystem.serivce;

import java.util.List;

import com.aspsystem.entity.AanswerNote;


public interface AanswerNoteSerivce {
	public boolean save(AanswerNote aanswerNote,String permission_id);
	public AanswerNote find(String note_id,String permission_id);
	public AanswerNote find(String exam_id,String stu_id,String permission_id);
	
	public int findPages(int perFolioAmount,String entityName);  //������ҳ��
	public Long hasNumbers(String entityName);     //���������ݸ���
	public List<?> show_by_page(int page,int perFolioAmount,String entityName);  //����ҳ������
}
