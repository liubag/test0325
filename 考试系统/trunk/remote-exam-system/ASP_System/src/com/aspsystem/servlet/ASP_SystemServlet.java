package com.aspsystem.servlet;
/*
 * ������ʱ��
 * ��Ŀ��Ҫʹ������web.xml����������ʹ��
 */
import javax.servlet.http.HttpServlet;

import com.aspsystem.timer.ASP_SystemTimer;

@SuppressWarnings("serial")
public class ASP_SystemServlet extends HttpServlet {
	private ASP_SystemTimer h;
	public void init(){
		System.out.println("����������������������������������");
		
		//������ʱ��
		h = new ASP_SystemTimer();
	}
	
	public void destroy(){
		System.out.println("��������������ͣ���������������٣�");
		h.cancel();//ʹ����������˳�����
	}
}
