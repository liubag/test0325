package com.aspsystem.serivce;

import java.io.File;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;

import com.aspsystem.dao.CourseDao;
import com.aspsystem.dao.ExamDao;
import com.aspsystem.dao.TeacherDao;
import com.aspsystem.entity.AanswerNote;
import com.aspsystem.entity.Course;
import com.aspsystem.entity.Exam;
import com.aspsystem.entity.Grade;
import com.aspsystem.entity.Questions;
import com.aspsystem.entity.Student;
import com.aspsystem.entity.Teacher;
import com.aspsystem.util.DateUtil;
import com.aspsystem.util.MySerivceParent;
import com.aspsystem.util.StringUtil;
import com.aspsystem.util.WordUtil;

public class ExamSerivceImpl extends MySerivceParent implements
	ExamSerivce {
	
	public  static final int SINGLE_CHOICE_POINT=2; //单选题分数	
	public static final int MULTI_CHOICE_POINT=2; //多选题分数
	public static final int VARIABLE_CHOICE_POINT=2; //不定项选择题分数
	@Resource
	private ExamDao examDao;
	@Resource
	private TeacherDao teacherDao;
	@Resource
	private CourseDao courseDao;
	@Resource
	private QuestionsSerivce questionSerivce;
	@Resource
	private StudentSerivce studentSerivce;
	@Resource
	private GradeSerivce gradeSerivce;
	@Resource
	private AanswerNoteSerivce aanswerNoteSerivce;
	private String hql;
	
	//通过试卷id删除对应的一条试卷信息
	public boolean dele(String exam_id, String permission_id) {
		// TODO Auto-generated method stub
		if(permission_id!=null){
			this.session=getSession();	
			Exam e=find(exam_id,permission_id);
			examDao.dele(e, session);
			String directory = "admin/examFile";  
	        String targetDirectory = ServletActionContext.getServletContext().getRealPath(directory);
			String path=targetDirectory+"\\"+e.getExam_name()+".doc";
			File examFile=new   File( path);
			if(examFile!=null){
				examFile.delete();
			}
			return true;
		}else
			return false;
	}
	//批量删除试卷
	public boolean deleBatch(String idArray, String permission_id) {
		// TODO Auto-generated method stub
		if(permission_id!=null){
			this.session=getSession();
			List<String> idList=StringUtil.getOption(idArray, ",");
			for(String id:idList){	
				Exam e=find(id,permission_id);
				examDao.dele(e, session);	
				String directory = "admin/examFile";  
		        String targetDirectory = ServletActionContext.getServletContext().getRealPath(directory);
				String path=targetDirectory+"\\"+e.getExam_name()+".doc";
				File examFile=new   File( path);
				if(examFile!=null){
					examFile.delete();
				}
			}
			return true;
		}else
			return false;
	}
	//通过试卷id找到试卷并且返回
	public Exam find(String exam_id, String permission_id) {
		// TODO Auto-generated method stub
		if(permission_id!=null){
			this.session=getSession();
			hql="from Exam as e where e.exam_id='"+exam_id+"'";
			return (Exam)examDao.find(hql, session);
		}else
			return null;
	}

	//把试卷信息保存到数据库中
	public boolean save(Exam exam, String permission_id) {
		// TODO Auto-generated method stub
		if(permission_id!=null){
			this.session=getSession();
			examDao.save(exam, session);
			return true;
		}else
			return false;
	}

	//通过问题id的集合查找问题并返回该问题的集合
	public List<Questions> getQuestionsList(Exam exam, String permission_id) {
		// TODO Auto-generated method stub
		List<String> quesId_l=StringUtil.getOption(exam.getQues_id(), ";");
		
		List<Questions> ques_l=new ArrayList<Questions>();
		for(String ques_id:quesId_l){
			Questions question = questionSerivce.find(ques_id, permission_id);
			ques_l.add(question);
		}
		if(ques_l.size()==0){
			return null;
		}
		return ques_l;
	}

	//获取试卷中问题的页数
	public int ques_hasPages(int perFolioAmount, int ques_size) {
		// TODO Auto-generated method stub
		int pageNum;
		pageNum=ques_size/perFolioAmount;
		ques_size = ques_size%perFolioAmount;
		if(ques_size>0){
			pageNum++;
		}
		return pageNum;
		
	}

	//考试时按照页数显示题目
	public List<Questions> show_question_by_page(int page,int perFolioAmount,
			List<Questions> question_l) {
		// TODO Auto-generated method stub
		int first=(page-1)*perFolioAmount;
		int max=perFolioAmount;
		List<Questions> l=new ArrayList<Questions>();
		if(question_l.size()>0 && question_l.size()>=first){
			for(int i=first;i<(first+max);i++){
				if(i>=question_l.size()){
					break;
				}
				l.add(question_l.get(i));
			}
		}
		return l;
	}	
	
	//找出所有试卷
	@SuppressWarnings("unchecked")
	public List<Exam> findAll(String permission_id) {
		// TODO Auto-generated method stub
		if(permission_id!=null){
			this.session=getSession();
			Student student =studentSerivce.find(StringUtil.cutOutId(permission_id), permission_id) ;
			hql="from Exam as e where e.class_id like '%,"+student.getMyclass().getClass_id()+",%'";
			return (List<Exam>)examDao.findAll(hql, session);
		}else
			return null;
	}

	//计算考试成绩
	public boolean drawGrade(AanswerNote answerNote, Exam exam,String permission_id){
		// TODO Auto-generated method stub
		boolean flag=false;
		if(permission_id!=null){
			int grade=0;
			List<Questions> allQuestions=getQuestionsList(exam, permission_id);
			List<String> allAnswers=StringUtil.getOption(answerNote.getAnswer(), ";");
			for(Questions q:allQuestions){
				String q_answer=q.getAnswer().replaceAll(",", "");
				
				//学生对于这道题的答案
				String s_answer=allAnswers.get(allQuestions.indexOf(q));
				s_answer=s_answer.substring(s_answer.indexOf(".")+1);
				if(q.getType()==1){
					if(StringUtil.isEmpty(s_answer)|| !s_answer .equals(q_answer)){
						continue;
					}else{
						grade+=SINGLE_CHOICE_POINT;
					}
				}else{
					if(StringUtil.isEmpty(s_answer) || s_answer.length()>q_answer.length() || q_answer.indexOf(s_answer)==-1){
						continue;
					}else if(s_answer.equals(q_answer)){
						switch (q.getType()) {
						case 2:
							grade+=MULTI_CHOICE_POINT;
							break;
						case 3:
							grade+=VARIABLE_CHOICE_POINT;
							break;
						default:
							break;
						}
					}else{
						int less=q_answer.length()-s_answer.length();
						switch (q.getType()) {
						case 2:
							if(less<MULTI_CHOICE_POINT) grade+=(MULTI_CHOICE_POINT-less);
							else grade+=0;
							break;
						case 3:
							if(less<VARIABLE_CHOICE_POINT) grade+=(VARIABLE_CHOICE_POINT-less);
							else grade+=0;
							break;
						default:
							break;
					}
				}
			}
		}
			Student stu=studentSerivce.find(StringUtil.cutOutId(permission_id), permission_id);
			if(gradeSerivce.find(exam, stu, permission_id)==null){
				Grade g=new Grade("yes");
				g.setExam(exam);
				g.setGrade(grade);
				g.setStu(stu);
				g.setJoin_time(new Date());
				gradeSerivce.save(g, permission_id);
				flag=true;
			}else{
				flag=false;
			}
			
	}
		
		return flag;
	}
	
	//显示学生可以参加的考试
	public List<Exam> showExam(String permission_id,List<Exam> exam_l){
		
		if(permission_id!=null){
			this.session=getSession();
			List<Exam> l=new ArrayList<Exam>();
			if(exam_l !=null && exam_l.size()>0){
				for(Exam e:exam_l){
					Date time = new Date();   
				    long currenttime =time.getTime();
				    Student stu=studentSerivce.find(StringUtil.cutOutId(permission_id), permission_id);
				    if(currenttime<e.getEnd_time().getTime() && gradeSerivce.find(e, stu, permission_id)==null)
				    {
				    	l.add(e);
				    }
				  }
			}
			return l;
			
		}else
			return null;
	}

	public boolean save(Exam exam, Date begin_date, Date begin_time,
			String course_id, String teacher_id, int singleNumber,
			int manyNumber, int uncertainNumber,String permission_id) {
		// TODO Auto-generated method stub
	try{
		if(permission_id!=null){
			this.session=getSession();
			String ques_idStr="";
			List<Questions> quesList=new ArrayList<Questions>();
			
			String begin_datetime=DateUtil.today(begin_date).substring(0, 10)+DateUtil.today(begin_time).substring(10);
			String end_datetime=DateUtil.dateAdd(begin_datetime, exam.getExam_time());
			
			//获取时间
			begin_date=DateUtil.stringToDate(begin_datetime);
			Date end_time=DateUtil.stringToDate(end_datetime);
			
			//获取题目id集
			if(singleNumber!=0)
				quesList.addAll(questionSerivce.randomAccessQus(singleNumber, 1, course_id, permission_id));
			if(manyNumber!=0)
				quesList.addAll(questionSerivce.randomAccessQus(manyNumber, 2, course_id, permission_id));
			if(uncertainNumber!=0)
				quesList.addAll(questionSerivce.randomAccessQus(uncertainNumber, 3, course_id, permission_id));
			
			if(quesList!=null){
				for(Questions q: quesList){
					ques_idStr+=q.getQues_id()+";";
				}
			}
				
			//获取老师
			hql="from Teacher as t where t.teacher_id='"+teacher_id+"'";
			Teacher t=(Teacher)teacherDao.find(hql, session);
			
			hql="from Course as c where c.course_id='"+course_id+"'";
			Course c=(Course)courseDao.find(hql, session);
		
			Exam e=new Exam("exam");
			e.setExam_name(exam.getExam_name());
			e.setExam_wordPath(exam.getExam_name());
			e.setClass_id(exam.getClass_id());
			e.setBegin_time(begin_date);
			e.setEnd_time(end_time);
			e.setExam_time(exam.getExam_time());
			e.setQues_id(ques_idStr);
			e.setCourse(c);
			e.setTeacher(t);
			examDao.save(e, session);
			String directory = "admin/examFile";  
	        String targetDirectory = ServletActionContext.getServletContext().getRealPath(directory);
			WordUtil wd=new WordUtil(e,quesList,";",targetDirectory+"//");
			wd.WriteWord();
			return true;
		}else
			return false;
	}catch(Exception e){
		e.printStackTrace();
		return false;
	}
	}
	/**
	 * 没有参加考试的学生分数为零
	 */
	public boolean save_a_grade_as_zero(Exam exam, String permission_id) {
		// TODO Auto-generated method stub
		if(permission_id!=null){
			List<String> class_id_l=StringUtil.getOption(exam.getClass_id(), ",");
			for(String class_id:class_id_l){
				List<Student> student_l=studentSerivce.findByClass_Id(class_id, permission_id);
				for(Student s:student_l){
					if(aanswerNoteSerivce.find(exam.getExam_id(), s.getStu_id(), permission_id)==null){
						if(gradeSerivce.find(exam, s, permission_id)==null){
							Grade g=new Grade("new");
							g.setExam(exam);
							g.setStu(s);
							g.setGrade(0);
							g.setJoin_time(new Date());
							gradeSerivce.save(g,permission_id);
						}else{
							continue;
						}
					}
				}
			}
			return true;
		}
		return false;
	}

	/**
	 * 找出当前登录教师所负责并且已经结束的考试
	 */
	@SuppressWarnings("unchecked")
	public List<Exam> gainExamByTime(String permission_id) {
		// TODO Auto-generated method stub
		if(permission_id!=null){
			this.session=getSession();
			String teacher_id =StringUtil.cutOutId(permission_id);
			Date today=new Date();
			SimpleDateFormat df1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String time = df1.format(today);
			//Timestamp t_today = Timestamp.valueOf(time);
			hql="from Exam as e where e.teacher.teacher_id='"+teacher_id+"' and e.end_time<='"+time+"'";
			List<Exam> l=(List<Exam>)examDao.findAll(hql, session);
			return l;
		}else
			return null;
	}	
}
