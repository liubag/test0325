package com.bookshop.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.annotation.Resource;
import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.bookshop.entity.Comment;
import com.bookshop.entity.Customer;
import com.bookshop.entity.ShoppingRecord;
import com.bookshop.service.CustomerService;
import com.bookshop.util.MyAuthenticator;
import com.bookshop.util.PageUtil;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
/**
 * ��ԱAction��
 * @author Winds
 *
 */
@SuppressWarnings({"serial","rawtypes"})
public class CustomerAction extends ActionSupport {
	@Resource
	private CustomerService customerService;
	private Customer customer;
	private ShoppingRecord ShoppingRecord;
	private Comment comment;
	private Long hasCustomer; // ���ݵ�����
	private int page; // ��ǰҳ
	private int hasPages; // ҳ��
	private int perFolioAmount; // ÿҳ���ݵ�����
	private List<Integer> page_l;
	private List<Customer> customer_l;
	private List<ShoppingRecord> shoppingRecord_l;
	private List<Comment> comment_l;
	private List record_l;
	private int status;
	private int type;
	private boolean isLike;
	private Map<String,Object> session;
	
	/**
	 * ���ͼ������ӵ���Աע������
	 */
	public String sendCodeToCustomer(){
		String flag="input";
		HttpSession httpSession =ServletActionContext.getRequest().getSession();	
		if(customer!=null){
			if(customerService.save(customer)){
				customerService.sendEmail(customer.getEmail(), httpSession);
				flag="success";
			}
		}
		return flag;
	}
	
	/**
	 * �����Ա
	 */
	
	public String activityCustomer(){
		if(customer!=null){
			if(customerService.activityCustomer(customer.getEmail())){
				return SUCCESS;
			}
		}
		return INPUT;
	}
	/**
	 * ��֤�������Ч��
	 */
	public void email_check(){
		String flag="true";
		PrintWriter out = null;
		try {
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("UTF-8");
			out = response.getWriter();
			if(customerService.check_email(customer.getEmail())){
				flag="false";
			}
			// ֱ��������Ӧ������
			out.print(flag);
			out.flush();
			out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			if(out!=null){
				out.close();
			}
		}
	}
	/**
	 * �û���¼
	 */
	
	public String login(){
		if(customerService.login(customer.getEmail(), customer.getPw()))
		{
			this.session=ActionContext.getContext().getSession();
			session.put("customer_email", customer.getEmail());
			return SUCCESS;
		}else{
			return LOGIN;
		}
	}
	
	/**
	 * ��Աע��
	 * @return
	 */
	public String addCustomer(){
		if(customer!=null){
			if(customerService.save(customer)){
				return SUCCESS;
			}
		}
		return INPUT;
	}
	/**
	 * ��ȫ�˳�
	 * @return
	 */
	public String logout(){
		session=ActionContext.getContext().getSession();
		if(session.get("customer_email")!=null){
			session.remove("customer_email");
		}
		return SUCCESS;
	}
	/**
	 * ��ҳ��ȡ��Ա��Ϣ
	 * @return
	 */
	public String showCustomer_by_page() {
		try {
			perFolioAmount = 2; // ÿҳ��ʾ����
			String[] parms = null;
			String[] values = null;
			String entityName=null;
			if (status == 1) {
				entityName="Customer";
		//		this.hasCustomer = customerService.hasNumbers("Customer"); // ��ȡ��������
		//		hasPages = customerService.findPages(perFolioAmount, "Customer"); // ��ȡҳ��
			} else if (status == 2) {
				if (type == 1) {
					entityName="ShoppingRecord";
		//			this.hasCustomer = customerService.hasNumbers("ShoppingRecord"); // ��ȡ��������
		//			hasPages = customerService.findPages(perFolioAmount,"ShoppingRecord"); // ��ȡҳ��
				} else if (type == 2) {
					entityName="ShoppingRecord";
					parms=new String[]{"customer.email"};
					values=new String[]{customer.getEmail()};
					
		//			this.hasCustomer = customerService.hasNumbers("ShoppingRecord", customer.getEmail()); // ��ȡ��������
		//			hasPages = customerService.findPages(perFolioAmount,"ShoppingRecord", customer.getEmail()); // ��ȡҳ��
				}
			} else if (status == 3) {
				if (type == 1) {
					entityName="Comment";
				//	this.hasCustomer = customerService.hasNumbers("Comment"); // ��ȡ��������
				//	hasPages = customerService.findPages(perFolioAmount,"Comment"); // ��ȡҳ��
				} else if (type == 2) {
					entityName="Comment";
					parms=new String[]{"customer.email"};
					values=new String[]{customer.getEmail()};
				//	this.hasCustomer = customerService.hasNumbers("Comment",customer.getEmail()); // ��ȡ��������
				//	hasPages = customerService.findPages(perFolioAmount,"Comment", customer.getEmail()); // ��ȡҳ��
				}
			}
			this.hasCustomer = customerService.hasNumbers(entityName, parms, values, isLike); // ��ȡ��������
			hasPages = PageUtil.findAllPages(perFolioAmount, hasCustomer); // ��ȡҳ��
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
			this.record_l = customerService.show_by_page(page, perFolioAmount, entityName, parms, values, isLike);
			if (status == 1) {
				return "success1";
			} else if (status == 2) {
				return "success2";
			} else if (status == 3) {
				return "success3";
			} else {
				return "input";
			}

		} catch (Exception e) {
			e.printStackTrace();
			return "input";
		}
	}
	
	/**
	 * �ı�ĳ��Ա��״̬
	 */
	public void changeCustomerState(){
		try{
			String flag="input";
	//		String id=new String(customer.getStaff_id().getBytes("iso-8859-1"),"utf-8");
			int state=customerService.updateState(customer.getEmail());
			if(state==1){				
				flag="success1";
			}else if(state==0){
				flag="success2";
			}else if(state==-1){
				flag="success3";
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
	 * ��ȡ�����Ļ�Ա��Ϣ
	 * @return
	 */
	public String gainCustomer(){
		try{
			String flag="input";
//			String id=new String(staff.getStaff_id().getBytes("iso-8859-1"),"utf-8");
			this.customer=customerService.find(customer.getEmail());
			if(customer!=null){				
				flag="success";
			}	
			return flag;
		}catch(Exception e){
			e.printStackTrace();
			return "input";
		}		
	}
	
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	public Long getHasCustomer() {
		return hasCustomer;
	}
	public void setHasCustomer(Long hasCustomer) {
		this.hasCustomer = hasCustomer;
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
	public List<Customer> getCustomer_l() {
		return customer_l;
	}
	public void setCustomer_l(List<Customer> customer_l) {
		this.customer_l = customer_l;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public ShoppingRecord getShoppingRecord() {
		return ShoppingRecord;
	}

	public void setShoppingRecord(ShoppingRecord shoppingRecord) {
		ShoppingRecord = shoppingRecord;
	}

	public Comment getComment() {
		return comment;
	}

	public void setComment(Comment comment) {
		this.comment = comment;
	}

	public List<ShoppingRecord> getShoppingRecord_l() {
		return shoppingRecord_l;
	}

	public void setShoppingRecord_l(List<ShoppingRecord> shoppingRecord_l) {
		this.shoppingRecord_l = shoppingRecord_l;
	}

	public List<Comment> getComment_l() {
		return comment_l;
	}

	public void setComment_l(List<Comment> comment_l) {
		this.comment_l = comment_l;
	}

	public boolean isLike() {
		return isLike;
	}

	public void setLike(boolean isLike) {
		this.isLike = isLike;
	}

	public List getRecord_l() {
		return record_l;
	}

	public void setRecord_l(List record_l) {
		this.record_l = record_l;
	}
	
}
