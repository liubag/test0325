package com.bookshop.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.ServletActionContext;
import com.bookshop.entity.Book;
import com.bookshop.entity.BookItem;
import com.bookshop.entity.Order;
import com.bookshop.entity.ShoppingCart;
import com.bookshop.entity.Staff;
import com.bookshop.service.BookService;
import com.bookshop.service.OrderService;
import com.bookshop.service.ShoppingCartService;
import com.bookshop.util.PageUtil;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.regex.*;
/**
 * 订单信息Action
 * @author Winds
 *
 */
@SuppressWarnings("serial")
public class OrderAction extends ActionSupport {
	@Resource
	private OrderService orderService;
	@Resource 
	private BookService bookService;
	@Resource
	private ShoppingCartService shoppingCartService;
	private Order order;
	
	private Long hasRecord;//数据的总个数
	private int page;		 //当前页
	private int hasPages;	 //总页数
	private int perFolioAmount;  //每页数据的条数
	private List<Integer> page_l;//获取一个从1到hasPages的数组

	private List <Order> Record_l; //当前页的数据
	private List<Order> allCourse_l; //当所有的数据

	private List <Book> book_l ;
	private List <List <Book>> book_l_l ;
	private List <BookItem> bookItems;
	private int isPass; //标志审核订单的结果。1为通过，0为不通过
	private int status=0;//标志所要查询何种状态下的订单
	private String staff_id ;
	private Map<String,Object> session;
	
	private String parm =null;//筛选所需的参数
	private String value = null;//筛选所需的值
	private String beginTime;
	private String endTime;
	private boolean clear;//清楚筛选的参数
	private String customerEmai; //会员email
	
	
	@SuppressWarnings("unchecked")
	/**
	 * 显示待审核的订单
	 */
	public String show_order(){
		if(clear){
			parm = null;
			value = null;
			clear=false;
		}
		String[] parms = new String[]{"status"};
		String[] values = new String[]{String.valueOf(status)};
		boolean isLike = false;
		try{
			if(perFolioAmount <=0)
				perFolioAmount =4;
			if(parm !=null && parm.equals("order_date")){
				hasRecord = orderService.hasNumbers("Order", parm, beginTime, endTime,"status",String.valueOf(status));
				hasPages = PageUtil.findAllPages(perFolioAmount, hasRecord);
				page_l = PageUtil.getPageList(hasPages);
				if (hasPages == 0) {
					hasPages = 1;
					page = 0;
				} 
				if (page <= 0) {
					page = 1;
				}else if (page > hasPages) {
					page = hasPages;
				}
				this.Record_l = (List<Order>)orderService.show_by_page(page, perFolioAmount, "Order", parm, beginTime, endTime,"status",String.valueOf(status));
				return String.valueOf(status);
			}
			if(parm !=null && value !=null && !value.trim().equals("")){
				parms = new String []{parm,"status"};
				values = new String[]{value,String.valueOf(status)};
				isLike = true;
			}
			hasRecord = orderService.hasNumbers("Order", parms, values,isLike);
			hasPages = PageUtil.findAllPages(perFolioAmount, hasRecord);
			page_l = PageUtil.getPageList(hasPages);
			if (hasPages == 0) {
				hasPages = 1;
				page = 0;
			} 
			if (page <= 0) {
				page = 1;
			}else if (page > hasPages) {
				page = hasPages;
			}
			this.Record_l = (List<Order>)orderService.show_by_page(page, perFolioAmount, "Order", parms, values,isLike);
	
			return String.valueOf(status);
		}catch(Exception e){
			e.printStackTrace();
			return "input";
		}
	}
	
	/**
	 * 查询会员的订单记录
	 */
	@SuppressWarnings("unchecked")
	public String show_order_by_customer(){
		try{
			perFolioAmount = 2; // 每页显示条数
			String[] parms = new String[]{"customer.email"};
			String[] values = new String[]{customerEmai};
			boolean isLike = false;
			this.hasRecord = orderService.hasNumbers("Order",parms,values,isLike); // 获取数据条数
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


			this.Record_l = (List<Order>) orderService.show_by_page(page, perFolioAmount, "Order", parms,values,isLike);
			this.book_l_l=orderService.findBook_l(Record_l);
			return "success";
		}catch(Exception e){
			e.printStackTrace();
			return "input";
		}
	}
	
	/**
	 * 对订单进行审核
	 */
	public void  audit_order(){
	
		String flag = "input";
		System.out.println(isPass);
		PrintWriter out = null;
		session = ActionContext.getContext().getSession();
		staff_id = session.get("staff_id").toString();
		orderService.audit_order(staff_id,order.getOrder_id(),isPass);
		try{
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("UTF-8");
			out = response.getWriter();
			flag = "success";
			out.print(flag);
			out.flush();
			out.close();
		}catch(IOException e){
			e.printStackTrace();
		}finally{
			if(out != null)
				out.close();
		}
	}
	/**
	 * 进行发货操作。
	 */
	public void deliver_goods(){
		String flag = "input";
		PrintWriter out = null;
		session = ActionContext.getContext().getSession();
		staff_id = session.get("staff_id").toString();
		orderService.deliver_goods(staff_id,order.getOrder_id());
		try{
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("UTF-8");
			out = response.getWriter();
			flag = "success";
			out.print(flag);
			out.flush();
			out.close();
		}catch(IOException e){
			
			e.printStackTrace();
		}finally{
			if(out != null)
				out.close();
		}
	}
	
	/**
	 *显示订单中的图书
	 * @return
	 */
	public String showBookInOrder(){
		try{
			book_l=orderService.findBooks(order.getOrder_id());
			if(book_l!=null){
				return SUCCESS;
			}else{
				return "input";
			}
		}catch(Exception e){
			e.printStackTrace();
			return "input";
		}						
	}
	
	/**
	 * 删除订单
	 * @return
	 */
	public void deleteOrder(){
		try{
			String flag="input";
			if(orderService.delete(order.getOrder_id())){
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
	public String commitOrder(){
		try{
			order.setOrder_id(new Order("sb").getOrder_id());
			ShoppingCart shoppingCart =(ShoppingCart)ActionContext.getContext().getSession().get("shoppingCart");
			bookItems = shoppingCartService.getBookFromCart(shoppingCart);
			orderService.commitOrder(order, order.getCustomer().getEmail(), order.getPaymentMethod().getPayment_method_id(), order.getShippingAddress().getShipping_address_id(), bookItems);
			
			return SUCCESS;
		}catch(Exception e){
			e.printStackTrace();
			return "input";
		}
	}
	
	
	public OrderService getOrderService() {
		return orderService;
	}

	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
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



	public Long getHasRecord() {
		return hasRecord;
	}


	public void setHasRecord(Long hasRecord) {
		this.hasRecord = hasRecord;
	}


	public List<Order> getRecord_l() {
		return Record_l;
	}


	public void setRecord_l(List<Order> record_l) {
		Record_l = record_l;
	}


	public String getStaff_id() {
		return staff_id;
	}


	public void setStaff_id(String staff_id) {
		this.staff_id = staff_id;
	}


	public List<Order> getAllCourse_l() {
		return allCourse_l;
	}

	public void setAllCourse_l(List<Order> allCourse_l) {
		this.allCourse_l = allCourse_l;
	}

	public int getIsPass() {
		return isPass;
	}

	public void setIsPass(int isPass) {
		this.isPass = isPass;
	}


	public int getStatus() {
		return status;
	}


	public void setStatus(int status) {
		this.status = status;
	}


	public BookService getBookService() {
		return bookService;
	}


	public void setBookService(BookService bookService) {
		this.bookService = bookService;
	}


	public List<Book> getBook_l() {
		return book_l;
	}



	public String getParm() {
		return parm;
	}



	public void setParm(String parm) {
		this.parm = parm;
	}



	public String getValue() {
		return value;
	}



	public void setValue(String value) {
		this.value = value;
	}



	public String getBeginTime() {
		return beginTime;
	}



	public void setBeginTime(String beginTime) {
		this.beginTime = beginTime;
	}



	public String getEndTime() {
		return endTime;
	}



	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}



	public boolean isClear() {
		return clear;
	}



	public void setClear(boolean clear) {
		this.clear = clear;
	}



	public List<List<Book>> getBook_l_l() {
		return book_l_l;
	}



	public void setBook_l_l(List<List<Book>> book_l_l) {
		this.book_l_l = book_l_l;
	}

	public String getCustomerEmai() {
		return customerEmai;
	}

	public void setCustomerEmai(String customerEmai) {
		this.customerEmai = customerEmai;
	}

	public List<BookItem> getBookItems() {
		return bookItems;
	}

	public void setBookItems(List<BookItem> bookItems) {
		this.bookItems = bookItems;
	}

	public void setBook_l(List<Book> book_l) {
		this.book_l = book_l;
	}	
	
}
