package com.OnlineGridShop.timer;

import java.util.Date;
import java.util.TimerTask;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.OnlineGridShop.brand.Service.BrandgridGoodsSerivce;
import com.OnlineGridShop.brand.Service.BrandgridPreferentialSerivce;
import com.OnlineGridShop.brand.Service.BrandgridSerivce;
import com.OnlineGridShop.util.DateUtil;
public class BrandgridTask extends TimerTask {
	private BrandgridSerivce brandgridSerivce;
	private BrandgridGoodsSerivce brandgridGoodsSerivce;
	private BrandgridPreferentialSerivce brandgridPreferentialSerivce;
	public BrandgridTask(){
		
	}

	public void run() {
		try {
			ApplicationContext cxt = new ClassPathXmlApplicationContext(
					"bean.xml");
			brandgridSerivce = (BrandgridSerivce) cxt.getBean("brandgridSerivce");
			brandgridGoodsSerivce = (BrandgridGoodsSerivce) cxt.getBean("brandgridGoodsSerivce");
			brandgridPreferentialSerivce = (BrandgridPreferentialSerivce) cxt.getBean("brandgridPreferentialSerivce");
		} catch (RuntimeException e) {
			e.printStackTrace();
		}
		
		// TODO Auto-generated method stub
		Date today = new Date();
		String overtime_str = DateUtil.toSQLDate(today).toString() + " 00:00:10";
		brandgridSerivce.isOverAgreementTimeToDo(overtime_str);//检测过期品牌店，并制为过期状态
		brandgridGoodsSerivce.isOverApplyTimeToDo(overtime_str);//检测申请过期商品，并制为过期状态
		brandgridPreferentialSerivce.isOverApplyTimeToDo(overtime_str);//检测申请过期优惠信息，并制为过期状态
	}
}
