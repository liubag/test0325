package com.OnlineGridShop.Servlet;

import javax.servlet.http.HttpServlet;

import com.OnlineGridShop.timer.OnlineGridShopTimer;

@SuppressWarnings("serial")
public class OnlineGridShopServlet extends HttpServlet {
	private OnlineGridShopTimer h;
	public void init(){
		System.out.println("����������������������������������");
		
		//������ʱ��
		h = new OnlineGridShopTimer();
	}
	
	public void destroy(){
		System.out.println("��������������ͣ���������������٣�");
		h.cancel();//ʹ����������˳�����
	}
}
