package com.OnlineGridShop.audience.action.TestCase;

import junit.framework.TestCase;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.OnlineGridShop.audience.Entity.Audience;
import com.OnlineGridShop.audience.action.AudienceAction;

public class AudienceTestCase extends TestCase {

	private AudienceAction audienceAction01;
	private AudienceAction audienceAction02;
	private AudienceAction audienceAction03;
	
	String tip = "";
	String result = "";

	public void enrollAudience() {
		try {
			ApplicationContext cxt = new ClassPathXmlApplicationContext(
					"bean.xml");
			audienceAction01 = (AudienceAction) cxt.getBean("audienceAction");
			audienceAction02 = (AudienceAction) cxt.getBean("audienceAction");
			audienceAction03 = (AudienceAction) cxt.getBean("audienceAction");
		} catch (RuntimeException e) {
			e.printStackTrace();
		}

		Audience audience01 = new Audience();
		audience01.setAddress("address01");
		audience01.setAudience_nickname("昵称01");

		audience01.setAudience_point(0);
		audience01.setAudience_pw("12345");
		audience01.setAudience_status("1");

		audience01.setAudience_idcard("080202051014");
		audience01.setAudience_truename("王XX");
		audience01.setPhone("12345678912");
		audience01.setSex("男");
		audienceAction01.setAudience(audience01);
		
		tip = audienceAction01.getTip();
		System.out.println("result = " + result + "     tip = " + tip);

		// 测试重复idcard
		Audience audience02 = new Audience();
		audience02.setAddress("address03");
		audience02.setAudience_nickname("昵称02");

		audience02.setAudience_point(0);
		audience02.setAudience_pw("12345");
		audience02.setAudience_status("1");

		audience02.setAudience_idcard("080202051014");
		audience02.setAudience_truename("王XX");
		audience02.setPhone("12345678912");
		audience02.setSex("男");

		audienceAction02.setAudience(audience02);
		
		tip = audienceAction02.getTip();
		System.out.println("result = " + result + "     tip = " + tip);

		// 测试重复昵称
		Audience audience03 = new Audience();
		audience03.setAddress("address03");
		audience03.setAudience_nickname("昵称01");

		audience03.setAudience_point(0);
		audience03.setAudience_pw("12345");
		audience03.setAudience_status("1");

		audience03.setAudience_idcard("080202051015");
		audience03.setAudience_truename("王XX");
		audience03.setPhone("12345678912");
		audience03.setSex("男");

		audienceAction03.setAudience(audience03);
		
		tip = audienceAction03.getTip();
		System.out.println("result = " + result + "     tip = " + tip);

	}

	public void login() {
		
		try {
			ApplicationContext cxt = new ClassPathXmlApplicationContext(
					"bean.xml");
			audienceAction01 = (AudienceAction) cxt.getBean("audienceAction");
			audienceAction02 = (AudienceAction) cxt.getBean("audienceAction");
			audienceAction03 = (AudienceAction) cxt.getBean("audienceAction");
		} catch (RuntimeException e) {
			e.printStackTrace();
		}
		
		
		// 测试 ：1：成功 ；
		String audience_pw = "12345";
		String audience_idcard = "080202051014";

		audienceAction01.setAudience_pw(audience_pw);
		

		result = audienceAction01.login();
		tip = audienceAction01.getTip();
		System.out.println("result = " + result + "     tip = " + tip);

		// 测试 ：0 ：密码错误
		audience_pw = "11111";
		audience_idcard = "080202051014";

		audienceAction01.setAudience_pw(audience_pw);
		

		result = audienceAction01.login();
		tip = audienceAction01.getTip();
		System.out.println("result = " + result + "     tip = " + tip);

		// 测试 ：-1：用户不存在
		audience_pw = "12345";
		audience_idcard = "08020211111";

		audienceAction01.setAudience_pw(audience_pw);
	

		result = audienceAction01.login();
		tip = audienceAction01.getTip();
		System.out.println("result = " + result + "     tip = " + tip);
	}
	
	
	public void updata(){
		try {
			ApplicationContext cxt = new ClassPathXmlApplicationContext(
					"bean.xml");
			audienceAction01 = (AudienceAction) cxt.getBean("audienceAction");
		} catch (RuntimeException e) {
			e.printStackTrace();
		}
		
		Audience audience01 = new Audience();
		audience01.setAddress("address01");
		audience01.setAudience_nickname("昵称01");

		audience01.setAudience_point(0);
//		audience01.setAudience_pw("12345");
		audience01.setAudience_status("1");

		audience01.setAudience_idcard("080202051014");
		audience01.setAudience_truename("王XX");
		audience01.setPhone("987654321123");
		audience01.setSex("男");
		
		
		audience01.setId("c4c28f80-bf6b-4ba0-a52f-2d5a2de7dac0");
		
		
		audienceAction01.setAudience(audience01);
		result = audienceAction01.update_exceptPw();
		System.out.println("修改 ： " + result);
		
	}
	
	
	public void updataPw(){
		try {
			ApplicationContext cxt = new ClassPathXmlApplicationContext(
					"bean.xml");
			audienceAction01 = (AudienceAction) cxt.getBean("audienceAction");
		} catch (RuntimeException e) {
			e.printStackTrace();
		}
		
		String oldPw = "12345";
		String audience_idcard = "080202051014";
		String newPw = "54321";
		
		audienceAction01.setOldPw(oldPw);
		audienceAction01.setNewPw(newPw);
	
		
		result = audienceAction01.updatePw();
		tip = audienceAction01.getTip();
		System.out.println("result = " + result + "     tip = " + tip);
	}
	
	public void dele(){
		try {
			ApplicationContext cxt = new ClassPathXmlApplicationContext(
					"bean.xml");
			audienceAction01 = (AudienceAction) cxt.getBean("audienceAction");
		} catch (RuntimeException e) {
			e.printStackTrace();
		}
		
		String audience_idcard = "080202051014";
		
		System.out.println("删除 ： " + result);
	}
	
	public void findPoint(){
		try {
			ApplicationContext cxt = new ClassPathXmlApplicationContext(
					"bean.xml");
			audienceAction01 = (AudienceAction) cxt.getBean("audienceAction");
		} catch (RuntimeException e) {
			e.printStackTrace();
		}
		
		String audience_idcard = "080202051014";
		
		result = audienceAction01.findPoint();
		System.out.println(result + "查找    " + audience_idcard + "  积分 ： " + audienceAction01.getPoint());
	}
	
	
	//注意测试时，需要将 perFolioAmount = Integer.parseInt(MyAppConfigs.appConfigs.get("appConfigs"));换成：perFolioAmount = 10;
	public void showAudience_by_page(){
		try {
			ApplicationContext cxt = new ClassPathXmlApplicationContext(
					"bean.xml");
			audienceAction01 = (AudienceAction) cxt.getBean("audienceAction");
		} catch (RuntimeException e) {
			e.printStackTrace();
		}
		
		int page = 1;
		
		audienceAction01.setPage(page);
		
		result = audienceAction01.showAudience_by_page();
		System.out.println("每页显示数：" + audienceAction01.getPerFolioAmount() + "   页数：" + audienceAction01.getHasPages() + "  当前页：" + audienceAction01.getPage());
		for(Audience a : audienceAction01.getAudience_l()){
			System.out.println("用户：" + a.getAudience_truename());
		}
	}
	
	

}
