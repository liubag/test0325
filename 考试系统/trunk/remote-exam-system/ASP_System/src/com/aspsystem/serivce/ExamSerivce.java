package com.aspsystem.serivce;

import java.util.Date;
import java.util.List;

import com.aspsystem.entity.AanswerNote;
import com.aspsystem.entity.Exam;
import com.aspsystem.entity.Questions;

public interface ExamSerivce {
	public boolean dele(String exam_id, String permission_id);
	public boolean deleBatch(String idArray,String permission_id);
	public boolean drawGrade(AanswerNote answerNote,Exam exam,String permission_id);//计算考试分数
	
	public List<Exam> showExam(String permission_id,List<Exam> exam_l);

	public boolean save(Exam exam, String permission_id);
//	public boolean update(Exam exam,Date begin_date, Date begin_time, String permission_id);
	public boolean save(Exam exam, Date begin_date, Date begin_time,
			String course_id, String teacher_id, int singleNumber,
			int manyNumber, int uncertainNumber,String permission_id);
	public boolean save_a_grade_as_zero(Exam exam,String permission_id);//没参加考试的学生分数为零
	public Exam find(String exam_id, String permission_id);
	public List<Questions> getQuestionsList(Exam exam, String permission_id);

	public List<Exam> findAll(String permission_id);

	public int ques_hasPages(int perFolioAmount, int ques_size); // 返回试卷中问题的页数

	public List<Questions> show_question_by_page(int page, int perFolioAmount,
			List<Questions> question_l);

	public List<Exam> gainExamByTime(String permission_id);
	public int findPages(int perFolioAmount, String entityName); // 返回总页数

	public Long hasNumbers(String entityName); // 返回总数据个数

	public List<?> show_by_page(int page, int perFolioAmount, String entityName); // 根据页数遍历
}
