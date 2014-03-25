package com.aspsystem.action;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import java.util.ArrayList;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.aspsystem.entity.AanswerNote;
import com.aspsystem.entity.Exam;
import com.aspsystem.entity.Questions;
import com.aspsystem.serivce.AanswerNoteSerivce;
import com.aspsystem.serivce.ExamSerivce;

import com.aspsystem.serivce.QuestionsSerivce;

import com.aspsystem.util.MyStringAppConfigs;
import com.aspsystem.util.PageUtil;
import com.aspsystem.util.StringUtil;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings({"serial"})
public class ExamAction extends  ActionSupport{
	
	@Resource
	private ExamSerivce examSerivce;
	@Resource
	private QuestionsSerivce questionSerivce;
	@Resource
	private AanswerNoteSerivce aanswerNoteSerivce;
	private Exam exam;
	private String exam_id;
	private String idArray;
	private String exam_course;//���Կ�Ŀ
	private Map<String,Object> session;//
	private String permission_id;
	private String tip;
	private MyStringAppConfigs myStringAppConfigs;
	private String course_id;
	private String teacher_id;
	private int singleNumber;
	private int manyNumber;
	private int uncertainNumber;
	private Date begin_date;
	private Date begin_time;
	
	private int hasQuestions;
	private int page;
	private int hasPages;
	private int perFolioAmount;
	private List<Integer> page_l;
	private List<Questions> question_l;

	private List<String> option_l;
	private Questions question;
	private boolean isExamOver; //�����Ƿ����
	private boolean isTimesUp;  //����ʱ���Ƿ��ˣ�����ǣ�ǿ���ύ������û�μӿ��Ե�ѧ���ɼ�Ϊ��
	private boolean isSaveExamSuccess;
	private List<Exam> exam_l;
	
	/**
	 * ��ȡ��ҳ��ʾMyClass����Ҫ����
	 * 
	 */
	
	@SuppressWarnings("unchecked")
	public String showExam_by_page(){
		try{			
			perFolioAmount = 4;   //ÿҳ��ʾ����
			this.hasQuestions = examSerivce.hasNumbers("Exam").intValue();//��ȡ��������
			
			hasPages = examSerivce.findPages(perFolioAmount, "Exam"); //��ȡҳ��
			
			this.page_l = PageUtil.getPageList(hasPages);  //��ȡһ����1��hasPages������
			if (page <= 0) {
				page = 1;
			}
			if (hasPages == 0) {
				page = 0;
			} else {
				if (page <= 0) {
					page = 1;
				} else if (page > hasPages) {
					page = hasPages;
				}
			}
			//��ȡ��ǰҳ������
			this.exam_l = (List<Exam>)examSerivce.show_by_page( page, perFolioAmount, "Exam");


			return SUCCESS;
		}catch(Exception e){
			e.printStackTrace();
			return INPUT;
		}
	}
	
	//��ʾ����������Ϣ
	public String showExamInfo(){
		try {
			tip="";
			exam_course="";
			String flag="fail";
			session=ActionContext.getContext().getSession();
			permission_id=(String)session.get("student_permission");
			exam=examSerivce.find(exam_id, permission_id);
			if(exam!=null){
				exam_course=exam.getCourse().getCourse_name();
				flag="success";
			}else{
				myStringAppConfigs=MyStringAppConfigs.show_examInfo_fail;
				tip=myStringAppConfigs.getValue();
			}
			return flag;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			tip=e.getMessage();
			e.printStackTrace();
			return "fail";
		}
	}
	
	/**
	 * ��鿼���Ƿ�ʼ
	 */
	public void checkIsExamBegin(){
		PrintWriter out=null;
		try {
			String flag="noBegin";
			session=ActionContext.getContext().getSession();
			permission_id=(String)session.get("student_permission");
			exam=examSerivce.find(exam_id, permission_id);
			if(exam!=null){
				Long currentDate =new Date().getTime();
				Long examBeginDate = exam.getBegin_time().getTime();
				Long examEndDate =exam.getEnd_time().getTime();
				if(currentDate-examBeginDate>=0 && currentDate-examEndDate<0){
					flag="isBegin";
				}else if(currentDate-examEndDate>=0){
					flag="isOver";
				}
				HttpServletResponse response = ServletActionContext.getResponse();
				response.setCharacterEncoding("UTF-8");
			    out = response.getWriter();
				// ֱ��������Ӧ������
				out.print(flag);
				out.flush();
				
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			if(out!=null)
				out.close();
		}
	}
	
	/**
	 * ���Ծ�
	 * @return
	 */
	public String doExam(){
		try {
			
			String flag="fail";
			tip="";
			perFolioAmount=10;
			HttpServletRequest request = ServletActionContext.getRequest();
			session=ActionContext.getContext().getSession();
			if(isSaveExamSuccess){
				request.setAttribute("isSaveExamSuccess", isSaveExamSuccess);
			}
			
			permission_id=(String)session.get("student_permission");
			exam=examSerivce.find(exam_id, permission_id);
			if(exam!=null){
				question_l=examSerivce.getQuestionsList(exam, permission_id);
				hasQuestions=question_l.size();
				hasPages=examSerivce.ques_hasPages(perFolioAmount, hasQuestions);
				page_l=PageUtil.getPageList(hasPages);
				if (page <= 0) {
					page = 1;
				}
				if (hasPages == 0) {
					page = 0;
				} else {
					if (page <= 0) {
						page = 1;
					} else if (page > hasPages) {
						page = hasPages;
					}
				}
				question_l=examSerivce.show_question_by_page(page, perFolioAmount, question_l);
				saveAnswerToSession(examSerivce.getQuestionsList(exam, permission_id), request, session);
				flag="success";
				
			}else{
				myStringAppConfigs=MyStringAppConfigs.show_questions_fail;
				tip=myStringAppConfigs.getValue();
			}
			
			return flag;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			tip=e.getMessage();
			return "fail";
		}
	}

	/**
	 *  ��ѡ��ֿ�
	 * @return
	 */

	public String cutOptions(){
		if(this.question==null){
			return "fail";
		}
		session=ActionContext.getContext().getSession();
		permission_id=(String)session.get("student_permission");
		question=questionSerivce.find(question.getQues_id(), permission_id);
		option_l=StringUtil.getOption(question.getOptions(), ";");
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("option_l", option_l);
		return "success";
		
	}
	
	/**
	 * ����𰸵�session�У�������ʾ�Ѿ��������Ŀ��
	 * @param ques_l
	 * @param request
	 * @param session
	 */
	public void saveAnswerToSession(List<Questions> ques_l,HttpServletRequest request,Map<String,Object> session){
		for(Questions ques:ques_l){
			String[] checkboxvalues=null;
			String[] radiovalue=null;
			if(request.getParameterValues(ques.getQues_id())!=null){
				if(ques.getType()==1){
					radiovalue=request.getParameterValues(ques.getQues_id());

					session.put(ques.getQues_id(), radiovalue[0]);
				}else{
					checkboxvalues=request.getParameterValues(ques.getQues_id());
					session.put(ques.getQues_id(), checkboxvalues);
				}
			}
		}
	}
	
	/**
	 * �����Ծ�𰸵����ݿ��У������Խ�����ʱ������ɼ�
	 * @return
	 */
	public String saveAnswerToAnswerNote(){
		try {
			isSaveExamSuccess=false;
			String flag="false";	
			tip="";
			HttpServletRequest request = ServletActionContext.getRequest();
			session=ActionContext.getContext().getSession();
			permission_id=(String)session.get("student_permission");
			exam=examSerivce.find(exam_id, permission_id);
			if(exam!=null){
				List<Questions> allQuestions_l=examSerivce.getQuestionsList(exam, permission_id);
				saveAnswerToSession(allQuestions_l, request, session);
				List<String> answer_l=new ArrayList<String>();
				for(Questions ques:allQuestions_l){
					int index=allQuestions_l.indexOf(ques)+1;
					String answerStr=index+".";
					if(session.get(ques.getQues_id())!=null){
						if(ques.getType()==1){
							answerStr+=session.get(ques.getQues_id()).toString().substring(0, 1);
						}else{
							for(String s:(String[])session.get(ques.getQues_id())){
								answerStr+=s.substring(0,1);
							}
						}
					}
					answer_l.add(answerStr);  
				}
				
				AanswerNote aanswerNote =aanswerNoteSerivce.find(exam_id, StringUtil.cutOutId(permission_id), permission_id);
				if(aanswerNote==null){
					aanswerNote=new AanswerNote();
					aanswerNote.setExam_id(exam_id);
					aanswerNote.setAnswer(StringUtil.join(answer_l, ";"));
					aanswerNote.setStu_id(StringUtil.cutOutId(permission_id));		
				}else{
					aanswerNote.setAnswer(StringUtil.join(answer_l, ";"));
				}
				aanswerNoteSerivce.save(aanswerNote, permission_id);
				isExamOver=Boolean.parseBoolean(request.getParameter("isExamOver"));
				isSaveExamSuccess=true;
				if(!isExamOver){
					flag="success";
				}else{
					for(Questions ques:allQuestions_l){
						if(session.get(ques.getQues_id())!=null){
							session.remove(ques.getQues_id());
						}
					}
					if(examSerivce.drawGrade(aanswerNote, exam, permission_id)){
						//����ʱ������ˣ�û�μӿ��Ե�ѧ������Ϊ��
						isTimesUp=Boolean.parseBoolean(request.getParameter("isTimesUp"));
						if(isTimesUp){
							examSerivce.save_a_grade_as_zero(exam, permission_id);
							
							//ǿ���ύ��ͬʱ����ƽ���ɼ��Ͱ༶֮�������
							//
							//
						}
						myStringAppConfigs=MyStringAppConfigs.commit_exam_success;
						tip=myStringAppConfigs.getValue();
						flag="success1";
					}else{
						myStringAppConfigs=MyStringAppConfigs.commit_exam_fail;
						tip=myStringAppConfigs.getValue();
						flag="fail";
					}
				}
			}else{
				flag="fail";
				myStringAppConfigs=MyStringAppConfigs.save_answernote_fail;
				tip=myStringAppConfigs.getValue();
			}
			return flag;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			myStringAppConfigs=MyStringAppConfigs.save_answernote_fail;
			tip=myStringAppConfigs.getValue();
			return "fail";
		}
	}

	/**
	 * ��ӿ���
	 * @return
	 */
	public String addExam(){
		try{
			String flag="input";
			tip="";

			session=ActionContext.getContext().getSession();			
			permission_id=(String)session.get("admin_permission");
			if(examSerivce.save(exam,begin_date,begin_time,course_id,teacher_id,singleNumber,manyNumber,uncertainNumber,permission_id)){
				myStringAppConfigs=MyStringAppConfigs.add_exam_success;
				flag="success";
			}else{
				myStringAppConfigs=MyStringAppConfigs.add_exam_fail;
				flag="input";
			}
			tip=myStringAppConfigs.getValue();
			return flag;
		}catch(Exception e){
			e.printStackTrace();
			return INPUT;
		}
	}

	
	/**
	 * ����ɾ��
	 */
	
	public String deletExam(){
		try{
			String flag="input";
			tip="";
			session=ActionContext.getContext().getSession();			
			permission_id=(String)session.get("admin_permission");
			if(examSerivce.dele(exam.getExam_id(), permission_id)){
				myStringAppConfigs=MyStringAppConfigs.update_exam_success;
				flag="success";
			}else{
				myStringAppConfigs=MyStringAppConfigs.update_exam_fail;
				flag="input";
			}
			tip=myStringAppConfigs.getValue();
			return flag;
		}catch(Exception e){
			e.printStackTrace();
			return INPUT;
		}
	}
	
	/**
	 * ����ɾ��
	 */
	
	public String deletExamBatch(){
		try{
			String flag="input";
			tip="";
			session=ActionContext.getContext().getSession();			
			permission_id=(String)session.get("admin_permission");
			if(examSerivce.deleBatch(idArray, permission_id)){
				myStringAppConfigs=MyStringAppConfigs.update_exam_success;
				flag="success";
			}else{
				myStringAppConfigs=MyStringAppConfigs.update_exam_fail;
				flag="input";
			}
			tip=myStringAppConfigs.getValue();
			return flag;
		}catch(Exception e){
			e.printStackTrace();
			return INPUT;
		}
	}
	/**
	 * ��ʾ����
	 */
	public String showExam(){
		try{			
			//��ȡ����
			session=ActionContext.getContext().getSession();
			permission_id=(String)session.get("student_permission");
			this.exam_l=examSerivce.findAll(permission_id);
			this.exam_l = (List<Exam>)examSerivce.showExam(permission_id, exam_l);
			return "success";
		}catch(Exception e){
			e.printStackTrace();
			return  "fail";
		}
	}
	
	/**
	 * ��ȡ
	 * @return
	 */
	public String gainExamByTime(){
		try{
			session=ActionContext.getContext().getSession();
			permission_id=(String)session.get("teacher_permission");
			this.exam_l=examSerivce.gainExamByTime(permission_id);	
			return SUCCESS;

		}catch(Exception e){
			e.printStackTrace();
			return INPUT;
		}
	}
	public Exam getExam() {
		return exam;
	}
	public void setExam(Exam exam) {
		this.exam = exam;
	}
	public String getExam_id() {
		return exam_id;
	}
	public void setExam_id(String exam_id) {
		this.exam_id = exam_id;
	}
	public String getExam_course() {
		return exam_course;
	}
	public void setExam_course(String exam_course) {
		this.exam_course = exam_course;
	}

	public void setTip(String tip) {
		this.tip = tip;
	}

	public String getTip() {
		return tip;
	}
	public int getHasQuestions() {
		return hasQuestions;
	}
	public void setHasQuestions(int hasQuestions) {
		this.hasQuestions = hasQuestions;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getHasPages() {
		return hasPages;
	}
	public void setHasPages(int hasPages) {
		this.hasPages = hasPages;
	}
	public int getPerFolioAmount() {
		return perFolioAmount;
	}
	public void setPerFolioAmount(int perFolioAmount) {  
		this.perFolioAmount = perFolioAmount;
	}
	public List<Integer> getPage_l() {
		return page_l;
	}
	public void setPage_l(List<Integer> page_l) {
		this.page_l = page_l;
	}
	public void setQuestion_l(List<Questions> question_l) {
		this.question_l = question_l;
	}
	public List<Questions> getQuestion_l() {
		return question_l;
	}

	public String getCourse_id() {
		return course_id;
	}
	public void setCourse_id(String course_id) {
		this.course_id = course_id;
	}
	public String getTeacher_id() {
		return teacher_id;
	}
	public void setTeacher_id(String teacher_id) {
		this.teacher_id = teacher_id;
	}
	public int getSingleNumber() {
		return singleNumber;
	}
	public void setSingleNumber(int singleNumber) {
		this.singleNumber = singleNumber;
	}
	public int getManyNumber() {
		return manyNumber;
	}
	public void setManyNumber(int manyNumber) {
		this.manyNumber = manyNumber;
	}
	public int getUncertainNumber() {
		return uncertainNumber;
	}
	public void setUncertainNumber(int uncertainNumber) {
		this.uncertainNumber = uncertainNumber;
	}
	public Date getBegin_date() {
		return begin_date;
	}
	public void setBegin_date(Date begin_date) {
		this.begin_date = begin_date;
	}
	public Date getBegin_time() {
		return begin_time;
	}
	public void setBegin_time(Date begin_time) {
		this.begin_time = begin_time;

		
	}


	public List<String> getOption_l() {
		return option_l;
	}
	public void setOption_l(List<String> option_l) {
		this.option_l = option_l;
	}
	public Questions getQuestion() {
		return question;
	}
	public void setQuestion(Questions question) {
		this.question = question;
	}
	public void setExamOver(boolean isExamOver) {
		this.isExamOver = isExamOver;
	}
	public boolean isExamOver() {
		return isExamOver;
	}
	

	public List<Exam> getExam_l() {
		return exam_l;
	}
	public void setExam_l(List<Exam> exam_l) {
		this.exam_l = exam_l;
	}

	public String getIdArray() {
		return idArray;
	}

	public void setIdArray(String idArray) {
		this.idArray = idArray;
	}

	public void setSaveExamSuccess(boolean isSaveExamSuccess) {
		this.isSaveExamSuccess = isSaveExamSuccess;
	}

	public boolean isSaveExamSuccess() {
		return isSaveExamSuccess;
	}

	public void setTimesUp(boolean isTimesUp) {
		this.isTimesUp = isTimesUp;
	}

	public boolean isTimesUp() {
		return isTimesUp;
	}
	
}
