package com.OnlineGridShop.aahome.atcion;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import com.OnlineGridShop.aahome.serivce.AahomeSerivce;
import com.OnlineGridShop.brand.Entity.Brandgrid;
import com.OnlineGridShop.brand.Entity.BrandgridGrid;
import com.OnlineGridShop.scattered.Entity.ScatteredGrid;
import com.OnlineGridShop.util.MyAppConfigs;
import com.OnlineGridShop.util.PageUtil;
import com.opensymphony.xwork2.ActionSupport;
@SuppressWarnings({ "unchecked", "serial" })
public class GridAction extends ActionSupport{
	@Resource
	private AahomeSerivce aahomeSerivce;

	private List<Brandgrid> brandGrid_l;
	private List<ScatteredGrid> scatteredGrid_l;
	
	private Brandgrid brandgrid;
	private List<BrandgridGrid> brangridGrid_l;
	
	private String brandgrid_id;
	
	private String filter_type;  //过滤要求 brand,scattered
	
	private int page;
	private int hasPages;
	private int perFolioAmount;
	private Long has;
	private List<Integer> page_l;
	
	
	
	public String showAllGrid_aa(){
		try{
			int perFolioAmount = Integer.parseInt(MyAppConfigs.appConfigs.get(filter_type+"_grid"));  
			brandGrid_l = new ArrayList<Brandgrid>();
			scatteredGrid_l = new ArrayList<ScatteredGrid>();
			has = aahomeSerivce.showAllGrid_aa (filter_type);
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
				if(filter_type.equals("brand")){
					brandGrid_l = (List<Brandgrid>) aahomeSerivce.showGoods_by_page(page,perFolioAmount,filter_type);
				}else if(filter_type.equals("scattered")){
					scatteredGrid_l = (List<ScatteredGrid>) aahomeSerivce.showGoods_by_page(page,perFolioAmount,filter_type);
				}
			}
			if(filter_type.equals("brand")){
				return "brand";
			}else if(filter_type.equals("scattered")){
				return "scattered";
			}else {
				return "input";
			}
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "input";
		}
	}
	
	
	public String showAllBgGrid_aa(){
		try{
			int perFolioAmount = Integer.parseInt(MyAppConfigs.appConfigs.get("brandgrid_grid"));
			brangridGrid_l = new ArrayList<BrandgridGrid>();
			has = aahomeSerivce.showAllBgGrid_aa (brandgrid_id);
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
				List l_l = aahomeSerivce.showBgGrid_by_page(page,perFolioAmount,brandgrid_id);
				if(l_l.size() != 2){
					return "input";
				}
				brandgrid = (Brandgrid) l_l.get(0);
				brangridGrid_l = (List<BrandgridGrid>) l_l.get(1);
			}
			return "success";
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "input";
		}
	}
	
	public List<Brandgrid> getBrandGrid_l() {
		return brandGrid_l;
	}


	public void setBrandGrid_l(List<Brandgrid> brandGridL) {
		brandGrid_l = brandGridL;
	}



	public List<ScatteredGrid> getScatteredGrid_l() {
		return scatteredGrid_l;
	}


	public void setScatteredGrid_l(List<ScatteredGrid> scatteredGridL) {
		scatteredGrid_l = scatteredGridL;
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


	public String getFilter_type() {
		return filter_type;
	}


	public void setFilter_type(String filterType) {
		filter_type = filterType;
	}


	public List<Integer> getPage_l() {
		return page_l;
	}


	public void setPage_l(List<Integer> pageL) {
		page_l = pageL;
	}


	public List<BrandgridGrid> getBrangridGrid_l() {
		return brangridGrid_l;
	}


	public void setBrangridGrid_l(List<BrandgridGrid> brangridGridL) {
		brangridGrid_l = brangridGridL;
	}


	public String getBrandgrid_id() {
		return brandgrid_id;
	}


	public void setBrandgrid_id(String brandgridId) {
		brandgrid_id = brandgridId;
	}


	public Brandgrid getBrandgrid() {
		return brandgrid;
	}


	public void setBrandgrid(Brandgrid brandgrid) {
		this.brandgrid = brandgrid;
	}
	
	
	
	
}
