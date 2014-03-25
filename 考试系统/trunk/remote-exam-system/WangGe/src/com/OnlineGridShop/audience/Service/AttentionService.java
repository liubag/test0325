package com.OnlineGridShop.audience.Service;

import java.util.List;


public interface AttentionService {
	public String add(String audience_id,String obj_id,int type,int subType);
	public String delete(String audience_id,String obj_id);
	public void publishOperate(String grid_id,List<String> goods_id);
	public long findUnreadCount(String audience_name);
	public int findAllPages(String audience_name,int subType,int type);  //查询页数
	public long findAllCount(String audience_name,int subType,int type);
	public List<?> showAttention_by_page(String audience_name,int type,int subType,int page);  //根据页数遍历
}
