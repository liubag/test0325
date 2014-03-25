package com.aspsystem.timer;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Timer;


public class ASP_SystemTimer {
	private static Timer timer01;
	private static Timer timer02;
	static{//第一次加载
		SimpleDateFormat sdf = new SimpleDateFormat();
		
		// 规定的每天时间00:00:00运行
		sdf = new SimpleDateFormat("yyyy-MM-dd '00:00:01'");
		// 首次运行时间
		Date startTime = null;  //查看违约退房时间
		try {
			startTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(sdf.format(new Date()));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		/*
		 * 这里是按 ：规定的每天时间00:00:01运行
		 * 这里应该使用  指定某一时刻执行某个任务，具体方法可以查JDK 帮助文档 Timer的使用
		 */
		timer01 = new Timer();
		timer01.schedule(new ExamTask(), startTime ,1000*3600*24);   //启动ExamTask的任务
	}
	
	public void cancel() {
		// TODO Auto-generated method stub
		timer01.cancel();	
		timer02.cancel();	
		System.out.println("计时器停止");
	}	
}
