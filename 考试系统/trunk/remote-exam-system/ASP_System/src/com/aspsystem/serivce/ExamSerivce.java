package com.aspsystem.serivce;

import java.util.Date;
import java.util.List;

import com.aspsystem.entity.AanswerNote;
import com.aspsystem.entity.Exam;
import com.aspsystem.entity.Questions;

public interface ExamSerivce {
	public boolean dele(String exam_id, String permission_id);
	public boolean deleBatch(String idArray,String permission_id);
	public boolean drawGrade(AanswerNote answerNote,Exam exam,String permission_id);//���㿼�Է���
	
	public List<Exam> showExam(String permission_id,List<Exam> exam_l);

	public boolean save(Exam exam, String permission_id);
//	public boolean update(Exam exam,Date begin_date, Date begin_time, String permission_id);
	public boolean save(Exam exam, Date begin_date, Date begin_time,
			String course_id, String teacher_id, int singleNumber,
			int manyNumber, int uncertainNumber,String permission_id);
	public boolean save_a_grade_as_zero(Exam exam,String permission_id);//û�μӿ��Ե�ѧ������Ϊ��
	public Exam find(String exam_id, String permission_id);
	public List<Questions> getQuestionsList(Exam exam, String permission_id);

	public List<Exam> findAll(String permission_id);

	public int ques_hasPages(int perFolioAmount, int ques_size); // �����Ծ��������ҳ��

	public List<Questions> show_question_by_page(int page, int perFolioAmount,
			List<Questions> question_l);

	public List<Exam> gainExamByTime(String permission_id);
	public int findPages(int perFolioAmount, String entityName); // ������ҳ��

	public Long hasNumbers(String entityName); // ���������ݸ���

	public List<?> show_by_page(int page, int perFolioAmount, String entityName); // ����ҳ������
}
