package com.bookshop.action;

import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.bookshop.entity.Book;
import com.bookshop.entity.Collection;
import com.bookshop.service.CollectionService;
import com.bookshop.util.PageUtil;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
/**
 * 收藏信息Action层
 * @author Winds
 *
 */
@SuppressWarnings("serial")
public class CollectionAction extends ActionSupport {
	@Resource
	private CollectionService collectionService;
	private Collection colletion;
	private List<Long> collectionNum_l; //分页数据中的各图书的收藏数
	private Long hasRecord;//数据的总个数
	private int page;		 //当前页
	private int hasPages;	 //总页数
	private int perFolioAmount;  //每页数据的条数
	private List<Integer> page_l;//获取一个从1到hasPages的数组
	private List <Collection> Record_l; //当前页的数据
	private String customerEmai;
	private String collectionIdStr; //批量删除的id串
	private Book book;
	
	/**
	 * 查看会员的收藏
	 * @return
	 */
	public String show_collection_by_page(){
		try{
			perFolioAmount = 2; // 每页显示条数
			String[] parms = new String[]{"customer.email"};
			String[] values = new String[]{customerEmai};
			boolean isLike = false;
			this.hasRecord = collectionService.hasNumbers("Collection",parms,values,isLike); // 获取数据条数
			hasPages = PageUtil.findAllPages(perFolioAmount, hasRecord);; // 获取页数
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


			this.Record_l = (List<Collection>) collectionService.show_by_page(page, perFolioAmount, "Collection", parms,values,isLike);
			this.collectionNum_l=collectionService.findColletionNum(Record_l);
			return "success";
		}catch(Exception e){
			e.printStackTrace();
			return "input";
		}
	}
	/**
	 * 删除会员的收藏记录
	 * @return
	 */
	public void deleteCollection(){
		try{
			String flag="input";
			if(collectionService.delete(colletion.getCollection_id())){				
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
	 * 批量删除会员的收藏记录
	 * @return
	 */
	public void deleteBatchCollection(){
		try{
			String flag="input";
			if(collectionService.deleteBatch(collectionIdStr)){				
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
	 * 添加收藏
	 * @return
	 */
	public void addToCollection(){
		try{
			String flag="input";
			String customer_email = ActionContext.getContext().getSession().get("customer_email").toString();
			int result = collectionService.addToCollection(book.getBook_id(), customer_email);
			if(result==1){				
				flag="success";
			}else if(result==0){
				flag="repeat";
			}else{
				flag="input";
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
	public Collection getColletion() {
		return colletion;
	}
	public void setColletion(Collection colletion) {
		this.colletion = colletion;
	}
	public String getCustomerEmai() {
		return customerEmai;
	}
	public void setCustomerEmai(String customerEmai) {
		this.customerEmai = customerEmai;
	}
	public Long getHasRecord() {
		return hasRecord;
	}
	public void setHasRecord(Long hasRecord) {
		this.hasRecord = hasRecord;
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
	public List<Collection> getRecord_l() {
		return Record_l;
	}
	public void setRecord_l(List<Collection> record_l) {
		Record_l = record_l;
	}
	public List<Long> getCollectionNum_l() {
		return collectionNum_l;
	}
	public void setCollectionNum_l(List<Long> collectionNum_l) {
		this.collectionNum_l = collectionNum_l;
	}
	public String getCollectionIdStr() {
		return collectionIdStr;
	}
	public void setCollectionIdStr(String collectionIdStr) {
		this.collectionIdStr = collectionIdStr;
	}
	public CollectionService getCollectionService() {
		return collectionService;
	}
	public void setCollectionService(CollectionService collectionService) {
		this.collectionService = collectionService;
	}
	public Book getBook() {
		return book;
	}
	public void setBook(Book book) {
		this.book = book;
	}
	
}
