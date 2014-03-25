package com.aspsystem.serivce;

import java.util.List;

import com.aspsystem.entity.Exam;
import com.aspsystem.entity.Grade;
import com.aspsystem.entity.Student;

public interface GradeSerivce {
	public boolean save(Grade grade,String permission_id);
	public Grade find(String grade_id,String permission_id);
	public Grade find(Exam exam,Student student,String permission_id); //通过考试和学生查找分数
	public List<?> find(String exam_id,String class_id,String permission_id);
	public List<Grade> findByExam(String exam_id,String permission_id); //通过考试id查找分数记录
	public float getClassAvgGrade(String exam_id,Integer class_id,String permission_id);//获取一个班级在某一次考试的平均分
	//获取班级排名
	public Integer  getRank_in_class(Grade grade,String permission_id);
	//获取年级排名
	public Integer getRank_in_grade(Grade grade,String permission_id);
	
	
	public int findPages(int perFolioAmount,String permission_id);  //返回总页数
	public Long hasNumbers(String permission_id);     //返回总数据个数
	public List<Grade> show_by_page(int page,int perFolioAmount,String permission_id);  //根据页数遍历
}
