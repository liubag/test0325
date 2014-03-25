package com.aspsystem.timer;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Timer;


public class ASP_SystemTimer {
	private static Timer timer01;
	private static Timer timer02;
	static{//��һ�μ���
		SimpleDateFormat sdf = new SimpleDateFormat();
		
		// �涨��ÿ��ʱ��00:00:00����
		sdf = new SimpleDateFormat("yyyy-MM-dd '00:00:01'");
		// �״�����ʱ��
		Date startTime = null;  //�鿴ΥԼ�˷�ʱ��
		try {
			startTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(sdf.format(new Date()));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		/*
		 * �����ǰ� ���涨��ÿ��ʱ��00:00:01����
		 * ����Ӧ��ʹ��  ָ��ĳһʱ��ִ��ĳ�����񣬾��巽�����Բ�JDK �����ĵ� Timer��ʹ��
		 */
		timer01 = new Timer();
		timer01.schedule(new ExamTask(), startTime ,1000*3600*24);   //����ExamTask������
	}
	
	public void cancel() {
		// TODO Auto-generated method stub
		timer01.cancel();	
		timer02.cancel();	
		System.out.println("��ʱ��ֹͣ");
	}	
}
