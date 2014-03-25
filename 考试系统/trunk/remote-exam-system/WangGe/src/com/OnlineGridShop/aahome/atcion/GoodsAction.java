package com.OnlineGridShop.aahome.atcion;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import com.OnlineGridShop.aahome.serivce.AahomeSerivce;
import com.OnlineGridShop.brand.Entity.BrandgridGoods;
import com.OnlineGridShop.scattered.Entity.ScatteredGridGoods;
import com.OnlineGridShop.util.MyAppConfigs;
import com.OnlineGridShop.util.PageUtil;
import com.opensymphony.xwork2.ActionSupport;
@SuppressWarnings({ "unchecked", "serial" })
public class GoodsAction extends ActionSupport{
	@Resource
	private AahomeSerivce aahomeSerivce;

	private List<BrandgridGoods> brandGoods_l;
	private List<ScatteredGridGoods> scatteredGoods_l;
	
	private Integer type_id;  //商品分类的id
	private String show_type;  //排序类型  LZ_time（置顶排序）,upload_time（上架排序）,money_up（价钱升序）,money_down（价钱降序）,hot（浏览量）
	private String filter_type;  //这个区分进入品牌市场    或     学生市场   或    首页  业务需要的，过滤要求  all_type（包括品牌市场、学生市场）,brand（品牌网格市场）,scattered（学生网格市场）
	
	private int page;
	private int hasPages;
	private int perFolioAmount;
	private Long has;
	private Long branghas;
	private Long scatteredhas;
	private List<Integer> page_l;
	
	
	
	public String showAllGoods_aa(){
		try{
			int perFolioAmount = Integer.parseInt(MyAppConfigs.appConfigs.get(filter_type));
			brandGoods_l = new ArrayList<BrandgridGoods>();
			scatteredGoods_l = new ArrayList<ScatteredGridGoods>();
			List<Long> has_l = aahomeSerivce.hasGoods(type_id, filter_type);
			if(filter_type.equals("brand")){
				branghas = has_l.get(0);
				this.has = branghas;
			}else if(filter_type.equals("scattered")){
				scatteredhas = has_l.get(0);
				this.has = scatteredhas;
			}else{
				branghas = has_l.get(0);
				scatteredhas = has_l.get(1);
				this.has = branghas + scatteredhas;
			}
			hasPages = PageUtil.findAllPages(perFolioAmount, has);
			//获取可以跳转的页数
			this.page_l = new ArrayList<Integer>();
			this.page_l = PageUtil.getPageList(hasPages);
			if(page <= 0){
				page = 1;
			}
			if(hasPages == 0){
				page = 0;
			}else{
				if(page <= 0){
					page = 1;
				}else if(page > hasPages){
					page = hasPages;
				}
				List<?> goods_l = aahomeSerivce.showGoods_by_page(type_id,page,perFolioAmount,filter_type,show_type);
				if(filter_type.equals("brand")){
					brandGoods_l = (List<BrandgridGoods>) goods_l.get(0);
				}else if(filter_type.equals("scattered")){
					scatteredGoods_l = (List<ScatteredGridGoods>) goods_l.get(0);
				}else{
					brandGoods_l = (List<BrandgridGoods>) goods_l.get(0);
					scatteredGoods_l = (List<ScatteredGridGoods>) goods_l.get(1);
				}
			}
			if(filter_type.equals("brand")){
				return "brand";
			}else if(filter_type.equals("scattered")){
				return "scattered";
			}else if(filter_type.equals("all_type")){
				return "success";
			}else{
				return "input";
			}
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "input";
		}
	}
	
	//获取该格子的商品
	public String showAllGoods_byGrid_aa(){
		try{
			
			return "success";
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "input";
		}
	}
	
	public List<BrandgridGoods> getBrandGoods_l() {
		return brandGoods_l;
	}
	public void setBrandGoods_l(List<BrandgridGoods> brandGoodsL) {
		brandGoods_l = brandGoodsL;
	}
	
	public List<ScatteredGridGoods> getScatteredGoods_l() {
		return scatteredGoods_l;
	}

	public void setScatteredGoods_l(List<ScatteredGridGoods> scatteredGoodsL) {
		scatteredGoods_l = scatteredGoodsL;
	}

	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getHasPages() {
		return hasPages;
	}
	public void setHasPages(int hasPages) {
		this.hasPages = hasPages;
	}
	public int getPerFolioAmount() {
		return perFolioAmount;
	}
	public void setPerFolioAmount(int perFolioAmount) {
		this.perFolioAmount = perFolioAmount;
	}
	public Long getHas() {
		return has;
	}
	public void setHas(Long has) {
		this.has = has;
	}
	
	public Long getBranghas() {
		return branghas;
	}

	public void setBranghas(Long branghas) {
		this.branghas = branghas;
	}

	public Long getScatteredhas() {
		return scatteredhas;
	}

	public void setScatteredhas(Long scatteredhas) {
		this.scatteredhas = scatteredhas;
	}

	public List<Integer> getPage_l() {
		return page_l;
	}
	public void setPage_l(List<Integer> pageL) {
		page_l = pageL;
	}

	public Integer getType_id() {
		return type_id;
	}

	public void setType_id(Integer typeId) {
		type_id = typeId;
	}

	public String getShow_type() {
		return show_type;
	}

	public void setShow_type(String showType) {
		show_type = showType;
	}

	public String getFilter_type() {
		return filter_type;
	}

	public void setFilter_type(String filterType) {
		filter_type = filterType;
	}
	
	
	
}
