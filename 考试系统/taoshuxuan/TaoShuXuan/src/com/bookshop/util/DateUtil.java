package com.bookshop.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * 时间处理工具类
 * @author Winds
 *
 */
public class DateUtil {
	/**
	 * 获取距离现在日，周，月的日期
	 * @param flag 距离现在为日/周/月 的标志
	 * @param n 距离现在n日/周/月
	 * @return
	 */
	public static Date getDateBefore(String flag,int n){
		//创建Date对象

		Date endDate = new Date();

		//创建基于当前时间的日历对象

		Calendar cl = Calendar.getInstance();

		cl.setTime(endDate);

		//距离今天，n个月内数据
		 if(flag.equals("month")){
		  cl.add(Calendar.MONTH, -1*n);
		}
		 //距离今天，n周内的数据
		if(flag.equals("week")){
		  cl.add(Calendar.DATE, -7*n);
		 }
		
		//距离今天n天的数据
		if(flag.equals("day")){
			cl.add(Calendar.DATE, -1*n);
		}
		return cl.getTime();
	}
	/**
	 * 将Date对象转化成对应格式的字符串
	 */
    public static String dateToString(java.util.Date date) {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String dateString = formatter.format(date);
        return dateString;
        }
	public static void main(String[] args){
	}
}
