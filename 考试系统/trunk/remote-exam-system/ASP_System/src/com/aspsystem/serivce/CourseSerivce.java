package com.aspsystem.serivce;

import java.util.List;

import com.aspsystem.entity.Course;




public interface CourseSerivce {
	public boolean dele(Integer course_id,String permission_id);
	public boolean deleBatch(String idArray,String permission_id);
	public boolean save(Course course,String permission_id);
	public boolean update(Course course,String permission_id);
	public Course find(Integer course_id,String permission_id);
	public Course find(String course_name,String permission_id);
	public List<Course> find(String permission_id);
	public boolean findCourse(Integer course_id,String permission_id);
	
	public int findPages(int perFolioAmount,String entityName);  //������ҳ��
	public Long hasNumbers(String entityName);     //���������ݸ���
	public List<?> show_by_page(int page,int perFolioAmount,String entityName);  //����ҳ������
}
