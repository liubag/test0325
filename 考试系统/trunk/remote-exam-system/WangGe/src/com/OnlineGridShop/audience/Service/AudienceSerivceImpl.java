package com.OnlineGridShop.audience.Service;

import java.util.List;

import javax.annotation.Resource;

import com.OnlineGridShop.audience.Dao.AudienceDao;
import com.OnlineGridShop.audience.Entity.Audience;
import com.OnlineGridShop.util.MyAppConfigs;
import com.OnlineGridShop.util.MySerivceParent;


public class AudienceSerivceImpl extends MySerivceParent implements AudienceSerivce {
	@Resource
	private AudienceDao audienceDao;
	
	
	public void dele(String audience_nickname) {
		// TODO Auto-generated method stub
		this.session = this.getSession();
		
		audienceDao.dele(audienceDao.find_nickname(audience_nickname, session), session);
	}
	


	public Audience find(String id) {
		// TODO Auto-generated method stub
		this.session = this.getSession();
		Audience audience = audienceDao.find_id(id, session);
		return audience;
	}

	public int findAllAudiencePages() {
		// TODO Auto-generated method stub
		this.session = this.getSession();
		int pagenum;
		int perFolioAmount = Integer.parseInt(MyAppConfigs.appConfigs.get("perFolioAmount"));
		Long num1 = audienceDao.findCount(session);
		int num = num1.intValue();
		pagenum = num/perFolioAmount;
		num = num%perFolioAmount;
		if(num>0){
			pagenum++;
		}
		return pagenum;
	}

	public Integer findPoints(String audience_nickname) {
		// TODO Auto-generated method stub
		this.session = this.getSession();
		Integer points = audienceDao.findPoints(audience_nickname, session);
		return points;
	}

	/*
	 * 1：成功 ；0 ：密码错误；-1：用户不存在
	 */
	public int login(String audience_nickname , String audience_pw) {
		// TODO Auto-generated method stub
		this.session = this.getSession();
		Audience audience = audienceDao.find_nickname(audience_nickname, session);
		if(audience == null){
			return -1;
		}
		if(audience.getAudience_pw().equals(audience_pw) && audience.getAudience_status().equals("1")){
			return 1;
		}else if(audience.getAudience_status().equals("0")){
			return 2;
		}else{
			return 0;
		}
	}

	public List<Audience> showAudience_by_page(int page) {
		// TODO Auto-generated method stub
		this.session = this.getSession();
		int perFolioAmount = Integer.parseInt(MyAppConfigs.appConfigs.get("perFolioAmount"));
		return audienceDao.showAudience_by_page(page, perFolioAmount, session);
	}

	public boolean updataPw(String audience_nickname,String oldPw, String newPw) {
		// TODO Auto-generated method stub
		this.session = this.getSession();
		Audience audience = audienceDao.find_nickname(audience_nickname, session);
		if(audience.getAudience_pw().equals(oldPw)){
			audience.setAudience_pw(newPw);
			return true;
		}
		return false;
	}

	
	/*
	 * 可以修改地址、昵称、联系方式
	 * (non-Javadoc)
	 * @see com.OnlineGridShop.audience.Service.AudienceSerivce#updata_exceptPw(com.OnlineGridShop.audience.Entity.Audience)
	 */
	public boolean update_exceptPw(Audience audience) {
		// TODO Auto-generated method stub
		try {
			this.session = this.getSession();
			Audience aud = audienceDao.find_nickname(audience.getAudience_nickname(), session);
			aud.setSex(audience.getSex());
			aud.setAddress(audience.getAddress());
			aud.setPhone(audience.getPhone());
			audienceDao.update(aud, session);
			return true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		
	}

	public boolean save(Audience audience) {
		// TODO Auto-generated method stub
		try {
			this.session =this.getSession();
			Audience aud =new Audience("new");
			aud.setAudience_status("1");
			aud.setAudience_point(0);
			aud.setAudience_nickname(audience.getAudience_nickname());
			aud.setAudience_pw(audience.getAudience_pw());
			aud.setAudience_idcard(audience.getAudience_idcard());
			aud.setAudience_truename(audience.getAudience_truename());
			aud.setPhone(audience.getPhone());
			aud.setSex(audience.getSex());
			aud.setAddress(audience.getAddress());
			audienceDao.save(aud, session);
			return true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}

	/**
	 * 通过用户名（昵称）查找用户
	 */
	public Audience find_nickname(String audience_nickname) {
		// TODO Auto-generated method stub
		Audience aud =null;
		this.session=this.getSession();
		aud =audienceDao.find_nickname(audience_nickname, session);
		System.out.println(audience_nickname);
		return aud;
	}

	public long findAllAudienceCount() {
		// TODO Auto-generated method stub
		this.session=this.getSession();
		return audienceDao.findCount(session);
	}

	public boolean AudienceCancel(String id) {
		// TODO Auto-generated method stub
		try {
			this.session =this.getSession();
			Audience aud =audienceDao.find_id(id, session);
			if(aud!=null){
				aud.setAudience_status("0");
				audienceDao.update(aud, session);
				return true;
			}
			return false;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}

	public boolean AudienceActive(String id) {
		try {
			this.session =this.getSession();
			Audience aud =audienceDao.find_id(id, session);
			if(aud!=null){
				aud.setAudience_status("1");
				audienceDao.update(aud, session);
				return true;
			}
			return false;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}



	public Audience find_idcard(String audience_idcard) {
		// TODO Auto-generated method stub
		this.session=this.getSession();
		Audience aud =null;
		aud=audienceDao.find_idcard(audience_idcard, session);
		return aud;
	}



	public boolean updateIdcardAndTruename(Audience audience) {
		// TODO Auto-generated method stub
		try {
			this.session=this.getSession();
			Audience aud =audienceDao.find_nickname(audience.getAudience_nickname(), session);
			aud.setAudience_idcard(audience.getAudience_idcard());
			aud.setAudience_truename(audience.getAudience_truename());
			audienceDao.update(aud, session);
			return true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}

}
