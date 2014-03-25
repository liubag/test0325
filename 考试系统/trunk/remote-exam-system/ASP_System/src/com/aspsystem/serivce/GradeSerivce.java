package com.aspsystem.serivce;

import java.util.List;

import com.aspsystem.entity.Exam;
import com.aspsystem.entity.Grade;
import com.aspsystem.entity.Student;

public interface GradeSerivce {
	public boolean save(Grade grade,String permission_id);
	public Grade find(String grade_id,String permission_id);
	public Grade find(Exam exam,Student student,String permission_id); //ͨ�����Ժ�ѧ�����ҷ���
	public List<?> find(String exam_id,String class_id,String permission_id);
	public List<Grade> findByExam(String exam_id,String permission_id); //ͨ������id���ҷ�����¼
	public float getClassAvgGrade(String exam_id,Integer class_id,String permission_id);//��ȡһ���༶��ĳһ�ο��Ե�ƽ����
	//��ȡ�༶����
	public Integer  getRank_in_class(Grade grade,String permission_id);
	//��ȡ�꼶����
	public Integer getRank_in_grade(Grade grade,String permission_id);
	
	
	public int findPages(int perFolioAmount,String permission_id);  //������ҳ��
	public Long hasNumbers(String permission_id);     //���������ݸ���
	public List<Grade> show_by_page(int page,int perFolioAmount,String permission_id);  //����ҳ������
}
