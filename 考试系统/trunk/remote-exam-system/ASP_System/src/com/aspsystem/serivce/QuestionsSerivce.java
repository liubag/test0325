package com.aspsystem.serivce;

import java.util.List;

import com.aspsystem.entity.Questions;

public interface QuestionsSerivce {
	public boolean dele(String ques_id,String permission_id);
	public boolean deleBatch(String idArray,String permission_id);
	public boolean save(Questions question,String permission_id);
	public boolean save(Questions question,String techer_id,String course_id,String permission_id);
	public boolean update(Questions question,String permission_id);
	public Questions find(String ques_id,String permission_id);
	public List<Questions> randomAccessQus(int number,int type,String course_id,String permission_id);
	public int findPages(int perFolioAmount,String entityName);  //返回总页数
	public Long hasNumbers(String entityName);     //返回总数据个数
	public List<?> show_by_page(int page,int perFolioAmount,String entityName);  //根据页数遍历
}
