package com.aspsystem.serivce;
import java.util.List;
import java.util.Date;
import com.aspsystem.entity.Teacher;



public interface TeacherSerivce {
	public boolean dele(String teacher_id,String permission_id);
	public boolean save(Teacher teacher, Date today, String permission_id);
	public boolean update(Teacher teacher,String permission_id);
	public boolean changePassword(Teacher teacher,String newpw,String permission_id); 
	public Teacher find(String teacher_id,String permission_id);
	public List<Teacher> find(String permission_id);
	public String login(String account,String pw);
	
	public int findPages(int perFolioAmount,String entityName);  //返回总页数
	public Long hasNumbers(String entityName);     //返回总数据个数
	public List<?> show_by_page(int page,int perFolioAmount,String entityName);  //根据页数遍历
}
