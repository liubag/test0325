package com.bookshop.action;

import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.bookshop.entity.Book;
import com.bookshop.entity.Catagory;
import com.bookshop.service.BookService;
import com.bookshop.util.PageUtil;
import com.opensymphony.xwork2.ActionSupport;
/**
 * ͼ����ϢAction��
 * @author Winds
 *
 */
@SuppressWarnings("serial")
public class BookAction extends ActionSupport {
	@Resource
	private BookService bookService;
	private Book book;
	private Long hasBook; // ���ݵ�����
	private int page; // ��ǰҳ
	private int hasPages; // ҳ��
	private int perFolioAmount; // ÿҳ���ݵ�����
	private List<Integer> page_l;
	private List<Book> book_l;
	private int firstCatagory_id; //һ��ͼ�����
	private int secondCatagory_id;//����ͼ�����
	private String book_id;
	private int storage_num;
	private boolean isLike;
	

	/**
	 * ��ҳ��ȡͼ�������Ϣ
	 * @return String
	 */
	public String showBook_by_page() {
		try{
		perFolioAmount = 2; // ÿҳ��ʾ����
		String[] parms = null;
		String[] values = null;
		this.hasBook = bookService.hasNumbers("Book", parms, values, isLike); // ��ȡ��������
		hasPages = PageUtil.findAllPages(perFolioAmount, hasBook); // ��ȡҳ��
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
		this.book_l = (List<Book>) bookService.show_by_page(page, perFolioAmount,"Book", parms, values, isLike);
		return "success";
		}catch(Exception e){
			e.printStackTrace();
			return "input";
		}
	}
	
	/**
	 * ����ͼ����
	 * @return void
	 */
	public void findBookInventory(){
		try{
			String flag="input";
	//		String id=new String(staff.getStaff_id().getBytes("iso-8859-1"),"utf-8");
			if(bookService.findInventory(book.getBook_id())>0){				
				flag="success";
				bookService.updateStatus(book.getBook_id(),book.getStatus());
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
	 * �ϴ�ͼ��
	 * @return
	 */
	public String addBook(){
		try{
			if(bookService.add(book,secondCatagory_id)){
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
	 * ��ͼ�����
	 * @return
	 */
	public void changeBookDiscount(){
		try{
			String flag="input";
			if(bookService.updateDiscount(book)){				
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
	 * ��ͼ����ӿ��
	 * @return
	 */
	public void changeBookStorage_num(){
		try{
			String flag="input";
			if(bookService.updateStorage_num(book_id,storage_num)){				
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
	 * ��ȡͼ��
	 * @return
	 */
	public String gainBook(){
		try{
			this.book=bookService.find(book.getBook_id());			
			if(book!=null){
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
	 * �޸�ͼ��
	 * @return
	 */
	public String updateBook(){
		try{
			if(bookService.update(book,secondCatagory_id)){
				return "success";
			}else{
				return "input";
			}
			
		}catch(Exception e){
			e.printStackTrace();
			return "input";
		}
	}

	public Book getBook() {
		return book;
	}
	public void setBook(Book book) {
		this.book = book;
	}
	public Long getHasBook() {
		return hasBook;
	}
	public void setHasBook(Long hasBook) {
		this.hasBook = hasBook;
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
	public List<Book> getBook_l() {
		return book_l;
	}
	public void setBook_l(List<Book> book_l) {
		this.book_l = book_l;
	}

	public int getFirstCatagory_id() {
		return firstCatagory_id;
	}

	public void setFirstCatagory_id(int firstCatagory_id) {
		this.firstCatagory_id = firstCatagory_id;
	}

	public int getSecondCatagory_id() {
		return secondCatagory_id;
	}

	public void setSecondCatagory_id(int secondCatagory_id) {
		this.secondCatagory_id = secondCatagory_id;
	}

	public String getBook_id() {
		return book_id;
	}

	public void setBook_id(String book_id) {
		this.book_id = book_id;
	}

	public int getStorage_num() {
		return storage_num;
	}

	public void setStorage_num(int storage_num) {
		this.storage_num = storage_num;
	}

	public boolean isLike() {
		return isLike;
	}

	public void setLike(boolean isLike) {
		this.isLike = isLike;
	}

}
