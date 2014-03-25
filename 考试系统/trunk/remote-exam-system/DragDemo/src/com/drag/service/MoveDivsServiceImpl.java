package com.drag.service;

import javax.annotation.Resource;

import com.drag.dao.MoveDivsDao;
import com.drag.entity.MoveDivs;
import com.drag.util.MyServiceParent;

public class MoveDivsServiceImpl extends MyServiceParent implements MoveDivsService {
	@Resource
	private MoveDivsDao moveDivsDao;
	private String hql;
	
	/**
	 * 新增一张地图
	 */
	public boolean save(String div_content) {
		// TODO Auto-generated method stub
		this.session =this.getSession();
		MoveDivs md =new MoveDivs("new");
		md.setDiv_content(div_content);
		moveDivsDao.save(md, session);
		return true;
	}
	
	public boolean save(String moveDivs_id, String div_content) {
		// TODO Auto-generated method stub
		this.session =this.getSession();
		MoveDivs md =new MoveDivs();
		md.setMoveDivs_id(moveDivs_id);
		md.setDiv_content(div_content);
		moveDivsDao.save(md, session);
		return false;
	}
	
	/**
	 * 更新地图内容
	 */
	public boolean update(String moveDivs_id, String div_content) {
		// TODO Auto-generated method stub
		if(find(moveDivs_id)!=null){
			MoveDivs md =find(moveDivs_id);
			md.setDiv_content(div_content);
			moveDivsDao.update(md, session);
			return true;
		}
		return false;
	}

	/**
	 * 通过地图id查找地图
	 */
	public MoveDivs find(String moveDivs_id) {
		// TODO Auto-generated method stub
		this.session=this.getSession();
		hql ="from MoveDivs md where md.moveDivs_id='"+moveDivs_id+"'";
		MoveDivs md =(MoveDivs)moveDivsDao.find(hql, session);
		return md;
	}

	public MoveDivs findByDivContent(String div_content) {
		// TODO Auto-generated method stub
		this.session=this.getSession();
		hql ="from MoveDivs md where md.div_content='"+div_content+"'";
		MoveDivs md =(MoveDivs)moveDivsDao.find(hql, session);
		return md;
	}

	

}
