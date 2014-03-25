package com.searchEngine.timer;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Timer;

import com.searchEngine.util.XmlAndHqlString;


public class SuggestionTimer {
	private static Timer timer01;
	private static Timer timer02;
	static{//第一次加载
		//判断配置是否为空
		if(XmlAndHqlString.entityName == null){
			XmlAndHqlString.initString();
		}
		SimpleDateFormat sdf = new SimpleDateFormat();
		SimpleDateFormat sdf02 = new SimpleDateFormat();
		// 规定的每天时间  startTime    运行
		String startTime_str = "yyyy-MM-dd " + XmlAndHqlString.startTime;
		System.out.println(startTime_str);
		String startTime_str02 = "yyyy-MM-dd '00:00:10'";
		sdf = new SimpleDateFormat(startTime_str);
		
		sdf02 =new SimpleDateFormat(startTime_str02); 
		// 首次运行时间
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
		 * 这里是按 ：规定的每天时间  startTime_str 运行
		 * 优化关键字词库
		 */
		timer01 = new Timer();
		timer01.schedule(new TaskUpdate(), startTime ,1000*3600*24 * XmlAndHqlString.updataKeyWordDays);   //启动TaskUpdate的任务
		
		timer02 = new Timer();
		timer02.schedule(new TaskUpdateClick(), startTime02 ,1000*3600*24 );   //启动TaskUpdateClick的任务
	
	}
	
	public void cancel() {
		// TODO Auto-generated method stub
		timer01.cancel();
		timer02.cancel();
		System.out.println("计时器停止");
	}	
}
