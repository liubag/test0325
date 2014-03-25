package com.aspsystem.filter;

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
	        if(uri.contains("/admin/")){
	        	if(session.getAttribute("adminInfo")==null){
	        		isLogin=false;
	        	}
	        }else if(uri.contains("/student/")){
	        	if(session.getAttribute("studentInfo")==null){
	        		isLogin=false;
	        	}
	        }else if(uri.contains("/teacher/")){
	        	if(session.getAttribute("teacherInfo")==null){
	        		isLogin=false;
	        	}
	        }
	        if(!isLogin){
	        	response.sendRedirect(request.getContextPath()+"/login.jsp");
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
