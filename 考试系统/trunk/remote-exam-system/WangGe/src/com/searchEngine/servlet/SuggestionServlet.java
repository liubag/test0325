package com.searchEngine.servlet;
/*
 * ������ʱ��
 * ��Ŀ��Ҫʹ������web.xml����������ʹ��
 */
import javax.servlet.http.HttpServlet;

import com.searchEngine.timer.SuggestionTimer;

@SuppressWarnings("serial")
public class SuggestionServlet extends HttpServlet {
	private SuggestionTimer h;
	public void init(){
		System.out.println("����������������������������������");
		System.setProperty("webapp.root", getServletContext().getRealPath("/"));
		//������ʱ��
		h = new SuggestionTimer();
	}
	
	public void destroy(){
		System.out.println("��������������ͣ���������������٣�");
		h.cancel();//ʹ����������˳�����
	}
}
