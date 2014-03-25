package com.searchEngine.servlet;
/*
 * 启动计时器
 * 项目需要使用再在web.xml中配置声明使用
 */
import javax.servlet.http.HttpServlet;

import com.searchEngine.timer.SuggestionTimer;

@SuppressWarnings("serial")
public class SuggestionServlet extends HttpServlet {
	private SuggestionTimer h;
	public void init(){
		System.out.println("。。。服务器启动。。。过滤器启动！");
		System.setProperty("webapp.root", getServletContext().getRealPath("/"));
		//启动计时器
		h = new SuggestionTimer();
	}
	
	public void destroy(){
		System.out.println("。。。服务器暂停。。。过滤器销毁！");
		h.cancel();//使用这个方法退出任务
	}
}
