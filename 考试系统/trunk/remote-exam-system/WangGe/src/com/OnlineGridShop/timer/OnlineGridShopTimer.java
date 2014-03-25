package com.OnlineGridShop.timer;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Timer;


public class OnlineGridShopTimer {
	private static Timer timer01;
	private static Timer timer02;
	private static Timer timer03;
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
		
		timer01 = new Timer();
		timer01.schedule(new AgreementTask(), startTime ,1000*3600*24);   //�����������ѧ�������Լ
		timer02 = new Timer();
		timer02.schedule(new BrandgridTask(), startTime ,1000*3600*24);   //�����������Ʒ�ƺ�Լ
		timer03 = new Timer();
		timer03.schedule(new CreateGoodsXQphotoTask(), startTime ,1000*3600*24);   //��ʱ���ͼƬ�Ļ���
	}
	public void cancel() {
		// TODO Auto-generated method stub
		timer01.cancel();	
		timer02.cancel();	
		System.out.println("��ʱ��ֹͣ");
	}	
}
