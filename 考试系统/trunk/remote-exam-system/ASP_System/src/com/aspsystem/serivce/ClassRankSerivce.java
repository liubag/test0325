package com.aspsystem.serivce;

import java.util.List;

import com.aspsystem.entity.ClassRank;

public interface ClassRankSerivce {
	public boolean dele(Integer class_rank_id,String permission_id);
	public boolean save(ClassRank classRank,String permission_id);
	public boolean update(ClassRank classRank,String permission_id);
	public ClassRank find(Integer class_rank_id,String permission_id);
	public ClassRank find(String exam_id,String class_id,String permission_id);
	public List<?> find(String exam_id,String permission_id);
	public boolean rankExam(String exam_id,String permission_id);
	public int findPages(int perFolioAmount,String entityName);  //������ҳ��
	public Long hasNumbers(String entityName);     //���������ݸ���
	public List<?> show_by_page(int page,int perFolioAmount,String entityName);  //����ҳ������
}
