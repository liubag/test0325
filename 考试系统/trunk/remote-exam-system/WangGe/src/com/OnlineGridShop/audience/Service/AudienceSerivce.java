package com.OnlineGridShop.audience.Service;

import java.util.List;

import com.OnlineGridShop.audience.Entity.Audience;

public interface AudienceSerivce {
	public boolean save(Audience audience);
	public Audience find(String id);
	public Audience find_nickname(String audience_nickname);
	public Audience find_idcard(String audience_idcard);
	public int login(String audience_studentid , String audience_pw);  //1：成功 ；0 ：密码错误；-1：用户不存在
	public boolean update_exceptPw(Audience audience);   //更新不包括密码
	public boolean updataPw(String audience_nickname,String oldPw,String newPw); //修改密码
	public boolean updateIdcardAndTruename(Audience audience);//修改身份证和真实姓名
	public void dele(String audience_nickname); 
	public int findAllAudiencePages();  //查询页数
	public long findAllAudienceCount();
	public List<Audience> showAudience_by_page(int page);  //根据页数遍历
	public Integer findPoints(String audience_nickname);  //查积分
	/**
	 * 注销会员
	 * @param id
	 * @return
	 */
	public boolean AudienceCancel(String id);//注销会员
	/**
	 * 激活会员
	 * @param id
	 * @return
	 */
	public boolean AudienceActive(String id);// 激活会员
	
}
