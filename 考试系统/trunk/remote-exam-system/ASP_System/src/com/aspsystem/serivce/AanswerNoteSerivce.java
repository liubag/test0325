package com.aspsystem.serivce;

import java.util.List;

import com.aspsystem.entity.AanswerNote;


public interface AanswerNoteSerivce {
	public boolean save(AanswerNote aanswerNote,String permission_id);
	public AanswerNote find(String note_id,String permission_id);
	public AanswerNote find(String exam_id,String stu_id,String permission_id);
	
	public int findPages(int perFolioAmount,String entityName);  //返回总页数
	public Long hasNumbers(String entityName);     //返回总数据个数
	public List<?> show_by_page(int page,int perFolioAmount,String entityName);  //根据页数遍历
}
