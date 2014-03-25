package com.aspsystem.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateUtil {
	/*
	 * 几个月后的今天
	 */
	public static Date nextNumMonth(Integer months){
    	Calendar c=Calendar.getInstance();
    	Date date=new Date();
    	c.setTime(date);
    	c.add(Calendar.MONTH,months); 
    	return c.getTime();
    	
	}
	/*
	 * 2012-2-21 00:00:00
	 * return 2012221000000
	 */
	@SuppressWarnings("deprecation")
	public static Integer makeTodayTimeToInteger(){
		Integer id = null;
		Date today = new Date();
		String todayTime = "" + today.getYear() + today.getMonth() + today.getDay() + today.getHours() + today.getMinutes() + today.getSeconds();
		id = Integer.parseInt(todayTime);
		return id;
	}
	/*
	 * date 几个月后的今天
	 */
	public static Date nextNumMonth2(Date date ,Integer months){
    	Calendar c=Calendar.getInstance();
    	c.setTime(date);
    	c.add(Calendar.MONTH,months); 
    	return c.getTime();
    	
	}
	
	//距今天后几天的日期（一个月之内的）
	public static Date nextNumDay(Integer days){
		Calendar c=Calendar.getInstance();
    	Date date=new Date();
    	c.setTime(date);
    	c.add(Calendar.DAY_OF_MONTH,days);
    	return c.getTime();
	}
	
	//距某天后几天的日期（一个月之内的）
	public static Date nextNumDay2(Date date , Integer days){
		Calendar c=Calendar.getInstance();
    	c.setTime(date);
    	c.add(Calendar.DAY_OF_MONTH,days);
    	return c.getTime();
	}
	
	//是否同一天
	public static boolean isSameDay(Date   date1,Date   date2)   { 
		String   DATE_FORMAT   =   "yyyy-MM-dd"; 
		java.text.SimpleDateFormat   sdf   =   new   java.text.SimpleDateFormat(DATE_FORMAT); 
		String date1Str   =   sdf.format(date1); 
		String date2Str   =   sdf.format(date2);
		return   date1Str.equals(date2Str); 
	} 
	
	
	//转规定时间 ：当天 的 yyyy-MM-dd '00:00:00'
	@SuppressWarnings("deprecation")
	public static Date toMyForm1(Date date){
		final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			return sdf.parse(date.toLocaleString());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
	public static String today(Date date){
		final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			return sdf.format(date);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	//转规定时间 ：第二天 的 yyyy-MM-dd '00:00:00'
	public static Date toMyForm2(Date date){
		final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd '00:00:00'");
		date = nextNumDay2(date,1);
		try {
			return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(sdf.format(date));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	//转规定时间 样式（sdf_str）,return date
	@SuppressWarnings("deprecation")
	public static Date toMyForm3(Date date,String sdf_str){
		final SimpleDateFormat sdf = new SimpleDateFormat(sdf_str);
		try {
			return sdf.parse(date.toLocaleString());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

	//转规定时间 样式（sdf_str）,return string
	@SuppressWarnings("deprecation")
	public static String toMyForm4(String date,String sdf_str){
		final SimpleDateFormat sdf = new SimpleDateFormat(sdf_str);
		try {
			return sdf.parse(date).toLocaleString();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
	//由 String 转 Date
	public static Date stringToDate(String time){
		final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			return sdf.parse(time);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
	
	
	/* 2012-2-7 00:00:00
	 * return "2012-02-07"
	 */
	public static String toSQLDate(java.util.Date date){
		
		return new java.sql.Date(date.getTime()).toString();
		
	}
	
@SuppressWarnings("unused")
public static String dateAdd(String begin_time,float time){
		int minute=Integer.parseInt(begin_time.substring(14, 16));
		int hour=Integer.parseInt(begin_time.substring(11, 13));
		int date=Integer.parseInt(begin_time.substring(8, 10));
		int hh=0;
		int mm=0;
		if(minute+time>=60){
			hh=(int)(minute+time)/60;
			mm=(int)(minute+time)%60;
		}else{
			minute=(int)(minute+time);
		}
		if(hh!=0){
			hour=hour+hh;
			minute=mm;
		}
		
		return begin_time.substring(0, 11)+hour+":"+minute+":00";
	}

	//比较两个日期
	public static int dateCompare(Date dat1, Date dat2) {
		int dateComPareFlag = 0;
		dateComPareFlag = dat1.compareTo(dat2); 
		return dateComPareFlag;
	 }

}	
