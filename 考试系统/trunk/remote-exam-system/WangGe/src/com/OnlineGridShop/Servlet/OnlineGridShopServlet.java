package com.OnlineGridShop.Servlet;

import javax.servlet.http.HttpServlet;

import com.OnlineGridShop.timer.OnlineGridShopTimer;

@SuppressWarnings("serial")
public class OnlineGridShopServlet extends HttpServlet {
	private OnlineGridShopTimer h;
	public void init(){
		System.out.println("。。。服务器启动。。。过滤器启动！");
		
		//启动计时器
		h = new OnlineGridShopTimer();
	}
	
	public void destroy(){
		System.out.println("。。。服务器暂停。。。过滤器销毁！");
		h.cancel();//使用这个方法退出任务
	}
}
