package com.drag.service;

import javax.annotation.Resource;

import com.drag.dao.TitleDao;
import com.drag.entity.Title;
import com.drag.util.MyServiceParent;


public class TitleServiceImpl extends MyServiceParent implements TitleService {
	@Resource
	private TitleDao titleDao;
	@Resource
	private MoveDivsService moveDivsService;
	private String hql;
	public Title findTitle(String div_id, String moveDivs_id) {
		// TODO Auto-generated method stub
		this.session=getSession();
		hql="from Title as t where t.div_id='"+div_id+"' and t.moveDivs_id='"+moveDivs_id+"'";
		return (Title)titleDao.find(hql, session);
	}
	public boolean updateTitle(Title title) {
		// TODO Auto-generated method stub
		this.session=getSession();
		Title t;
		hql="from Title as t where t.div_id='"+title.getDiv_id()+"' and t.moveDivs_id='"+title.getMoveDivs_id()+"'";
		t=(Title)titleDao.find(hql, session);
		if(t!=null){
			t.setFile(title.getFile());
			t.setVersion(title.getVersion());
			titleDao.save(t, session);			
		}else if(moveDivsService.find(title.getMoveDivs_id())==null){
			return false;
		}else{
			t=new Title("title");
			t.setDiv_id(title.getDiv_id());
			t.setMoveDivs_id(title.getMoveDivs_id());
			t.setFile(title.getFile());
			t.setVersion(title.getVersion());
			titleDao.save(t, session);	
		}
		return true;
	}
	
	
	public boolean save(Title title) {
		// TODO Auto-generated method stub
		this.session=getSession();
		Title t=new Title("new");
		t.setDiv_id(title.getDiv_id());
		t.setFile(title.getFile());
		t.setMoveDivs_id(title.getMoveDivs_id());
		t.setVersion(title.getVersion());
		titleDao.save(t, session);
		return true;
	}
	public boolean dele(String div_id, String moveDivs_id) {
		// TODO Auto-generated method stub
		this.session=getSession();
		Title t= findTitle(div_id, moveDivs_id);
		if(t!=null){
			titleDao.dele(t, session);
			return true;
		}
		return false;
	}

	
	
}
