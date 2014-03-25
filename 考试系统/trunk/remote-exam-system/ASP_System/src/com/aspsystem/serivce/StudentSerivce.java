package com.aspsystem.serivce;

import java.util.List;

import com.aspsystem.entity.Student;



public interface StudentSerivce {
	public boolean dele(String stu_id,String permission_id);
	public boolean deleBatch(String idArray,String permission_id);
	public boolean save(Student student,String permission_id);
	public boolean save(Student student,String class_id,String permission_id);
	public boolean update(Student student,String permission_id);
	public boolean changePassword(Student student,String newpw,String permission_id); 
	public Student find(String stu_id,String permission_id);
	public List<Student> findByClass_Id(String class_id,String permission_id);
	public String login(String account,String pw);
	
	public int findPages(int perFolioAmount,String entityName);  //返回总页数
	public Long hasNumbers(String entityName);     //返回总数据个数
	public List<?> show_by_page(int page,int perFolioAmount,String entityName);  //根据页数遍历
}
