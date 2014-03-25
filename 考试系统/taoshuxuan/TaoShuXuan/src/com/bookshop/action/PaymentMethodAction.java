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
 * ���ʽAction��
 * @author Winds
 *
 */
@SuppressWarnings("serial")
public class PaymentMethodAction extends ActionSupport {
	@Resource
	private PaymentMethodService paymentMethodService;
	private PaymentMethod paymentMethod;
	private Long hasPaymentMethod; // ���ݵ�����
	private int page; // ��ǰҳ
	private int hasPages; // ҳ��
	private int perFolioAmount; // ÿҳ���ݵ�����
	private List<Integer> page_l;
	private List<PaymentMethod> paymentMethod_l;
	private boolean isLike;
	/**
	 * ��ҳ��ȡԱ����Ϣ
	 * @return
	 */
	public String showPaymentMethod_by_page() {
		try{
		perFolioAmount = 2; // ÿҳ��ʾ����
		String[] parms = null;
		String[] values = null;
		this.hasPaymentMethod = paymentMethodService.hasNumbers("PaymentMethod",parms,values,isLike); // ��ȡ��������
		hasPages = PageUtil.findAllPages(perFolioAmount, hasPaymentMethod);; // ��ȡҳ��
		this.page_l = PageUtil.getPageList(hasPages); // ��ȡһ����1��hasPages������
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
		// ��ȡ��ǰҳ������
		this.paymentMethod_l = (List<PaymentMethod>) paymentMethodService.show_by_page(page, perFolioAmount, "PaymentMethod", parms,values,isLike);
		return "success";
		}catch(Exception e){
			e.printStackTrace();
			return "input";
		}
	}
	
	/**
	 * ����֧����ʽ
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
			// ֱ��������Ӧ������
			out.print(flag);
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * ���֧����ʽ
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
	 * �޸�֧����ʽ
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
			// ֱ��������Ӧ������
			out.print(flag);
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * �鿴֧����ʽ��û��ʹ��
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
			// ֱ��������Ӧ������
			out.print(flag);
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * ��ѯ���е�֧����ʽ
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
