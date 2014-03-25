package com.bookshop.service;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import com.bookshop.dao.CatagoryDao;
import com.bookshop.entity.Catagory;
import com.bookshop.util.MyServiceParent;
import com.searchEngine.service.KeyWordService;
/**
 * 图书分类信息Service层实现类
 * @author Winds
 *
 */
public class CatagoryServiceImpl extends MyServiceParent implements
		CatagoryService {
	@Resource
	private  CatagoryDao  catagoryDao;
	@Resource
	private KeyWordService keyWordService;
	private String hql;
	
	/*
	 * 修改图书分类
	 * @see com.bookshop.service.CatagoryService#update(com.bookshop.entity.Catagory)
	 */
	public boolean updateName(Catagory catagory) {
		// TODO Auto-generated method stub
		this.session=getSession();
		hql="from Catagory as c where c.catagory_id='"+catagory.getCatagory_id()+"'";
		Catagory c = (Catagory)catagoryDao.find(hql, session);
		if(c!=null){
			String name=null;
			try {
				name = new String(catagory.getCatagory_name().getBytes("iso-8859-1"),"utf-8");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			c.setCatagory_name(name);
			catagoryDao.update(c, session);
			return true;
		}else
			return false;
	}

	/*
	 * 修改图书分类
	 * @see com.bookshop.service.CatagoryService#find(java.lang.String)
	 */
	public boolean find(int catagory_id) {
		// TODO Auto-generated method stub
		this.session=getSession();
		hql="select count(*) from Catagory as c where c.catagory_parent.catagory_id='"+catagory_id+"'";
		System.out.println(myDaoParent.findCount_all(session, hql));
		if(myDaoParent.findCount_all(session, hql)!=0){
			return true;
		}
		hql="select count(*) from Book as b where b.catagory.catagory_id='"+catagory_id+"'";
		System.out.println(myDaoParent.findCount_all(session, hql));
		if(myDaoParent.findCount_all(session, hql)!=0){
			return true;
		}else
			return false;
	}

	/**
	 * 删除图书分类
	 */
	public boolean delete(int catagory_id) {
		// TODO Auto-generated method stub
		this.session=getSession();
		hql="from Catagory as c where c.catagory_id='"+catagory_id+"'";
		Catagory c = (Catagory)catagoryDao.find(hql, session);
		myDaoParent.dele(c, session);
		return true;
	}
	
	/*
	 * 查找一级级级别的所有图书分类
	 * @see com.bookshop.service.CatagoryService#findAll(int)
	 */
	public List<Catagory> findAllFirstCatagory() {
		// TODO Auto-generated method stub
		this.session=getSession();
		hql="from Catagory as c where c.catagory_parent.catagory_id="+null+"";	
		return (List<Catagory>)catagoryDao.findAll(hql, session);
	}
	/*
	 * 查找某一个一级分类的二级级别的所有图书分类
	 * @see com.bookshop.service.CatagoryService#findAll(int)
	 */
	public List<Catagory> findAll(int catagory_id) {
		// TODO Auto-generated method stub
		this.session=getSession();		
		hql="from Catagory as c where c.catagory_parent.catagory_id='"+catagory_id+"'";						
		return (List<Catagory>)catagoryDao.findAll(hql, session);
	}
	
	/*
	 * 查找二级级别的所有图书分类
	 * @see com.bookshop.service.CatagoryService#findAll(int)
	 */
	public List<Catagory> findAllSecondCatagory() {
		// TODO Auto-generated method stub
		this.session=getSession();		
		hql="from Catagory as c where c.catagory_level=2";						
		return (List<Catagory>)catagoryDao.findAll(hql, session);
	}

	/**
	 * 根据分类名称查询
	 */
	public Catagory find(String catagory_name) {
		// TODO Auto-generated method stub
		this.session=getSession();
		hql="from Catagory as c where c.catagory_name='"+catagory_name+"'";
		return (Catagory)catagoryDao.find(hql, session);
	}

	/**
	 * 添加图书分类,同时增加系统关键字
	 */
	public boolean add(Catagory catagory,int firstCatagory_id) {
		// TODO Auto-generated method stub
		this.session=getSession();
		if(firstCatagory_id==0){
			catagory.setCatagory_parent(null);
			catagory.setCatagory_level("1");
		}else{
			hql="from Catagory as c where c.catagory_id='"+firstCatagory_id+"'";
			Catagory c = (Catagory)catagoryDao.find(hql, session);
			catagory.setCatagory_parent(c);
			catagory.setCatagory_level("2");
		}
		catagory.setCreate_date(new Date());
		catagory.setDiscount_date(new Date());
		catagory.setDiscount(1);
		catagoryDao.save(catagory, session);
		keyWordService.addSystemKeyWord(catagory.getCatagory_name());
		return true;
	}
	
	/**
	 * 打折
	 */
	public boolean updateDiscount(Catagory catagory) {
		// TODO Auto-generated method stub
		this.session=getSession();
		hql="from Catagory as c where c.catagory_id='"+catagory.getCatagory_id()+"'";
		Catagory c = (Catagory)catagoryDao.find(hql, session);
		if(c!=null){
			c.setDiscount(catagory.getDiscount());
			c.setDiscount_date(new Date());
			catagoryDao.update(c, session);
			return true;
		}else
			return false;
	}
}
