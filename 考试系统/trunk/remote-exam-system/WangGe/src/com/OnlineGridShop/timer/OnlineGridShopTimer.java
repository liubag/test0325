package com.OnlineGridShop.timer;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Timer;


public class OnlineGridShopTimer {
	private static Timer timer01;
	private static Timer timer02;
	private static Timer timer03;
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
		
		timer01 = new Timer();
		timer01.schedule(new AgreementTask(), startTime ,1000*3600*24);   //启动遍历检测学生网格合约
		timer02 = new Timer();
		timer02.schedule(new BrandgridTask(), startTime ,1000*3600*24);   //启动遍历检测品牌合约
		timer03 = new Timer();
		timer03.schedule(new CreateGoodsXQphotoTask(), startTime ,1000*3600*24);   //定时清除图片的缓存
	}
	public void cancel() {
		// TODO Auto-generated method stub
		timer01.cancel();	
		timer02.cancel();	
		System.out.println("计时器停止");
	}	
}
