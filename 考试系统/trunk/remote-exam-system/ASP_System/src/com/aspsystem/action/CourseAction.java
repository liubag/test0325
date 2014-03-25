package com.aspsystem.action;


import java.io.PrintWriter;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.aspsystem.entity.Course;
import com.aspsystem.serivce.CourseSerivce;
import com.aspsystem.util.PageUtil;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings({"serial","unchecked"})
public class CourseAction extends  ActionSupport{
	
	@Resource
	private CourseSerivce courseSerivce;
	private Course course;
	
	private Long hasCourse;   //���ݵ��ܸ���
	private int page;		 //��ǰҳ
	private int hasPages;	 //��ҳ��
	private int perFolioAmount;  //ÿҳ���ݵ�����
	private List<Integer> page_l;//��ȡһ����1��hasPages������
	private List<Course> Course_l; //��ǰҳ������
	private List<Course> allCourse_l; //�����е�����
	private Map<String,Object> session;
	private String permission_id;	
	private String idArray;   //��ȡ����ɾ����id
	//ajax��֤�����Ĳ���
	private String validateId;
	private String validateValue;
	private String validateError;
	private String validateReturn;
	/**
	 * ��ȡ��ҳ��ʾCourse����Ҫ����
	 * 
	 */
	public String showCourse_by_page(){
		try{		
			perFolioAmount = 4;   //ÿҳ��ʾ����
			this.hasCourse = courseSerivce.hasNumbers("Course");//��ȡ��������
			
			hasPages = courseSerivce.findPages(perFolioAmount, "Course"); //��ȡҳ��
			
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
			this.Course_l = (List<Course>)courseSerivce.show_by_page( page, perFolioAmount, "Course");
			
			return SUCCESS;
		}catch(Exception e){
			e.printStackTrace();
			return INPUT;
		}
	}
	
	/**
	 * 
	 * ʵ��������Ŀ����
	 */
	public String addCourse(){
		try{
			session=ActionContext.getContext().getSession();			
			permission_id=(String)session.get("admin_permission");
			if(courseSerivce.save(course, permission_id)){
				page = courseSerivce.findPages(perFolioAmount, "Course"); //��ȡҳ��
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
	/**
	 * ʵ�ָ��¿�Ŀ����
	 * @return
	 */
	public String updateCourse(){
		try{
			session=ActionContext.getContext().getSession();			
			permission_id=(String)session.get("admin_permission");
			if(courseSerivce.update(course, permission_id)){
				return SUCCESS;
			}else
				return INPUT;
		}catch(Exception e){
			e.printStackTrace();
			return INPUT;
		}
	}
	
	/**
	 * ʵ��ɾ����Ŀ����
	 * @return
	 */
	
	public String deletCourse(){
		try{
			session=ActionContext.getContext().getSession();			
			permission_id=(String)session.get("admin_permission");
			if(courseSerivce.dele(course.getCourse_id(), permission_id)){
				return SUCCESS;
			}else
				return INPUT;
		}catch(Exception e){
			e.printStackTrace();
			return INPUT;
		}
	}
	
	/**
	 * ��ѯ�˿�Ŀ��û�к���Ŀ����
	 * @return
	 */
	public String findCourse(){
		try{
			String flag="input";
			session=ActionContext.getContext().getSession();			
			permission_id=(String)session.get("admin_permission");
			if(courseSerivce.findCourse(course.getCourse_id(), permission_id)){				
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
	/**
	 * ��֤�γ����Ƿ���ã��򽨺裩
	 * @return
	 */
	public String findCourseByName(){
		try{
			String flag="input";
			session=ActionContext.getContext().getSession();			
			permission_id=(String)session.get("admin_permission");
			if(courseSerivce.find(course.getCourse_name(), permission_id)!=null){				
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
	/**
	 * ʵ������ɾ����Ŀ
	 * 
	 */
	public String deletCourseBatch(){
		try{
			session=ActionContext.getContext().getSession();			
			permission_id=(String)session.get("admin_permission");	
			if(courseSerivce.deleBatch(idArray.trim(), permission_id)){}
			return SUCCESS;
		}catch(Exception e){
			e.printStackTrace();
			return INPUT;
		}
	}
	
	/**
	 * ��֤�γ����Ƿ����
	 * @return
	 */
	public void checkCourseByName(){
		try {
			session=ActionContext.getContext().getSession();			
			permission_id=(String)session.get("admin_permission");
			
			validateReturn = "{'jsonValidateReturn':[";

			validateReturn += "'" + validateId + "',";
			validateReturn += "'" + validateError + "',";
			if (courseSerivce.find(validateValue, permission_id)==null) {
				validateReturn += "'true']}";
			} else {
				validateReturn += "'false']}";
			}	
			 HttpServletResponse response = ServletActionContext.getResponse();      
			    response.setCharacterEncoding("UTF-8");      
			    response.getWriter().write(validateReturn);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
	}
	/**
	 * �������п�Ŀ
	 * @return
	 */
	public void getAllCourse(){
		try{
			session=ActionContext.getContext().getSession();			
			permission_id=(String)session.get("admin_permission");
			allCourse_l=courseSerivce.find(permission_id);
			HttpServletRequest request = ServletActionContext.getRequest();
			request.setAttribute("allCourse_l", allCourse_l);
			
			
		}catch(Exception e){
			e.printStackTrace();
			
		}
	}

	public Course getCourse() {
		return course;
	}
	public void setCourse(Course course) {
		this.course = course;
	}
	public Long getHasCourse() {
		return hasCourse;
	}
	public void setHasCourse(Long hasCourse) {
		this.hasCourse = hasCourse;
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
	public List<Course> getCourse_l() {
		return Course_l;
	}
	public void setCourse_l(List<Course> course_l) {
		Course_l = course_l;
	}
	public List<Course> getAllCourse_l() {
		return allCourse_l;
	}

	public void setAllCourse_l(List<Course> allCourse_l) {
		this.allCourse_l = allCourse_l;
	}

	public String getValidateId() {
		return validateId;
	}

	public void setValidateId(String validateId) {
		this.validateId = validateId;
	}

	public String getValidateValue() {
		return validateValue;
	}

	public void setValidateValue(String validateValue) {
		this.validateValue = validateValue;
	}

	public String getValidateError() {
		return validateError;
	}

	public void setValidateError(String validateError) {
		this.validateError = validateError;
	}

	public String getValidateReturn() {
		return validateReturn;
	}

	public void setValidateReturn(String validateReturn) {
		this.validateReturn = validateReturn;
	}

	public String getIdArray() {
		return idArray;
	}

	public void setIdArray(String idArray) {
		this.idArray = idArray;
	}
	
}
