package com.aspsystem.servlet;
/*
 * 启动计时器
 * 项目需要使用再在web.xml中配置声明使用
 */
import javax.servlet.http.HttpServlet;

import com.aspsystem.timer.ASP_SystemTimer;

@SuppressWarnings("serial")
public class ASP_SystemServlet extends HttpServlet {
	private ASP_SystemTimer h;
	public void init(){
		System.out.println("。。。服务器启动。。。过滤器启动！");
		
		//启动计时器
		h = new ASP_SystemTimer();
	}
	
	public void destroy(){
		System.out.println("。。。服务器暂停。。。过滤器销毁！");
		h.cancel();//使用这个方法退出任务
	}
}
