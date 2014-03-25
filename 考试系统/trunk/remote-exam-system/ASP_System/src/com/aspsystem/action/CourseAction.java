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
	
	private Long hasCourse;   //数据的总个数
	private int page;		 //当前页
	private int hasPages;	 //总页数
	private int perFolioAmount;  //每页数据的条数
	private List<Integer> page_l;//获取一个从1到hasPages的数组
	private List<Course> Course_l; //当前页的数据
	private List<Course> allCourse_l; //当所有的数据
	private Map<String,Object> session;
	private String permission_id;	
	private String idArray;   //获取批量删除的id
	//ajax验证关联的参数
	private String validateId;
	private String validateValue;
	private String validateError;
	private String validateReturn;
	/**
	 * 获取分页显示Course所需要数据
	 * 
	 */
	public String showCourse_by_page(){
		try{		
			perFolioAmount = 4;   //每页显示条数
			this.hasCourse = courseSerivce.hasNumbers("Course");//获取数据条数
			
			hasPages = courseSerivce.findPages(perFolioAmount, "Course"); //获取页数
			
			this.page_l = PageUtil.getPageList(hasPages);  //获取一个从1到hasPages的数组
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
			//获取当前页的数据
			this.Course_l = (List<Course>)courseSerivce.show_by_page( page, perFolioAmount, "Course");
			
			return SUCCESS;
		}catch(Exception e){
			e.printStackTrace();
			return INPUT;
		}
	}
	
	/**
	 * 
	 * 实现新增科目功能
	 */
	public String addCourse(){
		try{
			session=ActionContext.getContext().getSession();			
			permission_id=(String)session.get("admin_permission");
			if(courseSerivce.save(course, permission_id)){
				page = courseSerivce.findPages(perFolioAmount, "Course"); //获取页数
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
	 * 实现更新科目功能
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
	 * 实现删除科目功能
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
	 * 查询此科目有没有和题目关联
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
			// 直接输入响应的内容
			out.print(flag);
			out.flush();
			out.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * 验证课程名是否可用（简建鸿）
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
			// 直接输入响应的内容
			out.print(flag);
			out.flush();
			out.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * 实现批量删除科目
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
	 * 验证课程名是否可用
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
	 * 查找所有科目
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
