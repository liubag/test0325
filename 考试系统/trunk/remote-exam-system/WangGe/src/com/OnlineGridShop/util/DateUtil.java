package com.OnlineGridShop.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class DateUtil {
	
	public static Date nextNumMonth(Integer months){
    	Calendar c=Calendar.getInstance();
    	Date date=new Date();
    	c.setTime(date);
    	c.add(Calendar.MONTH,months); 
    	return c.getTime();
    	
	}
	
	@SuppressWarnings("deprecation")
	public static Integer makeTodayTimeToInteger(){
		Integer id = null;
		Date today = new Date();
		String todayTime = "" + today.getYear() + today.getMonth() + today.getDay() + today.getHours() + today.getMinutes() + today.getSeconds();
		id = Integer.parseInt(todayTime);
		return id;
	}
	
	@SuppressWarnings("deprecation")
	public static String makeTodayTimeToString(){
		Date today = new Date();
		String todayTime = "" + today.getYear() + today.getMonth() + today.getDay() + today.getHours() + today.getMinutes() + today.getSeconds();
		return todayTime;
	}
	
	public static Date nextNumMonth2(Date date ,Integer months){
    	Calendar c=Calendar.getInstance();
    	c.setTime(date);
    	c.add(Calendar.MONTH,months); 
    	return c.getTime();
    	
	}
	
	//������������ڣ�һ����֮�ڵģ�
	public static Date nextNumDay(Integer days){
		Calendar c=Calendar.getInstance();
    	Date date=new Date();
    	c.setTime(date);
    	c.add(Calendar.DAY_OF_MONTH,days);
    	return c.getTime();
	}
	
	//��ĳ���������ڣ�һ����֮�ڵģ�
	public static Date nextNumDay2(Date date , Integer days){
		Calendar c=Calendar.getInstance();
    	c.setTime(date);
    	c.add(Calendar.DAY_OF_MONTH,days);
    	return c.getTime();
	}
	
	//�Ƿ�ͬһ��
	public static boolean isSameDay(Date   date1,Date   date2)   { 
		String   DATE_FORMAT   =   "yyyy-MM-dd"; 
		java.text.SimpleDateFormat   sdf   =   new   java.text.SimpleDateFormat(DATE_FORMAT); 
		String date1Str   =   sdf.format(date1); 
		String date2Str   =   sdf.format(date2);
		return   date1Str.equals(date2Str); 
	} 
	
	
	//ת�涨ʱ�� ������ �� yyyy-MM-dd '00:00:00'
	@SuppressWarnings("deprecation")
	public static Date toMyForm1(Date date){
		final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd '00:00:00'");
		try {
			return sdf.parse(date.toLocaleString());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
	//ת�涨ʱ�� ���ڶ��� �� yyyy-MM-dd '00:00:00'
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
	//ת�涨ʱ�� �������� �� yyyy-MM-dd '00:00:00'
	public static Date toMyForm4(Date date){
		final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd '00:00:00'");
		date = nextNumDay2(date,2);
		try {
			return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(sdf.format(date));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	//ת�涨ʱ�� ��
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

	//ת�涨ʱ�� ��
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
	
	
	/*
	 * �������(���ÿ��޸��������)
	 * date1 < = date2
	 */
	@SuppressWarnings("deprecation")
	public static Integer differMoths(String date1,String date2)   { 
		Integer differ = 0;
		String   DATE_FORMAT   =   "yyyy-MM-dd"; 
		java.text.SimpleDateFormat   sdf   =   new   java.text.SimpleDateFormat(DATE_FORMAT); 
		Date date1Str   =   null;
		Date date2Str   =   null;
		try {
			date1Str   =   sdf.parse(date1);
			date2Str   =   sdf.parse(date2); 
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		Integer y1 = date1Str.getYear();
		Integer y2 = date2Str.getYear();
		Integer m1 = date1Str.getMonth();
		Integer m2 = date2Str.getMonth();
		Integer d1 = date1Str.getDay();
		Integer d2 = date2Str.getDay();
		Integer y = y2 - y1;
		if(y == 0){
			differ = m2 - m1;
			if(differ == 1){
				if(d1 >= d2){
					//�Ѿ���ʹ�����һ���£����Ӧ��Ϊ 0��
					differ = 0;
				}
			}
		}else if(y == 1){
			differ = 12 - (m1 - m2);
			if(d1 >= d2){
				//�Ѿ���ʹ���¸��£����Ӧ��Ϊ��1��
				differ =differ -1;
			}
		}else{
			differ = 12 * (y - 1);
			differ = differ + (12 - (m1 - m2));
			if(d1 >= d2){
				//�Ѿ���ʹ���¸��£����Ӧ��Ϊ��1��
				differ = -1;
			}
		}
		return differ; 
	} 
	
	
	/* 2012-2-7 00:00:00
	 * return "2012-02-07"
	 */
	public static String toSQLDate(java.util.Date date){
		
		return new java.sql.Date(date.getTime()).toString();
		
	}
	
	
	/*
	 * �Խ���Ϊ׼,����(n=0)����ȡ�����Լ�ǰ�����������(����)����ʼʱ�估����ʱ��
	 * ���磺
	 * List<String[]> startAndEnd_l = getWeek_list(-2);
		for (String[] startAndEnd : startAndEnd_l) {
			System.out.println(startAndEnd[0] + "  " + startAndEnd[1]);
		}
		System.out.println();
		startAndEnd_l = getWeek_list(2);
		for (String[] startAndEnd : startAndEnd_l) {
			System.out.println(startAndEnd[0] + "  " + startAndEnd[1]);
		}
		�����
		2012-03-04  2012-03-10
		2012-03-11  2012-03-17
		2012-03-18  2012-03-24
		
		2012-03-18  2012-03-24
		2012-03-25  2012-03-31
		2012-04-01  2012-04-07
	 * 
	 * 
	 */
	
	public static List<String[]> getWeek_list(int n) {
		List<String[]> weekArray_l = new ArrayList<String[]>();
		String[] startAndEnd = { "", "" };
		if(n>0){
			for(int i=0;i<=n;i++){
				startAndEnd = getNextWeekStartAndEnd(i);
				weekArray_l.add(startAndEnd);
			}
		}else if(n<0){
			for(int i=n;i<=0;i++){
				startAndEnd = getNextWeekStartAndEnd(i);
				weekArray_l.add(startAndEnd);
			}
		}else{
			startAndEnd = getNextWeekStartAndEnd(0);
			weekArray_l.add(startAndEnd);
		}
		return weekArray_l;
	}

	public static String[] getNextWeekStartAndEnd(int n) {
		String[] startAndEnd = { "", "" };
		Calendar cal = Calendar.getInstance();
		// nΪ�Ƴٵ�������0���ܣ�-1��ǰ�Ƴ�һ�ܣ�2���ܣ���������
		cal.add(Calendar.DATE, n * 7);
		// ���ܼ�������ʹ���Calendar.MONDAY��TUESDAY...��
		cal.set(Calendar.DAY_OF_WEEK, Calendar.SUNDAY);
		startAndEnd[0] = new SimpleDateFormat("yyyy-MM-dd").format(cal.getTime());
		cal.set(Calendar.DAY_OF_WEEK, Calendar.SATURDAY);
		startAndEnd[1] = new SimpleDateFormat("yyyy-MM-dd").format(cal.getTime());
		return startAndEnd;
	}
	
	/* �Խ���Ϊ׼,����(n=0)����ȡ�����Լ�ǰ�����������(����)����ʼʱ�估����ʱ��
	 * ���磺
	 * startAndEnd_l = getNextMonthStartAndEnd_list(2);
		for (String[] startAndEnd : startAndEnd_l) {
			System.out.println(startAndEnd[0] + "  " + startAndEnd[1]);
		}
		
		System.out.println();
		
		startAndEnd_l = getNextMonthStartAndEnd_list(-2);
		for (String[] startAndEnd : startAndEnd_l) {
			System.out.println(startAndEnd[0] + "  " + startAndEnd[1]);
		}
	 * �����
	 * 2012-03-01  2012-03-31
		2012-04-01  2012-04-30
		2012-05-01  2012-05-31
		
		2012-01-01  2012-01-31
		2012-02-01  2012-02-29
		2012-03-01  2012-03-31
	 * 
	 */
	/*
	 * 0Ϊ���£���Ϊ����������Ϊδ��
	 */
	@SuppressWarnings("deprecation")
	public static List<String[]> getNextMonthStartAndEnd_list(int n) {
		List<String[]> weekArray_l = new ArrayList<String[]>();
		String[] startAndEnd = { "", "" };
		Calendar calendar = Calendar.getInstance();
		// �õ��³�
		calendar.set(Calendar.DAY_OF_MONTH, calendar
				.getActualMinimum(Calendar.DAY_OF_MONTH));
		Date strDateFrom = calendar.getTime();
		startAndEnd[0] = String.format("%1$tY-%1$tm-%1$td", strDateFrom);
		
		// �õ���ĩ
		calendar.set(Calendar.DAY_OF_MONTH, calendar
				.getActualMaximum(Calendar.DAY_OF_MONTH));
		Date strDateTo = calendar.getTime();
		startAndEnd[1] = String.format("%1$tY-%1$tm-%1$td", strDateTo);
		
		if(n>0){  //��ȡδ��
			weekArray_l.add(startAndEnd);  //������
			for(int i=0;i<n;i++){  //δ��������
				startAndEnd = new String[]{"",""};
				//��ȡδ��
				strDateFrom = nextNumDay2(strDateTo,1);  //δ��һ���µĵ�һ������
				int day = getLastDayOfMonth(strDateFrom.getYear(),strDateFrom.getMonth());
				strDateTo.setYear(strDateFrom.getYear());
				strDateTo.setMonth(strDateFrom.getMonth());
				strDateTo.setDate(day);
				startAndEnd[0] = String.format("%1$tY-%1$tm-%1$td", strDateFrom);
				startAndEnd[1] = String.format("%1$tY-%1$tm-%1$td", strDateTo);
				weekArray_l.add(startAndEnd);
			}
		}else if(n<0){  //��ȡ����
			for(int i = n;i <0;i++){
				weekArray_l.add(new String[]{"",""});
			}
			for(int i=n,k=(-n)-1;i<0;i++,k--){  //δ��������
				String[] startAndEnd1 = new String[]{"",""};
				//��ȡδ��
				strDateTo = nextNumDay2(strDateFrom,-1);  //��һ���µ����һ��
				strDateFrom.setYear(strDateTo.getYear());
				strDateFrom.setMonth(strDateTo.getMonth());
				strDateFrom.setDate(1);  //��һ��һ���� 1��
				startAndEnd1[0] = String.format("%1$tY-%1$tm-%1$td", strDateFrom);
				startAndEnd1[1] = String.format("%1$tY-%1$tm-%1$td", strDateTo);
				if(weekArray_l.size() > k && weekArray_l.get(k)!=null){
					weekArray_l.remove(k);				
				}
				weekArray_l.add(k, startAndEnd1);
			}
			weekArray_l.add(startAndEnd);  //������
		}else{ 
			weekArray_l.add(startAndEnd);  //������
		}
		
		return weekArray_l;

	}
	
	//ĳ�������һ��
	private static int getLastDayOfMonth(int year, int month) {  
        Calendar cal = Calendar.getInstance();  
        cal.set(Calendar.YEAR, year);  
        cal.set(Calendar.MONTH, month);  
        // ĳ��ĳ�µ����һ��  
        return cal.getActualMaximum(Calendar.DATE);  
    } 
}	
