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
	private Long hasMyClass;   //���ݵ��ܸ���
	private int page;		 //��ǰҳ
	private int hasPages;	 //��ҳ��
	private int perFolioAmount;  //ÿҳ���ݵ�����
	private List<Integer> page_l;//��ȡһ����1��hasPages������
	private List<MyClass> MyClass_l; //��ǰҳ������
	private List<MyClass> allMyClass_l; //�����е�����
	private Map<String,Object> session;
	private String permission_id;
	private String idArray;
	private MyStringAppConfigs myStringAppConfigs;  
	/**
	 * ��ȡ��ҳ��ʾMyClass����Ҫ����
	 * 
	 */
	public String showMyClass_by_page(){
		try{			
			perFolioAmount = 4;   //ÿҳ��ʾ����
			this.hasMyClass = myClassSerivce.hasNumbers("MyClass");//��ȡ��������
			
			hasPages = myClassSerivce.findPages(perFolioAmount, "MyClass"); //��ȡҳ��
			
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
			this.MyClass_l = (List<MyClass>)myClassSerivce.show_by_page( page, perFolioAmount, "MyClass");

			return SUCCESS;
		}catch(Exception e){
			e.printStackTrace();
			return INPUT;
		}
	}
	
	
	/**
	 * 
	 * ʵ�������༶����
	 */
	public String addMyClass(){
		try{
			tip="";
			session=ActionContext.getContext().getSession();			
			permission_id=(String)session.get("admin_permission");
			if(myClassSerivce.save(myClass, permission_id)){
				page = myClassSerivce.findPages(perFolioAmount, "MyClass"); //��ȡҳ��
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
	 * �޸İ༶��Ϣ
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
	 * ����ɾ��
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
	 * ����ɾ��
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
	 * ��ȡ���а༶
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
	 * ���Ҵ˰༶�Ƿ���ѧ��
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
			// ֱ��������Ӧ������
			out.print(flag);
			out.flush();
			out.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	/**
	 * ��ѯ�˰������Ƿ���Ч
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
			// ֱ��������Ӧ������
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
