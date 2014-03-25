package com.aspsystem.action;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.aspsystem.entity.MyClass;
import com.aspsystem.serivce.MyClassSerivce;
import com.aspsystem.util.MyStringAppConfigs;
import com.aspsystem.util.PageUtil;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings({"serial","unchecked"})
public class MyClassAction extends  ActionSupport{
	
	@Resource
	private MyClassSerivce myClassSerivce;
	private MyClass myClass;
	private String tip;
	private Long hasMyClass;   //数据的总个数
	private int page;		 //当前页
	private int hasPages;	 //总页数
	private int perFolioAmount;  //每页数据的条数
	private List<Integer> page_l;//获取一个从1到hasPages的数组
	private List<MyClass> MyClass_l; //当前页的数据
	private List<MyClass> allMyClass_l; //当所有的数据
	private Map<String,Object> session;
	private String permission_id;
	private String idArray;
	private MyStringAppConfigs myStringAppConfigs;  
	/**
	 * 获取分页显示MyClass所需要数据
	 * 
	 */
	public String showMyClass_by_page(){
		try{			
			perFolioAmount = 4;   //每页显示条数
			this.hasMyClass = myClassSerivce.hasNumbers("MyClass");//获取数据条数
			
			hasPages = myClassSerivce.findPages(perFolioAmount, "MyClass"); //获取页数
			
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
			this.MyClass_l = (List<MyClass>)myClassSerivce.show_by_page( page, perFolioAmount, "MyClass");

			return SUCCESS;
		}catch(Exception e){
			e.printStackTrace();
			return INPUT;
		}
	}
	
	
	/**
	 * 
	 * 实现新增班级功能
	 */
	public String addMyClass(){
		try{
			tip="";
			session=ActionContext.getContext().getSession();			
			permission_id=(String)session.get("admin_permission");
			if(myClassSerivce.save(myClass, permission_id)){
				page = myClassSerivce.findPages(perFolioAmount, "MyClass"); //获取页数
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
	 * 修改班级信息
	 * @return
	 */
	public String updateMyClass(){
		try{
			session=ActionContext.getContext().getSession();			
			permission_id=(String)session.get("admin_permission");
			if(myClassSerivce.update(myClass, permission_id)){
				return SUCCESS;
			}else
				return INPUT;
		}catch(Exception e){
			e.printStackTrace();
			return INPUT;
		}
	}
	
	/**
	 * 单个删除
	 * @return
	 */
	public String deletMyClass(){
		try{
			session=ActionContext.getContext().getSession();			
			permission_id=(String)session.get("admin_permission");
			if(myClassSerivce.dele(myClass.getClass_id(), permission_id)){
				return SUCCESS;
			}else
				return INPUT;
		}catch(Exception e){
			e.printStackTrace();
			return INPUT;
		}
	}
	
	/**
	 * 批量删除
	 * @return
	 */
	public String deletMyClassBatch(){
		try{
			String flag="";
			tip="";
			session=ActionContext.getContext().getSession();			
			permission_id=(String)session.get("admin_permission");	
			if(myClassSerivce.deleBatch(idArray.trim(), permission_id)){
				myStringAppConfigs=MyStringAppConfigs.dele_myclass_success;
				flag="success";
			}else{
				myStringAppConfigs=MyStringAppConfigs.dele_myclass_fail;
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
	 * 获取所有班级
	 * @return
	 */
	public String gainMyClass(){
		try{
			tip="";
			String flag="";
			session=ActionContext.getContext().getSession();			
			permission_id=(String)session.get("admin_permission");	
			allMyClass_l=myClassSerivce.find(permission_id);
			HttpServletRequest request = ServletActionContext.getRequest();
			request.setAttribute("allMyClass_l", allMyClass_l);
			if(allMyClass_l==null){				
				myStringAppConfigs=MyStringAppConfigs.find_course_fail;
				flag="input";
			}else{
				myStringAppConfigs=MyStringAppConfigs.find_course_success;
				flag="success";
			}
			tip=myStringAppConfigs.getValue();	
			return flag;
		}catch(Exception e){
			e.printStackTrace();
			return INPUT;
		}
	}
	
	/**
	 * 查找此班级是否有学生
	 * @return
	 */
	public void findMyClass(){
		try{
			String flag="input";
			session=ActionContext.getContext().getSession();			
			permission_id=(String)session.get("admin_permission");
			if(myClassSerivce.findMyClass(myClass.getClass_id(), permission_id)){				
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
	}
	/**
	 * 查询此班名称是否有效
	 * @return
	 */
	public String findClassByName(){
		try{
			String flag="input";
			session=ActionContext.getContext().getSession();			
			permission_id=(String)session.get("admin_permission");
			if(myClassSerivce.find(myClass.getClass_name(), permission_id)!=null){				
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
	public Long getHasMyClass() {
		return hasMyClass;
	}
	public void setHasMyClass(Long hasMyClass) {
		this.hasMyClass = hasMyClass;
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
	public List<MyClass> getMyClass_l() {
		return MyClass_l;
	}
	public void setMyClass_l(List<MyClass> myClass_l) {
		MyClass_l = myClass_l;
	}

	public List<MyClass> getAllMyClass_l() {
		return allMyClass_l;
	}


	public void setAllMyClass_l(List<MyClass> allMyClass_l) {
		this.allMyClass_l = allMyClass_l;
	}


	public MyClass getMyClass() {
		return myClass;
	}
	public void setMyClass(MyClass myClass) {
		this.myClass = myClass;
	}


	public String getIdArray() {
		return idArray;
	}


	public void setIdArray(String idArray) {
		this.idArray = idArray;
	}


	public String getTip() {
		return tip;
	}


	public void setTip(String tip) {
		this.tip = tip;
	}



	
}
