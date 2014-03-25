package com.bookshop.action;

import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.bookshop.entity.PaymentMethod;
import com.bookshop.service.PaymentMethodService;
import com.bookshop.util.PageUtil;
import com.opensymphony.xwork2.ActionSupport;
/**
 * 付款方式Action层
 * @author Winds
 *
 */
@SuppressWarnings("serial")
public class PaymentMethodAction extends ActionSupport {
	@Resource
	private PaymentMethodService paymentMethodService;
	private PaymentMethod paymentMethod;
	private Long hasPaymentMethod; // 数据的条数
	private int page; // 当前页
	private int hasPages; // 页数
	private int perFolioAmount; // 每页数据的条数
	private List<Integer> page_l;
	private List<PaymentMethod> paymentMethod_l;
	private boolean isLike;
	/**
	 * 分页获取员工信息
	 * @return
	 */
	public String showPaymentMethod_by_page() {
		try{
		perFolioAmount = 2; // 每页显示条数
		String[] parms = null;
		String[] values = null;
		this.hasPaymentMethod = paymentMethodService.hasNumbers("PaymentMethod",parms,values,isLike); // 获取数据条数
		hasPages = PageUtil.findAllPages(perFolioAmount, hasPaymentMethod);; // 获取页数
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
		this.paymentMethod_l = (List<PaymentMethod>) paymentMethodService.show_by_page(page, perFolioAmount, "PaymentMethod", parms,values,isLike);
		return "success";
		}catch(Exception e){
			e.printStackTrace();
			return "input";
		}
	}
	
	/**
	 * 查找支付方式
	 * @return
	 */
	public void findPaymentMethod(){
		try {
			String flag = "input";
			String name=new String(paymentMethod.getName().getBytes("iso-8859-1"),"utf-8");
			if (paymentMethodService.find(name) != null) {
				flag = "success";
			}
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			// 直接输入响应的内容
			out.print(flag);
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 添加支付方式
	 * @return
	 */
	public String addPaymentMethod(){
		try {
			if(paymentMethodService.add(paymentMethod)){
				return "success";
			}else{
				return "input";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "input";
		}
	}
	
	/**
	 * 修改支付方式
	 * @return
	 */
	public void changePaymentMethodName(){
		try {
			String flag = "input";
			if (paymentMethodService.update(paymentMethod)) {
				flag = "success";
			}
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			// 直接输入响应的内容
			out.print(flag);
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 查看支付方式有没有使用
	 * @return
	 */
	public void findPaymentMethod_use(){
		try {
			String flag = "input";
			if (!paymentMethodService.findPaymentMethod_use(paymentMethod.getPayment_method_id())) {
				paymentMethodService.delete(paymentMethod.getPayment_method_id());
				flag = "success";
			}
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			// 直接输入响应的内容
			out.print(flag);
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 查询所有的支付方式
	 * @return
	 */
	public void findAllPaymentMethod(){
		paymentMethod_l = paymentMethodService.findAll();
		 HttpServletRequest request = ServletActionContext.getRequest();
		 request.setAttribute("paymentMethod_l", paymentMethod_l);
	}
	public PaymentMethod getPaymentMethod() {
		return paymentMethod;
	}
	public void setPaymentMethod(PaymentMethod paymentMethod) {
		this.paymentMethod = paymentMethod;
	}

	public Long getHasPaymentMethod() {
		return hasPaymentMethod;
	}

	public void setHasPaymentMethod(Long hasPaymentMethod) {
		this.hasPaymentMethod = hasPaymentMethod;
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

	public List<PaymentMethod> getPaymentMethod_l() {
		return paymentMethod_l;
	}

	public void setPaymentMethod_l(List<PaymentMethod> paymentMethod_l) {
		this.paymentMethod_l = paymentMethod_l;
	}

	public boolean isLike() {
		return isLike;
	}

	public void setLike(boolean isLike) {
		this.isLike = isLike;
	}

}
