package com.bookshop.action;

import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.bookshop.entity.Promotion;
import com.bookshop.entity.Staff;
import com.bookshop.service.PromotionService;
import com.bookshop.util.PageUtil;
import com.opensymphony.xwork2.ActionSupport;
/**
 * 优惠活动信息Action层
 * @author Winds
 *
 */
@SuppressWarnings("serial")
public class PromotionAction extends ActionSupport {
	@Resource
	private PromotionService promotionService;
	private Promotion promotion;
	private Long hasPromotion; // 数据的条数
	private int page; // 当前页
	private int hasPages; // 页数
	private int perFolioAmount; // 每页数据的条数
	private List<Integer> page_l;
	private List<Promotion> promotion_l;
	private boolean isLike;
	private int status; //0:没过期 1：已过期
	private String promotion_catagorys;  //优惠的图书分类
	/**
	 * 分页获取优惠信息
	 * @return
	 */
	public String showPromotion_by_page() {
		try{
		perFolioAmount = 2; // 每页显示条数
		this.hasPromotion = promotionService.hasNumbers(status); // 获取数据条数
		hasPages = PageUtil.findAllPages(perFolioAmount, hasPromotion);; // 获取页数
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
		this.promotion_l = (List<Promotion>) promotionService.show_by_page(page, perFolioAmount,status);
		if(status==0){
			return "success1";
		}else{
			return "success2";
		}	
		}catch(Exception e){
			e.printStackTrace();
			return "input";
		}
	}
	
	/**
	 * 添加优惠信息
	 * @return
	 */
	public String addPromotion(){
		try{
			if(promotionService.add(promotion)){
				this.status=0;
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
	 * 删除优惠
	 */
	public void deletePromotion(){
		try{
			String flag="input";
			if(promotionService.delete(promotion.getPromotion_id())){				
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
	 * 获取没过期的优惠信息
	 */
	public String gainPromotion(){
		try{
			this.promotion=promotionService.find(promotion.getPromotion_id());
			if(promotion!=null){
				this.promotion_catagorys=promotionService.gainCatagory_l(promotion.getPromotion_catagorys());
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
	 * 修改未过期的优惠信息
	 */
	public String updatePromotion(){
		try{			
			if(promotionService.update(promotion)){
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
	 * 删除未过期优惠
	 */
	public void findNotExpirePromotion_by_time(){
		try{
			String flag="input";
			if(promotionService.findNotExpirePromotion_by_time(promotion.getPromotion_id())){
				promotionService.delete(promotion.getPromotion_id());
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
	@Override
	public void validate() {
		// TODO Auto-generated method stub
		clearFieldErrors(); clearActionErrors(); clearMessages();
	}
	public Promotion getPromotion() {
		return promotion;
	}
	public void setPromotion(Promotion promotion) {
		this.promotion = promotion;
	}

	public Long getHasPromotion() {
		return hasPromotion;
	}

	public void setHasPromotion(Long hasPromotion) {
		this.hasPromotion = hasPromotion;
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

	public List<Promotion> getPromotion_l() {
		return promotion_l;
	}

	public void setPromotion_l(List<Promotion> promotion_l) {
		this.promotion_l = promotion_l;
	}

	public boolean isLike() {
		return isLike;
	}

	public void setLike(boolean isLike) {
		this.isLike = isLike;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	@Override
	public void clearActionErrors() {
		// TODO Auto-generated method stub
		super.clearActionErrors();
	}

	public String getPromotion_catagorys() {
		return promotion_catagorys;
	}

	public void setPromotion_catagorys(String promotion_catagorys) {
		this.promotion_catagorys = promotion_catagorys;
	}
}
