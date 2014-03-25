package com.aspsystem.action;

import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.aspsystem.entity.Student;
import com.aspsystem.serivce.StudentSerivce;
import com.aspsystem.util.DateUtil;
import com.aspsystem.util.MyStringAppConfigs;
import com.aspsystem.util.PageUtil;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings({"serial","unchecked"})
public class StudentAction extends  ActionSupport{
	
	@Resource
	private StudentSerivce studentSerivce;
	private Student student;
	private String class_id;
	private String account;
	private String pw;
	private String permission_id;
	private Map<String,Object> session;
	private String tip;
	private MyStringAppConfigs myStringAppConfigs;
	private boolean isChangePassword=false;
	private String idArray;
	private Long hasStudent;   //���ݵ��ܸ���
	private int page;		 //��ǰҳ
	private int hasPages;	 //��ҳ��
	private int perFolioAmount;  //ÿҳ���ݵ�����
	private List<Integer> page_l;//��ȡһ����1��hasPages������
	private List<Student> Student_l; //��ǰҳ������
	private String isTologin;
	
	
	/**
	 * ��ȡ��ҳ��ʾstudent����Ҫ����
	 * 
	 */
	public String showStudent_by_page(){
		try{			
			perFolioAmount = 4;   //ÿҳ��ʾ����
			this.hasStudent = studentSerivce.hasNumbers("Student");//��ȡ��������
			
			hasPages = studentSerivce.findPages(perFolioAmount, "Student"); //��ȡҳ��
			
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
			this.Student_l = (List<Student>)studentSerivce.show_by_page( page, perFolioAmount, "Student");
			
			return SUCCESS;
		}catch(Exception e){
			e.printStackTrace();
			return INPUT;
		}
	}
	/**
	 * ʵ�����ѧ������
	 * @return
	 */
	public String addStudent(){
		try{
			tip="";
			perFolioAmount = 4;   //ÿҳ��ʾ����
			session=ActionContext.getContext().getSession();			
			permission_id=(String)session.get("admin_permission");			
			
			student.setPw("888888");
			student.setJoin_time(DateUtil.toMyForm1(new Date()));
			student.setStatus(1);
			if(studentSerivce.save(student,class_id, permission_id)){
				page = studentSerivce.findPages(perFolioAmount, "Student"); //��ȡҳ��
				if(page==0){
					page=1;
				}
				return SUCCESS;
			}else
				return INPUT;
			
		}catch(Exception e){
			e.printStackTrace();
			return INPUT;
		}
	}
	
	public String login(){
		try{
			
			permission_id=studentSerivce.login(account,pw);
			session=ActionContext.getContext().getSession();
			if(permission_id!=null){
				
				session.put("student_permission", permission_id);
				session.put("studentInfo", account);
				return SUCCESS;
			}	
			else{
				isTologin=new String("��¼ʧ��");
				return INPUT;
			}
				
		}catch(Exception e){
			e.printStackTrace();
			return INPUT;
		}		
	}
	public String changePassword(){
		try {
			isChangePassword=true;
			String flag="";
			tip="";
			session=ActionContext.getContext().getSession();
			permission_id=(String) session.get("student_permission");
			if(studentSerivce.changePassword(student, pw, permission_id)){
				myStringAppConfigs=MyStringAppConfigs.change_password_success;
				flag="success";
			}else{
				myStringAppConfigs=MyStringAppConfigs.change_password_fail;
				flag="fail";
			}
			tip=myStringAppConfigs.getValue();
			return flag;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			tip=e.getMessage();
			e.printStackTrace();
			return "fail";
		}
	}
	
	/*
	 * ����ɾ��ѧ��
	 */
	public String delStudent(){
		try{
			String flag="";
			tip="";
			session=ActionContext.getContext().getSession();
			permission_id=(String) session.get("admin_permission");
			if(studentSerivce.dele(student.getStu_id(), permission_id)){
				myStringAppConfigs=MyStringAppConfigs.dele_student_success;
				flag="success";
			}else{
				myStringAppConfigs=MyStringAppConfigs.dele_student_fail;
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
	 * ����ɾ��ѧ��
	 * @return
	 */
	public String deletStudentBatch(){
		try{
			String flag="";
			tip="";
			session=ActionContext.getContext().getSession();			
			permission_id=(String)session.get("admin_permission");	
			if(studentSerivce.deleBatch(idArray.trim(), permission_id)){
				myStringAppConfigs=MyStringAppConfigs.dele_student_success;
				flag="success";
			}else{
				myStringAppConfigs=MyStringAppConfigs.dele_student_fail;
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
	 * ���Ҵ�ѧ�ſɲ�����
	 * 
	 */
	public String findStudentById(){
		try{
			String flag="input";
			session=ActionContext.getContext().getSession();			
			permission_id=(String)session.get("admin_permission");
			if(studentSerivce.find(student.getStu_id(), permission_id)!=null){				
				flag="success";
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
		return null;
	}
	public String logout(){
		session=ActionContext.getContext().getSession();
		session.clear();
		
		if(isChangePassword){
			session.put("isChangePassword", isChangePassword);
			isChangePassword=false;
			return "success1";
		}
		return "success";
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	public void setTip(String tip) {
		this.tip = tip;
	}
	public String getTip() {
		return tip;
	}
	public Long getHasStudent() {
		return hasStudent;
	}
	public void setHasStudent(Long hasStudent) {
		this.hasStudent = hasStudent;
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
	public List<Student> getStudent_l() {
		return Student_l;
	}
	public void setStudent_l(List<Student> student_l) {
		Student_l = student_l;
	}
	public String getClass_id() {
		return class_id;
	}
	public void setClass_id(String class_id) {
		this.class_id = class_id;
	}
	public String getIdArray() {
		return idArray;
	}
	public void setIdArray(String idArray) {
		this.idArray = idArray;
	}
	public String getIsTologin() {
		return isTologin;
	}
	public void setIsTologin(String isTologin) {
		this.isTologin = isTologin;
	}
	
}
