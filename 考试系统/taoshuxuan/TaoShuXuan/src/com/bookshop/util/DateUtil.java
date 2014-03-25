package com.bookshop.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * ʱ�䴦������
 * @author Winds
 *
 */
public class DateUtil {
	/**
	 * ��ȡ���������գ��ܣ��µ�����
	 * @param flag ��������Ϊ��/��/�� �ı�־
	 * @param n ��������n��/��/��
	 * @return
	 */
	public static Date getDateBefore(String flag,int n){
		//����Date����

		Date endDate = new Date();

		//�������ڵ�ǰʱ�����������

		Calendar cl = Calendar.getInstance();

		cl.setTime(endDate);

		//������죬n����������
		 if(flag.equals("month")){
		  cl.add(Calendar.MONTH, -1*n);
		}
		 //������죬n���ڵ�����
		if(flag.equals("week")){
		  cl.add(Calendar.DATE, -7*n);
		 }
		
		//�������n�������
		if(flag.equals("day")){
			cl.add(Calendar.DATE, -1*n);
		}
		return cl.getTime();
	}
	/**
	 * ��Date����ת���ɶ�Ӧ��ʽ���ַ���
	 */
    public static String dateToString(java.util.Date date) {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String dateString = formatter.format(date);
        return dateString;
        }
	public static void main(String[] args){
	}
}
