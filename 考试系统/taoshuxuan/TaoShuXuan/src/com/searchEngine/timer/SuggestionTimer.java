package com.searchEngine.timer;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Timer;

import com.searchEngine.util.XmlAndHqlString;


public class SuggestionTimer {
	private static Timer timer01;
	private static Timer timer02;
	static{//��һ�μ���
		//�ж������Ƿ�Ϊ��
		if(XmlAndHqlString.entityName == null){
			XmlAndHqlString.initString();
		}
		SimpleDateFormat sdf = new SimpleDateFormat();
		SimpleDateFormat sdf02 = new SimpleDateFormat();
		// �涨��ÿ��ʱ��  startTime    ����
		String startTime_str = "yyyy-MM-dd " + XmlAndHqlString.startTime;
		System.out.println(startTime_str);
		String startTime_str02 = "yyyy-MM-dd '00:00:10'";
		sdf = new SimpleDateFormat(startTime_str);
		
		sdf02 =new SimpleDateFormat(startTime_str02); 
		// �״�����ʱ��
		Date startTime = null;  
		Date startTime02 = null;  
		try {
			startTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(sdf.format(new Date()));
			startTime02 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(sdf02.format(new Date()));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		/*
		 * �����ǰ� ���涨��ÿ��ʱ��  startTime_str ����
		 * �Ż��ؼ��ִʿ�
		 */
		timer01 = new Timer();
		timer01.schedule(new TaskUpdate(), startTime ,1000*3600*24 * XmlAndHqlString.updataKeyWordDays);   //����TaskUpdate������
		
		timer02 = new Timer();
		timer02.schedule(new TaskUpdateClick(), startTime02 ,1000*3600*24 );   //����TaskUpdateClick������
	
	}
	
	public void cancel() {
		// TODO Auto-generated method stub
		timer01.cancel();
		timer02.cancel();
		System.out.println("��ʱ��ֹͣ");
	}	
}
