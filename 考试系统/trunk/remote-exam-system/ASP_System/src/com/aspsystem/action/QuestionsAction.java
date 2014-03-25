package com.aspsystem.action;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.aspsystem.entity.Exam;
import com.aspsystem.entity.Questions;
import com.aspsystem.serivce.ExamSerivce;
import com.aspsystem.serivce.QuestionsSerivce;
import com.aspsystem.util.MyStringAppConfigs;
import com.aspsystem.util.PageUtil;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings({"serial","unchecked"})
public class QuestionsAction extends  ActionSupport{
	
	@Resource
	private QuestionsSerivce questionsSerivce;
	@Resource
	private ExamSerivce examSerivce;
	private Questions questions;
	
	private String permission_id;
	private Map<String,Object> session;
	private String tip;
	private String teacher_id;
	private String course_id; 
	private String idArray;
	private Long hasQuestions;   //���ݵ��ܸ���
	private int page;		 //��ǰҳ
	private int hasPages;	 //��ҳ��
	private int perFolioAmount;  //ÿҳ���ݵ�����
	private List<Integer> page_l;//��ȡһ����1��hasPages������
	private List<Questions> questions_l; //��ǰҳ������
	private MyStringAppConfigs myStringAppConfigs;
	public Questions getQuestions() {
		return questions;
	}
	public void setQuestions(Questions questions) {
		this.questions = questions;
	}
	
	
	/**
	 * ��ҳ��ʾ��Ŀ
	 */
	public String showQuestions_by_page(){
		try{			
			perFolioAmount = 4;   //ÿҳ��ʾ����
			this.hasQuestions = questionsSerivce.hasNumbers("Questions");//��ȡ��������
			
			hasPages = questionsSerivce.findPages(perFolioAmount, "Questions"); //��ȡҳ��
			
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
			this.questions_l = (List<Questions>)questionsSerivce.show_by_page( page, perFolioAmount, "Questions");
			
			return SUCCESS;
		}catch(Exception e){
			e.printStackTrace();
			return INPUT;
		}
	}
	/**
	 * ������Ŀ
	 * @return
	 */
	public String addQuestions(){
		try{
			tip="";
			String flag="";
			session=ActionContext.getContext().getSession();			
			permission_id=(String)session.get("admin_permission");
			if(questionsSerivce.save(questions,teacher_id, course_id,permission_id)){
				myStringAppConfigs=MyStringAppConfigs.add_questions_success;
				flag="success";
			}else{
				myStringAppConfigs=MyStringAppConfigs.add_questions_fail;
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
	 * ������Ŀ
	 * @return
	 */
	public String findQuestions(){
		try{
			session=ActionContext.getContext().getSession();			
			permission_id=(String)session.get("admin_permission");
			questions=questionsSerivce.find(questions.getQues_id(), permission_id);
			if(questions!=null){
				HttpServletRequest request = ServletActionContext.getRequest();
				request.setAttribute("questions", questions);
				return SUCCESS;
			}else{
				return INPUT;
			}				
			
		}catch(Exception e){
			e.printStackTrace();
			return INPUT;
		}
	}
	/**
	 * ������Ŀ
	 * @return
	 */
	public String updateQuestions(){
		try{			
			tip="";
			String flag="";
			session=ActionContext.getContext().getSession();			
			permission_id=(String)session.get("admin_permission");
			if(questionsSerivce.update(questions,permission_id)){
				myStringAppConfigs=MyStringAppConfigs.update_questions_success;
				flag="success";
			}else{
				myStringAppConfigs=MyStringAppConfigs.update_questions_fail;
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
	 * ��֤����Ŀ��û�и��Ծ��й���
	 * @return
	 */
	public void checkQuestions(){
		try{
			String flag="input";
			session=ActionContext.getContext().getSession();			
			permission_id=(String)session.get("admin_permission");
			List<Exam> eList=examSerivce.findAll(permission_id);
			if(eList!=null){
				for(Exam e:eList){
					if(e.getQues_id().indexOf(questions.getQues_id())!=-1){
						flag="success";
						break;
					}
				}
				
			}else{
				flag="input";
			}				
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			// ֱ��������Ӧ������
			out.print(flag);
			out.flush();
			out.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	/**
	 * ����ɾ����Ŀ
	 * @return
	 */
	public String delQuestions(){
		try{			
			tip="";
			String flag="";
			session=ActionContext.getContext().getSession();			
			permission_id=(String)session.get("admin_permission");
			if(questionsSerivce.dele(questions.getQues_id(), permission_id)){
				myStringAppConfigs=MyStringAppConfigs.dele_questions_success;
				flag="success";
			}else{
				myStringAppConfigs=MyStringAppConfigs.dele_questions_fail;
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
	 * @return
	 */
	public String deletQuestionsBatch(){
		try{
			String flag="";
			tip="";
			session=ActionContext.getContext().getSession();			
			permission_id=(String)session.get("admin_permission");	
			if(questionsSerivce.deleBatch(idArray.trim(), permission_id)){
				myStringAppConfigs=MyStringAppConfigs.dele_questions_success;
				flag="success";
			}else{
				myStringAppConfigs=MyStringAppConfigs.dele_questions_fail;
				flag="input";
			}
			tip=myStringAppConfigs.getValue();
			return flag;
		}catch(Exception e){
			e.printStackTrace();
			return INPUT;
		}
	}
	public String getTip() {
		return tip;
	}
	public void setTip(String tip) {
		this.tip = tip;
	}
	public String getTeacher_id() {
		return teacher_id;
	}
	public void setTeacher_id(String teacher_id) {
		this.teacher_id = teacher_id;
	}
	public String getCourse_id() {
		return course_id;
	}
	public void setCourse_id(String course_id) {
		this.course_id = course_id;
	}
	public Long getHasQuestions() {
		return hasQuestions;
	}
	public void setHasQuestions(Long hasQuestions) {
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
	public List<Questions> getQuestions_l() {
		return questions_l;
	}
	public void setQuestions_l(List<Questions> questions_l) {
		this.questions_l = questions_l;
	}
	public String getIdArray() {
		return idArray;
	}
	public void setIdArray(String idArray) {
		this.idArray = idArray;
	}

}
