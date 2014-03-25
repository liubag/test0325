package com.OnlineGridShop.aahome.serivce;

import java.io.File;
import java.util.List;
import java.util.Map;

@SuppressWarnings("unchecked")
public interface AahomeSerivce {
	
	public Map<String,List> showHome_aa();
	public List<Long> hasGoods(Integer type_id,String filter_type);
	public List<List<?>> showGoods_by_page(Integer type_id,int page,int perFolioAmount,String filter_type,String show_type);
	public Long showAllGrid_aa (String filter_type);
	public List<?> showGoods_by_page(int page,int perFolioAmount,String filter_type);
	public Long showAllBgGrid_aa (String brandgrid_id);
	public List showBgGrid_by_page(int page,int perFolioAmount,String brandgrid_id);
	public String showToUpdata_aa();
	/*
	 * 添加广告位
	 */
	public boolean addGuangGao_aa(String mytime,String add_type,String li_id,String add,List<File> file,List<String> href);
	/*
	 * 删除广告位
	 */
	public boolean dele_aa(String li_id);
}
