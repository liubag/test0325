package com.searchEngine.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;

import com.searchEngine.dao.KeyWordDao;
import com.searchEngine.dao.KeyWordGoodsDao;
import com.searchEngine.entity.KeyWord;
import com.searchEngine.util.MyServiceParent;
import com.searchEngine.util.XmlAndHqlString;

public class KeyWordServiceImpl extends MyServiceParent implements KeyWordService {
	@Resource
	private KeyWordDao keyWordDao;
	
	private Session session;
	
	
	@Resource
	private KeyWordGoodsDao keyWordGoodsDao;

	
	
	
	public void gainGoods_by_keyWord(String keyword_content,int rowName) {		
		// TODO Auto-generated method stub
		this.session=getSession();
		//�ж������Ƿ�Ϊ��
		if(XmlAndHqlString.entityName == null){
			XmlAndHqlString.initString();
		}


		KeyWord kw=null;
		
		kw = (KeyWord)keyWordDao.find(XmlAndHqlString.getKeyWord_hql(keyword_content), session);
		
		
		Long number = keyWordGoodsDao.findCount_all(session, XmlAndHqlString.getEntityNameCount_hql(keyword_content,rowName));
		
		if(kw==null){			
			if(number!=0){
				kw=new KeyWord("keyWord");
				kw.setKeyword_content(keyword_content);
				kw.setKeyword_has_goods(number.intValue());
				kw.setKeyword_status(0);
				kw.setKeyword_today_click(1);
				kw.setKeyword_before_click(0);
				session.save(kw);
			}
		}else{
			if(kw.getKeyword_status()==1){
				kw.setKeyword_has_goods(number.intValue());
				session.save(kw);
			}else{
				if(number!=0){
					kw.setKeyword_has_goods(number.intValue());
					kw.setKeyword_today_click(kw.getKeyword_today_click()+1);
					session.save(kw);
				}else{
					session.delete(kw);
				}
			}
		}
		
		
		
		
	}
	
	
	//��ҳ��ʾ��Ҫ������
	public List<List<?>> showAll(String keyword_content,int page,int perFolioAmount,String otherOrderBy,int rowName){
		this.session = this.getSession();
		List<List<?>> l = new ArrayList<List<?>>();
		//�ж������Ƿ�Ϊ��
		if(XmlAndHqlString.entityName == null){
			XmlAndHqlString.initString();
		}
		Query q = session.createQuery(XmlAndHqlString.getKeyWord_l_hql(keyword_content,otherOrderBy,rowName));
		if(q.list().size() > 0){
			q.setFirstResult((page-1)*perFolioAmount);
			q.setMaxResults(perFolioAmount);
		}
		l.add((List<?>)q.list());
		return l;
	}
	
	

	public Long findCount(String keywordContent,int rowName) {
		// TODO Auto-generated method stub
		this.session = this.getSession();
		//�ж������Ƿ�Ϊ��
		if(XmlAndHqlString.entityName == null){
			XmlAndHqlString.initString();
		}
		Long number = keyWordGoodsDao.findCount_all(session, XmlAndHqlString.getEntityNameCount_hql(keywordContent,rowName));
		
		
		return number;
	}


	//���ϵͳ�ؼ���
	
	public boolean addSystemKeyWord(String keyword_content) {
		// TODO Auto-generated method stub
		this.session = this.getSession();
		KeyWord kw=null;		
		kw = (KeyWord)keyWordDao.find(XmlAndHqlString.getKeyWord_hql(keyword_content), session);
		if(kw != null){
			return false;
		}
		kw=new KeyWord("keyWord");
		kw.setKeyword_content(keyword_content);
		//�ж������Ƿ�Ϊ��
		if(XmlAndHqlString.entityName == null){
			XmlAndHqlString.initString();
		}
		Long number = keyWordGoodsDao.findCount_all(session, XmlAndHqlString.getEntityNameCount_hql(keyword_content,3));
		kw.setKeyword_has_goods(number.intValue());
		kw.setKeyword_status(1);
		kw.setKeyword_today_click(0);
		kw.setKeyword_before_click(60000);
		session.save(kw);
		return true;
	}
	
	
	
	//���ҹؼ����б�
	public List<KeyWord> findKeyWord_By_Rate(String keyWord) {
		// TODO Auto-generated method stub
		this.session=getSession();
		System.out.println(XmlAndHqlString.getKeyWord_orderBy_hql(keyWord));
		return keyWordDao.findKeyWord_By_Rate(XmlAndHqlString.getKeyWord_orderBy_hql(keyWord), session);
	}
	
	//���ҹؼ���
	public KeyWord find(String keyWord) {
		// TODO Auto-generated method stub
		this.session=getSession();	
		return (KeyWord)keyWordDao.find(XmlAndHqlString.getKeyWord_hql(keyWord), session);
	}


	/**
	 * ����ؼ��ִʿ⣬ɾ�������Ĺؼ���
	 */
	public boolean updataKeyWord_max() {
		// TODO Auto-generated method stub
		this.session = this.getSession();
		//�ж������Ƿ�Ϊ��
		if(XmlAndHqlString.entityName == null){
			XmlAndHqlString.initString();
		}
		Query q =session.createQuery("from KeyWord as kw order by kw.keyword_before_click desc");
		if(q.list().size()>XmlAndHqlString.keyWords_max){
			q.setFirstResult(XmlAndHqlString.keyWords_max-1);
			q.setMaxResults(1);
			KeyWord kw = (KeyWord)q.list().get(0);
			String hql ="delete from KeyWord kw where kw.keyword_before_click<:theMinClick";
			session.createQuery(hql).setFloat("theMinClick", kw.getKeyword_before_click()).executeUpdate();
		}
		
		return true;
	}

	/**
	 * ÿ�춨ʱ�������йؼ��ֵĵ����
	 */
	public boolean updataKeyWord_Click() {
		// TODO Auto-generated method stub
		this.session = this.getSession();System.out.println("updata keyword!");
		String hql ="update KeyWord as kw set kw.keyword_before_click=kw.keyword_before_click*0.6+kw.keyword_today_click*0.4,kw.keyword_today_click=0 where kw.keyword_status='0'";
		session.createQuery(hql).executeUpdate();
		return true;
	}


	public String findFridKeyWord() {
		// TODO Auto-generated method stub
		this.session = this.getSession();
		String hql = "select keyword_content from KeyWord where keyword_status='0' order by keyword_today_click desc";
		return (String) this.keyWordGoodsDao.find(hql, session);
	}


	public Long findKeyWordCount() {
		// TODO Auto-generated method stub
		this.session = this.getSession();
		String hql = "select count(*) from KeyWord";
		return keyWordGoodsDao.findCount_all(session, hql);
	}

	@SuppressWarnings("unchecked")
	public List<KeyWord> showKeyWord_by_page(int page, int perFolioAmount) {
		// TODO Auto-generated method stub
		this.session = this.getSession();
		//�ж������Ƿ�Ϊ��
		if(XmlAndHqlString.entityName == null){
			XmlAndHqlString.initString();
		}
		Query q =session.createQuery("from KeyWord as kw order by kw.keyword_before_click desc");
		q.setFirstResult((page-1)*perFolioAmount);
		q.setMaxResults(perFolioAmount);
		return (List<KeyWord>)q.list();
	}


	public boolean deleKeyWord(String keywordId) {
		// TODO Auto-generated method stub
		this.session = this.getSession();
		String hql = "from KeyWord where keyword_id='" + keywordId + "'";
		KeyWord ke = (KeyWord) this.keyWordDao.find(hql, session);
		if(ke == null){
			return false;
		}
		this.keyWordDao.dele(ke, session);
		return true;
	}

	

	
}
