package com.aspsystem.timer;

import java.util.Date;
import java.util.TimerTask;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.aspsystem.serivce.ExamSerivce;
import com.aspsystem.util.DateUtil;
/*
 * ����
 */
@SuppressWarnings({"serial","unchecked"})
public class ExamTask extends TimerTask {
	private ExamSerivce examSerivce;

	public ExamTask(){
		
	}

	public void run() {
		try {
			ApplicationContext cxt = new ClassPathXmlApplicationContext(
					"bean.xml");
			examSerivce = (ExamSerivce) cxt.getBean("examSerivce");

		} catch (RuntimeException e) {
			e.printStackTrace();
		}
		
		// TODO Auto-generated method stub
		Date today = new Date();
		String t_str = DateUtil.toSQLDate(today);
		try {
			//��Ҫִ�е�����
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("����������ʧ�ܣ�");
		}
		
	}
}
