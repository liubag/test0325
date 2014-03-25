package com.bookshop.service;

import java.util.List;

import com.bookshop.entity.Promotion;

/**
 * 优惠活动信息Service层接口
 * @author Winds
 *
 */
public interface PromotionService {
	public boolean add(Promotion promotion);
	public boolean delete(String promotion_id);
	public Promotion find(String promotion_id);
	public String gainCatagory_l(String catagoryString);
	public boolean update(Promotion promotion);
	public boolean findNotExpirePromotion_by_time(String promotion_id);
	
	public Long hasNumbers(int status);
	public List<?> show_by_page(int page,int perFolioAmount,int status);
}
