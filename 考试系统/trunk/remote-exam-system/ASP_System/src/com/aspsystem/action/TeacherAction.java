package com.aspsystem.action;

import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.aspsystem.entity.Teacher;
import com.aspsystem.serivce.TeacherSerivce;
import com.aspsystem.util.DateUtil;
import com.aspsystem.util.MyStringAppConfigs;
import com.aspsystem.util.PageUtil;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings({"serial","unchecked"})
public class TeacherAction extends  ActionSupport{
	
	@Resource
	private TeacherSerivce teacherSerivce;
	private Teacher teacher;
	private String account;
	private String pw;
	private String permission_id;
	private Map<String,Object> session;
	private String tip;
	private MyStringAppConfigs myStringAppConfigs;
	private boolean isChangePassword=false;
	
	private Long hasTeacher;   //���ݵ��ܸ���
	private int page;		 //��ǰҳ
	private int hasPages;	 //��ҳ��
	private int perFolioAmount;  //ÿҳ���ݵ�����
	private List<Integer> page_l;//��ȡһ����1��hasPages������
	private List<Teacher> teacher_l; //��ǰҳ������
	private List<Teacher> allTeacher_l; //��ǰҳ������
	private String isTologin;

	/**
	 * ��ȡ��ҳ��ʾteacher����Ҫ����
	 * 
	 */
	public String showTeacher_by_page(){
		try{			
			perFolioAmount = 4;   //ÿҳ��ʾ����
			this.hasTeacher = teacherSerivce.hasNumbers("Teacher");//��ȡ��������
			
			hasPages = teacherSerivce.findPages(perFolioAmount, "Teacher"); //��ȡҳ��
			
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
			this.teacher_l = (List<Teacher>)teacherSerivce.show_by_page( page, perFolioAmount, "Teacher");
			
			return SUCCESS;
		}catch(Exception e){
			e.printStackTrace();
			return INPUT;
		}
	}
	
	public String login(){
		try{
			
			permission_id=teacherSerivce.login(account, pw);
			session=ActionContext.getContext().getSession();
			if(permission_id!=null){
				
				session.put("teacher_permission", permission_id);		
				session.put("teacherInfo", account);
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
			String flag="fail";
			tip="";
			session=ActionContext.getContext().getSession();
			permission_id=(String) session.get("teacher_permission");
			if(teacherSerivce.changePassword(teacher,pw, permission_id)){
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

	/**ʵ��������ʦ����
	 * ***/
	
	public String addTeacher(){
		try{
			tip="";
			perFolioAmount = 4;   //ÿҳ��ʾ����
			session=ActionContext.getContext().getSession();			
			permission_id=(String)session.get("admin_permission");
			teacher.setPw("888888");
			Date today=DateUtil.toMyForm1(new Date());
			if(teacherSerivce.save(teacher,today, permission_id)){
				page = teacherSerivce.findPages(perFolioAmount, "Teacher"); //��ȡҳ��
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
	/**ʵ��ɾ����ʦ����
	 * ***/
	public String delTeacher(){
		try{
			String flag="";
			tip="";
			session=ActionContext.getContext().getSession();
			permission_id=(String) session.get("admin_permission");
			if(teacherSerivce.dele(teacher.getTeacher_id(), permission_id)){
				myStringAppConfigs=MyStringAppConfigs.dele_teacher_success;
				flag="success";
			}else{
				myStringAppConfigs=MyStringAppConfigs.dele_teacher_fail;
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
	 * ��ȡ������ʦ
	 * @param tip
	 */
	public void getAllTeacher(){
		session=ActionContext.getContext().getSession();			
		permission_id=(String)session.get("admin_permission");
		allTeacher_l=teacherSerivce.find(permission_id);
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("allTeacher_l", allTeacher_l);		
	}
	
	/**
	 * ��ѯ�˹����Ƿ����
	 * @param tip
	 */
	public String findTeacherById(){
		try{
			String flag="input";
			session=ActionContext.getContext().getSession();			
			permission_id=(String)session.get("admin_permission");
			if(teacherSerivce.find(teacher.getTeacher_id(), permission_id)!=null){				
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
	public void setTip(String tip) {
		this.tip = tip;
	}
	public String getTip() {
		return tip;
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

	public Teacher getTeacher() {
		return teacher;
	}
	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}
	public Long getHasTeacher() {
		return hasTeacher;
	}
	public void setHasTeacher(Long hasTeacher) {
		this.hasTeacher = hasTeacher;
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
	public List<Teacher> getTeacher_l() {
		return teacher_l;
	}
	public void setTeacher_l(List<Teacher> teacher_l) {
		this.teacher_l = teacher_l;
	}

	public List<Teacher> getAllTeacher_l() {
		return allTeacher_l;
	}

	public void setAllTeacher_l(List<Teacher> allTeacher_l) {
		this.allTeacher_l = allTeacher_l;
	}

	public String getIsTologin() {
		return isTologin;
	}

	public void setIsTologin(String isTologin) {
		this.isTologin = isTologin;
	}
}
