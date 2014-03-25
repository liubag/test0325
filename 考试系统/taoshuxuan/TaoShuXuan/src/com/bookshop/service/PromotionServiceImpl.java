package com.bookshop.service;

import java.io.File;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;

import com.bookshop.dao.PromotionDao;
import com.bookshop.entity.Promotion;
import com.bookshop.util.DateUtil;
import com.bookshop.util.MyServiceParent;
import com.bookshop.util.StringUtil;
/**
 * 优惠活动信息Service层实现类
 * @author Winds
 *
 */
public class PromotionServiceImpl extends MyServiceParent implements
		PromotionService {
	@Resource
	private PromotionDao promotionDao;
	private String hql;
	
	/**
	 * 添加优惠信息
	 * @return
	 */
	public boolean add(Promotion promotion) {
		// TODO Auto-generated method stub
		session=getSession();
		Promotion p=new Promotion("new");
		p.setCreate_date(new Date());
		p.setEffective_date(promotion.getEffective_date());
		p.setExpiry_date(promotion.getExpiry_date());
		p.setNeed_amount(promotion.getNeed_amount());
		p.setPromotion_image(promotion.getPromotion_image());
		p.setPromotion_catagorys(promotion.getPromotion_catagorys());
		p.setPromotion_type(promotion.getPromotion_type());
		if(promotion.getPromotion_type()==1){
			p.setPromotion_discount(promotion.getPromotion_discount());
		}else if(promotion.getPromotion_type()==2){
			p.setPromotion_money(promotion.getPromotion_money());
		}
		promotionDao.save(p, session);
		return true;
	}

	/**
	 * 删除优惠信息
	 */
	public boolean delete(String promotion_id) {
		// TODO Auto-generated method stub
		this.session=getSession();
		hql="from Promotion as p where p.promotion_id='"+promotion_id+"'";
		Promotion p = (Promotion)promotionDao.find(hql, session);
		String savePath= ServletActionContext.getServletContext().getRealPath("/../BookImages/activity/"+p.getPromotion_image());
		savePath=savePath.replace("\\", "/");
		File imageFile=new File( savePath);
		if(imageFile!=null){
			imageFile.delete();
		}
		promotionDao.dele(p, session);
		return true;
	}

	/**
	 * 获取优惠信息
	 */
	public Promotion find(String promotion_id) {
		// TODO Auto-generated method stub
		this.session=getSession();
		hql="from Promotion as p where p.promotion_id='"+promotion_id+"'";
		Promotion p = (Promotion)promotionDao.find(hql, session);
		return p;
	}

	/**
	 * 获取优惠的图书分类
	 */
	public String gainCatagory_l(String catagoryString) {
		// TODO Auto-generated method stub
		this.session=getSession();
		List<String> catagoryString_l = StringUtil.getOption(catagoryString, ",");
		String catagoryStr="";
		for(String id:catagoryString_l){
			hql="select c.catagory_name from Catagory as c where c.catagory_id='"+id+"'";
			catagoryStr+=(String)promotionDao.find(hql, session)+",";
		}
		catagoryStr=catagoryStr.substring(0, catagoryStr.lastIndexOf(","));
		System.out.println(catagoryStr);
		return catagoryStr;
	}

	/**
	 * 修改未过期的优惠信息
	 */
	public boolean update(Promotion promotion) {
		// TODO Auto-generated method stub
		this.session=getSession();
		hql="from Promotion as p where p.promotion_id='"+promotion.getPromotion_id()+"'";
		Promotion p = (Promotion)promotionDao.find(hql, session);
		p.setCreate_date(promotion.getCreate_date());
		p.setEffective_date(promotion.getEffective_date());
		p.setExpiry_date(promotion.getExpiry_date());
		p.setNeed_amount(promotion.getNeed_amount());
		p.setPromotion_type(promotion.getPromotion_type());
		if(promotion.getPromotion_image().length()>0){
			//删除原先的图书封面
			String savePath= ServletActionContext.getServletContext().getRealPath("/../BookImages/activity/"+promotion.getPromotion_image());
			savePath=savePath.replace("\\", "/");
			File imageFile=new File( savePath);
			if(imageFile!=null){
				imageFile.delete();
			}
			p.setPromotion_image(promotion.getPromotion_image());
		}
		if(promotion.getPromotion_type()==1){
			p.setPromotion_discount(promotion.getPromotion_discount());
			p.setPromotion_money(0);
		}else if(promotion.getPromotion_type()==2){
			p.setPromotion_discount(1);
			p.setPromotion_money(promotion.getPromotion_money());
		}
		if(promotion.getPromotion_catagorys().length()>0){
			p.setPromotion_catagorys(promotion.getPromotion_catagorys());
		}
		promotionDao.update(p, session);
		return true;
	}

	/**
	 * 查找未过期优惠是否有效了
	 */
	public boolean findNotExpirePromotion_by_time(String promotion_id) {
		// TODO Auto-generated method stub
		this.session=getSession();
		String t_today=DateUtil.dateToString(new Date());
		hql="from Promotion as p where p.promotion_id='"+promotion_id+"' and p.effective_date<='"+t_today+"'";
		if(promotionDao.find(hql, session)!=null)
			return true;
		else
			return false;
	}

	public Long hasNumbers(int status) {
		// TODO Auto-generated method stub
		this.session=this.getSession();	
		String t_today=DateUtil.dateToString(new Date());
		if(status==0){
			hql="select count(*) from Promotion as p where p.expiry_date<='"+t_today+"'";
		}else if(status==1){
			hql="select count(*) from Promotion as p where p.expiry_date>'"+t_today+"'";
		}		
		return myDaoParent.findCount_all(session, hql);
	}

	public List<?> show_by_page(int page, int perFolioAmount, int status) {
		// TODO Auto-generated method stub
		this.session=this.getSession();	
		String t_today=DateUtil.dateToString(new Date());
		if(status==0){
			hql="from Promotion as p where p.expiry_date<='"+t_today+"'";
		}else if(status==1){
			hql="from Promotion as p where p.expiry_date>'"+t_today+"'";
		}
		return myDaoParent.show_by_page_all( page, perFolioAmount, session, hql);
	}
	
}
