package com.bookshop.action;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.bookshop.entity.Staff;
import com.bookshop.service.StaffService;
import com.bookshop.util.PageUtil;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
/**
 * 员工Action层
 * @author Winds
 *
 */
@SuppressWarnings("serial")
public class StaffAction extends ActionSupport {
	@Resource
	private StaffService staffService;
	private Staff staff;
	private Long hasStaff; // 数据的条数
	private int page; // 当前页
	private int hasPages; // 页数
	private int perFolioAmount; // 每页数据的条数
	private List<Integer> page_l;
	private List<Staff> staff_l;
	private Map<String,Object> session ;
	
	private String oldPassword;
	private String newPassword;

	
	private String staff_id;  //搜索的id
	private String staff_name;//搜索的name
	private String staff_status;//搜索的status
	private boolean isLike;

	/**
	 * 查找是否存在staff_id的员工
	 *
	 */
	public void findStaff(){
		try{
			String flag="input";
			String id=new String(staff.getStaff_id().getBytes("iso-8859-1"),"utf-8");
			if(staffService.find(id)!=null){				
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
	/*
	 * 添加员工
	 */
	public String addStaff(){
		try{
			String flag="input";			
			staff.setPw("888888");
			staff.setJoin_date(new Date());
			staff.setStatus(1);
			staff.setRemove_date(null);
			System.out.println(staff.getName());
			if(staffService.save(staff)){				
				flag="success";
			}					
			return flag;
		}catch(Exception e){
			e.printStackTrace();
			return "input";
		}
	}
	
	/**
	 * 分页获取员工信息
	 * @return
	 */
	public String showStaff_by_page() {
		try{
		perFolioAmount = 2; // 每页显示条数
		String[] parms = null;
		String[] values = null;
		this.hasStaff = staffService.hasNumbers("Staff",parms,values,isLike); // 获取数据条数
		hasPages = PageUtil.findAllPages(perFolioAmount, hasStaff);; // 获取页数
		this.page_l = PageUtil.getPageList(hasPages); // 获取一个从1到hasPages的数组
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
		// 获取当前页的数据


		this.staff_l = (List<Staff>) staffService.show_by_page(page, perFolioAmount, "Staff", parms,values,isLike);

		return "success";
		}catch(Exception e){
			e.printStackTrace();
			return "input";
		}
	}
	
	/**
	 * 切换staff的状态
	 * @return
	 */
	public void changeStaffState(){
		try{
			String flag="input";
			String id=new String(staff.getStaff_id().getBytes("iso-8859-1"),"utf-8");
			int state=staffService.updateState(id);
			if(state==1){				
				flag="success1";
			}else if(state==0){
				flag="success2";
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
	 * 获取完整的staff信息
	 * @return
	 */
	public String gainStaff(){
		try{
			String flag="input";
			String id=new String(staff.getStaff_id().getBytes("iso-8859-1"),"utf-8");
			this.staff=staffService.find(id);
			if(staff!=null){				
				flag="success";
			}	
			return flag;
		}catch(Exception e){
			e.printStackTrace();
			return "input";
		}		
	}
	
	
	
	
	/**
	 * 修改员工信息
	 * @return
	 */
	public String ModifyStaff(){

		try{
			String flag="input";
			if(staffService.update(staff)){				
				flag="success";
			}	
			return flag;
		}catch(Exception e){
			e.printStackTrace();
			return "input";
		}
	}
	/**
	 * 员工登录
	 */
	public String login(){
		try{
			if(staffService.login(staff.getStaff_id(), staff.getPw()) !=null){
				session = ActionContext.getContext().getSession();
				session.put("staff_id",staff.getStaff_id());
				return SUCCESS;
			}return "input";
		}catch(Exception e){
			e.printStackTrace();
			return "input";
		}
	}
	 /**
	  * 修改员工密码
	  * @return
	  */
	public void changeStaffPassword(){
		String flag ="input";
		try{
			flag=staffService.changePassword(staff.getStaff_id(), oldPassword, newPassword);
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			out.print(flag);
			out.flush();
			out.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	public Staff getStaff() {
		return staff;
	}

	public void setStaff(Staff staff) {
	
		this.staff = staff;
	}

	public Long getHasStaff() {
		return hasStaff;
	}

	public void setHasStaff(Long hasStaff) {
		this.hasStaff = hasStaff;
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

	public List<Staff> getStaff_l() {
		return staff_l;
	}

	public void setStaff_l(List<Staff> staff_l) {
		this.staff_l = staff_l;
	}
	public StaffService getStaffService() {
		return staffService;
	}
	public void setStaffService(StaffService staffService) {
		this.staffService = staffService;
	}
	public String getOldPassword() {
		return oldPassword;
	}
	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
	}
	public String getNewPassword() {
		return newPassword;
	}
	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}
	public boolean isLike() {
		return isLike;
	}
	public void setLike(boolean isLike) {
		this.isLike = isLike;
	}
	public String getStaff_id() {
		return staff_id;
	}
	public void setStaff_id(String staff_id) {
		this.staff_id = staff_id;
	}
	public String getStaff_name() {
		return staff_name;
	}
	public void setStaff_name(String staff_name) {
		this.staff_name = staff_name;
	}
	public String getStaff_status() {
		return staff_status;
	}
	public void setStaff_status(String staff_status) {
		this.staff_status = staff_status;
	}
	
}
