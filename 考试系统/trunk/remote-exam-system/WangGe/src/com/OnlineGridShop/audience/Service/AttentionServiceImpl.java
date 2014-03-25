package com.OnlineGridShop.audience.Service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import com.OnlineGridShop.audience.Dao.AttentionDao;
import com.OnlineGridShop.audience.Entity.Attention;
import com.OnlineGridShop.audience.Entity.AttentionGrid;
import com.OnlineGridShop.audience.Entity.Audience;
import com.OnlineGridShop.brand.Entity.BrandgridGrid;
import com.OnlineGridShop.brand.Entity.BrandgridPreferential;
import com.OnlineGridShop.scattered.Entity.ScatteredGrid;
import com.OnlineGridShop.scattered.Entity.ScatteredGridPreferential;
import com.OnlineGridShop.util.MyAppConfigs;
import com.OnlineGridShop.util.MyDaoParent2;
import com.OnlineGridShop.util.MySerivceParent;

public class AttentionServiceImpl extends MySerivceParent implements AttentionService{
	@Resource
	private AttentionDao attentionDao;
	@Resource
	private MyDaoParent2 myDaoParent;
	private String hql;
	
	/**
	 * 添加关注信息
	 */
	public String add(String audience_id, String obj_id, int type,int subType) {
		// TODO Auto-generated method stub
		this.session=getSession();
		String ownerId=null;
		if(type==0&&subType==0){
			hql="select bgg.brandgrid_grid_owner_id from BrandgridGrid as bgg where bgg.brandgrid_grid_id='"+obj_id+"'";
			ownerId=(String)attentionDao.find(hql, session);
		}else{
			ownerId=obj_id;
		}
		if(ownerId!=null){
			hql="from Attention as a where a.audience.id='"+audience_id+"' and a.obj_id='"+obj_id+"'";
			if(attentionDao.find(hql, session)==null){
				//还有判断该会员的关注个数是否》100		
				hql="from Audience as au where au.id='"+audience_id+"'";
				Audience au=(Audience)attentionDao.find(hql, session);
				
				Attention a=new Attention("attention");
				a.setAudience(au);
				a.setObj_id(ownerId);
				a.setType(type);
				a.setState(0);
				a.setSubType(subType);
				attentionDao.save(a, session);
				
//				au.setAttentionCount(au.getAttentionCount()+1);
				attentionDao.update(au, session);
				return "success";
			}else
				return "fail2";
		}else{
			return "fail1";
		}
		
	}
	/**
	 * 发布新的优惠信息之后的操作
	 */
	public void publishOperate(String grid_id,List<String> goods_id) {
		// TODO Auto-generated method stub
		this.session=getSession();
		hql="select distinct a.audience.id from Attention as a where a.obj_id='"+grid_id+"'";
		for(String id : goods_id){
			hql+="or a.obj_id='"+id+"'";
		}
		List<?> audienceId_l=attentionDao.findAll(hql, session);
		//调用广播事件
		
	}

	/**
	 * 取消关注
	 */
	public String delete(String audience_id, String obj_id) {
		// TODO Auto-generated method stub
		this.session=getSession();
		hql="from Attention as a where a.audience.id='"+audience_id+"' and a.obj_id='"+obj_id+"'";
		Attention a=(Attention)attentionDao.find(hql, session);
		if(a!=null){
			attentionDao.dele(a, session);
			hql="from Audience as au where au.id='"+audience_id+"'";
			Audience au=(Audience)attentionDao.find(hql, session);
	//		au.setAttentionCount(au.getAttentionCount()-1);
			attentionDao.update(au, session);
			return "success";
		}else
			return "fail";
	}
	/**
	 * 查找未读信息的个数
	 */
	public long findUnreadCount(String audience_name) {
		// TODO Auto-generated method stub
		this.session=getSession();
		hql="select count(*) from Attention as a where a.audience.audience_nickname='"+audience_name+"' and a.state=0";
		long count=myDaoParent.findCount_all(session, hql);
		return count;
	}
	/**
	 * 查找条数
	 */
	public long findAllCount(String audience_name, int subType,int type) {
		// TODO Auto-generated method stub
		this.session=getSession();
		hql="select count(*) from Attention as a where a.audience.audience_nickname='"+audience_name+"' and a.type='"+type+"' and a.subType='"+subType+"'";
	//	Attention a=(Attention)attentionDao.find(hql, session);
		long count=myDaoParent.findCount_all(session, hql);
		return count;
	}
	/**
	 * 查找页数
	 */
	public int findAllPages(String audience_name, int subType,int type) {
		// TODO Auto-generated method stub
		this.session = this.getSession();
		int pagenum;
		hql="select count(*) from Attention as a where a.audience.audience_nickname='"+audience_name+"' and a.type='"+type+"' and a.subType='"+subType+"'";
	//	int perFolioAmount = Integer.parseInt(MyAppConfigs.appConfigs.get("perFolioAmount"));
		int perFolioAmount = 1;
		Long num1 = myDaoParent.findCount_all(session, hql);
		int num = num1.intValue();
		pagenum = num/perFolioAmount;
		num = num%perFolioAmount;
		if(num>0){
			pagenum++;
		}
		return pagenum;
	}
	/**
	 * 查找此页的数据
	 */
	public List<?> showAttention_by_page(String audience_name, int type,
			int subType, int page) {
		// TODO Auto-generated method stub
		this.session=getSession();
//		int perFolioAmount = Integer.parseInt(MyAppConfigs.appConfigs.get("perFolioAmount"));
		int perFolioAmount = 1;
		List list=new ArrayList();
		
		hql="select a.obj_id from Attention as a where a.audience.audience_nickname='"+audience_name+"' and a.type='"+type+"' and a.subType='"+subType+"'";
		List<String> objId_l=(List<String>)myDaoParent.findAll(hql, session);
		if(type==0&&subType==0){
			if(objId_l!=null){
				hql="from BrandgridGrid as bgg where ";
				for(String id:objId_l){
					hql+="bgg.brandgrid_grid_owner_id='"+id+"' or ";
				}
				hql=hql.substring(0, hql.lastIndexOf("or"));
				List<BrandgridGrid> l=(List<BrandgridGrid>)myDaoParent.show_by_page_all(page, perFolioAmount, session, hql);
				for(BrandgridGrid bbg : l){
					hql="from BrandgridPreferential as bgp where bgp.brandgridGridOwner.brandgrid_gridowner_id='"+bbg.getBrandgrid_grid_owner_id()+"'";
					BrandgridPreferential bgp=(BrandgridPreferential)myDaoParent.find(hql, session);
					AttentionGrid ag = new AttentionGrid(bbg,null,bgp,null); 
					list.add(ag);
				}
			}						
		}else if(type==0&&subType==1){
			if(objId_l!=null){
				hql="from ScatteredGrid as sg where ";
				for(String id:objId_l){
					hql+="sg.gridid='"+id+"' or ";
				}
				hql=hql.substring(0, hql.lastIndexOf("or"));
				List<ScatteredGrid> l=(List<ScatteredGrid>)myDaoParent.show_by_page_all(page, perFolioAmount, session, hql);
				for(ScatteredGrid sg : l){
					hql="from ScatteredGridPreferential as sgp where sgp.scatteredGrid.gridid='"+sg.getGridid()+"'";
					ScatteredGridPreferential sgp=(ScatteredGridPreferential)myDaoParent.find(hql, session);
					AttentionGrid ag = new AttentionGrid(null,sg,null,sgp); 
					list.add(ag);
				}
			}
			
		}else if(type==1&&subType==0){
			if(objId_l!=null){
				hql="from BrandgridGoods as bgg where ";
				for(String id:objId_l){
					hql+="bgg.brandgrid_goods_id='"+id+"' or ";
				}
				hql=hql.substring(0, hql.lastIndexOf("or"));
				list=myDaoParent.show_by_page_all(page, perFolioAmount, session, hql);
			}
			
		}else if(type==1&&subType==1){
			if(objId_l!=null){
				hql="from ScatteredGridGoods as sg where ";
				for(String id:objId_l){
					hql+="sg.goods_id='"+id+"' or ";
				}
				hql=hql.substring(0, hql.lastIndexOf("or"));
				list=myDaoParent.show_by_page_all(page, perFolioAmount, session, hql);
				
			}
			
		}
		return list;
	}
	

}
