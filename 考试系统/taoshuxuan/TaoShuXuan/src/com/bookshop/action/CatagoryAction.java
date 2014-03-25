package com.bookshop.action;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;

import org.apache.struts2.ServletActionContext;

import com.bookshop.entity.Catagory;
import com.bookshop.service.CatagoryService;
import com.bookshop.util.PageUtil;
import com.opensymphony.xwork2.ActionSupport;
/**
 * 图书分类信息Action层
 * @author Winds
 *
 */
@SuppressWarnings("serial")
public class CatagoryAction extends ActionSupport {
	@Resource
	private CatagoryService catagoryService;
	private Catagory catagory;
	private Long hasCatagory; // 数据的条数
	private int page; // 当前页
	private int hasPages; // 页数
	private int perFolioAmount; // 每页数据的条数
	private List<Integer> page_l;
	private List<Catagory> catagory_l;
	private int status; //图书分类的父类
	private int firstCatagory_id; //第一级分类
	private boolean isLike;
	/**
	 * 分页获取图书分类信息
	 * @return String
	 */
	public String showCatagory_by_page() {
		try{
		perFolioAmount = 2; // 每页显示条数
		String[] parms = null;
		String[] values = null;
		this.hasCatagory = catagoryService.hasNumbers("Catagory", parms, values, isLike); // 获取数据条数
		hasPages = PageUtil.findAllPages(perFolioAmount, hasCatagory); // 获取页数
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
		this.catagory_l = (List<Catagory>) catagoryService.show_by_page(page, perFolioAmount, "Catagory", parms, values, isLike);
		return "success";
		}catch(Exception e){
			e.printStackTrace();
			return "input";
		}
	}
	
	/**
	 * 修改图书分类
	 * @return void
	 */
	public void changeCatagoryName(){
		try{
			String flag="input";
			if(catagoryService.updateName(catagory)){				
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
	 * 查询此分类是否还有子类或图书
	 * @return
	 */
	public void findSubCatagory(){
		try{
			String flag="input";
			if(catagoryService.find(catagory.getCatagory_id())){				
				flag="success";
			}else{
				catagoryService.delete(catagory.getCatagory_id());
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
	 * 获取图书一级分类
	 * @return
	 */
	public void findFirstCatagory(){
		try{
			this.catagory_l=catagoryService.findAllFirstCatagory();	
			HttpServletRequest request=ServletActionContext.getRequest();
			request.setAttribute("catagory_l", this.catagory_l);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	/**
	 * 获取图书所有二级分类
	 * @return
	 */
	public void gainSecondCatagory(){
		try{
			this.catagory_l=catagoryService.findAllSecondCatagory();	
			HttpServletRequest request=ServletActionContext.getRequest();
			request.setAttribute("catagory_l", this.catagory_l);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	/**
	 * 获取图书某一个一级分类的所有二级分类
	 * @return
	 */
	public void findSecondCatagory(){
		try {
			if(!catagory.getCatagory_id().equals("0")){
				catagory_l=catagoryService.findAll(catagory.getCatagory_id());
			}else{
				catagory_l=new ArrayList<Catagory>();
			}	
//			System.out.println(board_l.size());
			  JsonConfig config = new JsonConfig();
			  config.setIgnoreDefaultExcludes(false);   
			  config.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT); 
//			  config.registerJsonValueProcessor(Date.class,new DateJsonValueProcessor("yyyy-MM-dd")); //date processor register
//			  config.setExcludes(new String[]{//只要设置这个数组，指定过滤哪些字段。
//			    "bigBoard",			   
//			  });			 
			JSONArray  jsonObject = JSONArray.fromObject(catagory_l,config); 	
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			// 直接输入响应的内容
			out.print(jsonObject.toString());
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/*
	 * 根据分类名称查询
	 */
	public void findCatagory(){
		try{
			String flag="input";
			String catagory_name=new String(catagory.getCatagory_name().getBytes("iso-8859-1"),"utf-8");
			if(catagoryService.find(catagory_name)!=null){				
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
	 * 添加分类
	 * @return
	 */
	public String addCatagory(){
		try{
			if(catagoryService.add(catagory,firstCatagory_id)){
				return "success";
			}else{
				return "input";
			}			
		}catch(Exception e){
			e.printStackTrace();
			return "input";
		}
	}
	
	/**
	 * 打折
	 * @return
	 */
	public void changeCatagoryDiscount(){
		try{
			String flag="input";
			if(catagoryService.updateDiscount(catagory)){				
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
	public Catagory getCatagory() {
		return catagory;
	}
	public void setCatagory(Catagory catagory) {
		this.catagory = catagory;
	}
	public Long getHasCatagory() {
		return hasCatagory;
	}
	public void setHasCatagory(Long hasCatagory) {
		this.hasCatagory = hasCatagory;
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
	public List<Catagory> getCatagory_l() {
		return catagory_l;
	}
	public void setCatagory_l(List<Catagory> catagory_l) {
		this.catagory_l = catagory_l;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getFirstCatagory_id() {
		return firstCatagory_id;
	}

	public void setFirstCatagory_id(int firstCatagory_id) {
		this.firstCatagory_id = firstCatagory_id;
	}

	public boolean isLike() {
		return isLike;
	}

	public void setLike(boolean isLike) {
		this.isLike = isLike;
	}

}
