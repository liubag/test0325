package com.bookshop.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginFilter implements Filter {

	public void destroy() {
		// TODO Auto-generated method stub

	}

	public void doFilter(ServletRequest req, ServletResponse res,
			FilterChain filterChain) throws IOException, ServletException {
		  HttpServletRequest request = (HttpServletRequest)req;  
	        HttpServletResponse response = (HttpServletResponse)res;  
	        HttpSession session = request.getSession();  
	        String uri = request.getRequestURI();  
	        boolean isLogin=true;
	        int login_role=0;
	        if(uri.contains("/admin/")){
	        	if(session.getAttribute("admin_id")==null){
	        		login_role=1;
	        		isLogin=false;
	        	}
	        }else if(uri.contains("/customer/")){
	        	if(session.getAttribute("customer_email")==null){
	        		login_role=2;
	        		isLogin=false;
	        	}
	        }else if(uri.contains("/staff/")){
	        	if(session.getAttribute("staff_id")==null){
	        		login_role=3;
	        		isLogin=false;
	        	}
	        }
	        if(uri.contains("/shoppingcart/")){
	        	isLogin=true;
	        }
	        if(!isLogin && login_role==1){
	        	response.sendRedirect(request.getContextPath()+"/adminLogin.jsp");
	        	return;
	        }else if(!isLogin && login_role==2){
	        	response.sendRedirect(request.getContextPath()+"/customerLogin.jsp");
	        	return;
	        }else if(!isLogin && login_role==3){
	        	response.sendRedirect(request.getContextPath()+"/staffLogin.jsp");
	        	return;
	        }
	        try {
				filterChain.doFilter(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}

	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
