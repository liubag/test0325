package com.OnlineGridShop.timer;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.TimerTask;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.OnlineGridShop.scattered.Service.ScatteredGridAccountsSerivce;
@SuppressWarnings("deprecation")
public class AgreementTask extends TimerTask {
	private ScatteredGridAccountsSerivce scatteredGridAccountsSerivce;

	public AgreementTask(){
		
	}

	public void run() {
		try {
			ApplicationContext cxt = new ClassPathXmlApplicationContext(
					"bean.xml");
			scatteredGridAccountsSerivce = (ScatteredGridAccountsSerivce) cxt.getBean("scatteredGridAccountsSerivce");

		} catch (RuntimeException e) {
			e.printStackTrace();
		}
		
		// TODO Auto-generated method stub
		Date today = new Date();
		
		String pattern = "yyyy-MM-dd";
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		String source =today.toLocaleString();
		Calendar c = Calendar.getInstance();
		try {
			Date date = sdf.parse(source);
			c.setTime(date);
			Date time = c.getTime();
			String nochangtime1 = time.toLocaleString().substring(0, time.toLocaleString().indexOf(" "));
			scatteredGridAccountsSerivce.isNoChangeStatu_timer(nochangtime1);//将“可修改期”改为“正在使用”状态
			scatteredGridAccountsSerivce.isOverAgreementTimeToDo(nochangtime1);  //处理过期合同
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("检测操作过程失败！");
		}
		
	}
}
