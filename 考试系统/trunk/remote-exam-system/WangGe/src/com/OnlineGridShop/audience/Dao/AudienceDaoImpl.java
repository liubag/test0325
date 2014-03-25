package com.OnlineGridShop.audience.Dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.OnlineGridShop.audience.Entity.Audience;

@SuppressWarnings("unchecked")
public class AudienceDaoImpl implements AudienceDao {

	public void dele(Audience audience, Session session) {
		// TODO Auto-generated method stub
		session.delete(audience);
	}

	public Audience find_idcard(String audience_idcard, Session session) {
		// TODO Auto-generated method stub
		Query quary = session.createQuery("from Audience where audience_idcard='" + audience_idcard + "'");
		List<Audience> l = quary.list();
		if(l.size()!=0){
			return l.get(0);
		}else{
			return null;
		}
	}
	
	public Audience find_nickname(String audience_nickname, Session session) {
		// TODO Auto-generated method stub
		Query quary = session.createQuery("from Audience where audience_nickname='" + audience_nickname + "'");
		List<Audience> l = quary.list();
		if(l.size()!=0){
			return l.get(0);
		}else{
			return null;
		}
	}


	public Integer findPoints(String audience_nickname, Session session) {
		// TODO Auto-generated method stub
		Query q = session.createQuery("select audience_point from Audience where audience_nickname=? and audience_status='1'");
		q.setParameter(0, audience_nickname);
		if(q.list().size()!=0){
			return (Integer)q.list().get(0);
		}else{
			return 0;
		}
	}

	public void save(Audience audience, Session session) {
		// TODO Auto-generated method  	
		session.save(audience);
	}

	public List<Audience> showAudience_by_page(int page,int per_folio_amount, Session session) {
		// TODO Auto-generated method stub
		List<Audience> l = new ArrayList<Audience>();
		Query q = session.createQuery("from Audience");
		if(q.list().size() > 0){
			q.setFirstResult((page-1)*per_folio_amount);
			q.setMaxResults(per_folio_amount);
			l = (List<Audience>)q.list();
		}
		return l;
	}

	public void update(Audience audience, Session session) {
		// TODO Auto-generated method stub
		session.update(audience);
	}

	public Audience find_id(String id, Session session) {
		// TODO Auto-generated method stub
		Query quary = session.createQuery("from Audience where id='" + id + "'");
		List<Audience> l = quary.list();
		if(l.size()!=0){
			return l.get(0);
		}else{
			return null;
		}
	}

	public Long findCount(Session session) {
		// TODO Auto-generated method stub
		Query q = session.createQuery("select count(*) from Audience");
		Long coount = (Long)q.list().get(0);
		return coount;
	}
}
