package com.searchEngine.timer;

import java.util.TimerTask;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.searchEngine.service.KeyWordService;
/*
 * ����
 */
public class TaskUpdate extends TimerTask {
	private KeyWordService keyWordService;

	public TaskUpdate(){
		
	}

	public void run() {
		try {
			ApplicationContext cxt = new ClassPathXmlApplicationContext(
					"bean.xml");
			keyWordService = (KeyWordService) cxt.getBean("keyWordService");

		} catch (RuntimeException e) {
			e.printStackTrace();
		}
		
		// TODO Auto-generated method stub
		try {
			//��Ҫִ�е�����
			keyWordService.updataKeyWord_max();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("����������ʧ�ܣ�");
		}
		
	}
}
