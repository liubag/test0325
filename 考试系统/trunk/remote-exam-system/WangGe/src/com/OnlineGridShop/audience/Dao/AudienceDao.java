package com.OnlineGridShop.audience.Dao;

import java.util.List;

import org.hibernate.Session;

import com.OnlineGridShop.audience.Entity.Audience;

public interface AudienceDao{
	public void save(Audience audience,Session session);
	public Audience find_idcard(String audience_idcard,Session session);
	public Audience find_nickname(String audience_nickname,Session session);
	public Audience find_id(String id,Session session);
	public void update(Audience audience,Session session);
	public void dele(Audience audience,Session session); 
	public Long findCount(Session session);
	public List<Audience> showAudience_by_page(int page,int per_folio_amount,Session session);  //根据页数遍历
	public Integer findPoints(String audience_nickname,Session session);  //查积分
}
