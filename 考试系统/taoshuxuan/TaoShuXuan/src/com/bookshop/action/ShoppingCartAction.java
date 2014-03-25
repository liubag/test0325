package com.bookshop.action;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.bookshop.entity.Book;
import com.bookshop.entity.BookItem;
import com.bookshop.entity.ShoppingCart;
import com.bookshop.service.BookService;
import com.bookshop.service.ShoppingCartService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class ShoppingCartAction extends ActionSupport{
	@Resource
	private BookService bookService;
	@Resource
	private ShoppingCartService shoppingCartService;
	private Book book;
	private ShoppingCart shoppingCart ;
	Map<String,Object> session ;
	List<BookItem> bookItems;
	private float total_account;
	private boolean hasBookItem;
	private int amountCount;//Í¼ÊéÊýÁ¿
	public void addBookToCart(){
		book = bookService.find(book.getBook_id());
		shoppingCart = getShoppingCart();
		PrintWriter out = null;
		String flag="";
		if(shoppingCartService.addBookToCart(shoppingCart, book,1)){
			flag = "success";
		}else{
			flag = "input";
		}
		try{
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("UTF-8");
			out = response.getWriter();
			out.print(flag);
			out.flush();
			out.close();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(out !=null){
				out.close();
			}
		}
	}
	public void addBooksToCart(){
		book = bookService.find(book.getBook_id());
		shoppingCart = getShoppingCart();
		PrintWriter out = null;
		String flag="";
		if(shoppingCartService.addBookToCart(shoppingCart, book,amountCount)){
			flag = "success";
		}else{
			flag = "input";
		}
		try{
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("UTF-8");
			out = response.getWriter();
			out.print(flag);
			out.flush();
			out.close();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(out !=null){
				out.close();
			}
		}
	}
	
	public void cutBookToCart(){
		book = bookService.find(book.getBook_id());
		shoppingCart = getShoppingCart();
		PrintWriter out = null;
		String flag="";
		if(shoppingCartService.removeBookToCart(shoppingCart, book)){
			
			flag = "success";
		}else{
			flag = "input";
		}
		try{
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("UTF-8");
			out = response.getWriter();
			out.print(flag);
			out.flush();
			out.close();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(out !=null){
				out.close();
			}
		}
	}
	public String getBookFromCart(){
		try{
			shoppingCart = getShoppingCart();
			bookItems = shoppingCartService.getBookFromCart(shoppingCart);
			total_account = shoppingCartService.countTotal(bookItems) + 5;
			HttpServletRequest request = ServletActionContext.getRequest();
			request.setAttribute("bookItems", bookItems);
			request.setAttribute("total_account", total_account);
			if(bookItems.size() > 0){
				hasBookItem = true;
			}else{
				hasBookItem = false;
			}
			request.setAttribute("hasBookItem", hasBookItem);
			return SUCCESS;
		}catch(Exception e){
			e.printStackTrace();
			return "input";
		}
	}
	public void updateAmount(){
		
		book = bookService.find(book.getBook_id());
		shoppingCart = getShoppingCart();
		PrintWriter out = null;
		boolean flag=false;
		try{
		flag = shoppingCartService.updateBookAmountToCart(shoppingCart, book, amountCount);
		
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("UTF-8");
			out = response.getWriter();
			out.print(flag);
			out.flush();
			out.close();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(out !=null){
				out.close();
			}
		}
	}
	public ShoppingCart getShoppingCart(){
		session = ActionContext.getContext().getSession();
		if(!session.containsKey("shoppingCart")){
			session.put("shoppingCart", new ShoppingCart(new HashMap<String,BookItem>()));
		}
		return (ShoppingCart)session.get("shoppingCart");
	}
	public BookService getBookService() {
		return bookService;
	}
	public void setBookService(BookService bookService) {
		this.bookService = bookService;
	}
	public ShoppingCartService getShoppingCartService() {
		return shoppingCartService;
	}
	public void setShoppingCartService(ShoppingCartService shoppingCartService) {
		this.shoppingCartService = shoppingCartService;
	}
	public Book getBook() {
		return book;
	}
	public void setBook(Book book) {
		this.book = book;
	}
	public Map<String, Object> getSession() {
		return session;
	}
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	public void setShoppingCart(ShoppingCart shoppingCart) {
		this.shoppingCart = shoppingCart;
	}
	public List<BookItem> getBookItems() {
		return bookItems;
	}
	public void setBookItems(List<BookItem> bookItems) {
		this.bookItems = bookItems;
	}
	public float getTotal_account() {
		return total_account;
	}
	public void setTotal_account(float total_account) {
		this.total_account = total_account;
	}
	public boolean isHasBookItem() {
		return hasBookItem;
	}
	public void setHasBookItem(boolean hasBookItem) {
		this.hasBookItem = hasBookItem;
	}
	public int getAmountCount() {
		return amountCount;
	}
	public void setAmountCount(int amountCount) {
		this.amountCount = amountCount;
	}
	
	
	
}
