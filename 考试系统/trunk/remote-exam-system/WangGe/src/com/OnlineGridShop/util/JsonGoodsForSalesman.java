package com.OnlineGridShop.util;

import java.util.List;

import com.OnlineGridShop.brand.Entity.BrandgridGoods;

public class JsonGoodsForSalesman {
	private String goodsid;
	private String goodspick;
	private String goodszk;
	private List<Integer> goodsmount;
	private String goodsname;
	private String goodspicstr;
	public JsonGoodsForSalesman(BrandgridGoods bgg){
		this.goodsid = bgg.getBrandgrid_goods_id();
		this.goodspick = Float.toString(bgg.getGoods_price());
		this.goodszk = Float.toString(bgg.getGoods_ZK());
		this.goodsmount = PageUtil.getPageList(bgg.getResidual_mount());
		this.goodsname = bgg.getGoods_name();
		this.goodspicstr = bgg.getBrandgrid().getBrandgrid_id() +"/" + bgg.getBrandgridGridOwner().getBrandgrid_gridowner_id() + "/" + bgg.getBrandgrid_goods_id() + "/" + bgg.getGoods_photoname1();
	}
	public JsonGoodsForSalesman(){
		
	}
	public String getGoodsid() {
		return goodsid;
	}
	public void setGoodsid(String goodsid) {
		this.goodsid = goodsid;
	}
	public String getGoodspick() {
		return goodspick;
	}
	public void setGoodspick(String goodspick) {
		this.goodspick = goodspick;
	}
	public String getGoodszk() {
		return goodszk;
	}
	public void setGoodszk(String goodszk) {
		this.goodszk = goodszk;
	}
	public List<Integer> getGoodsmount() {
		return goodsmount;
	}
	public void setGoodsmount(List<Integer> goodsmount) {
		this.goodsmount = goodsmount;
	}
	public String getGoodsname() {
		return goodsname;
	}
	public void setGoodsname(String goodsname) {
		this.goodsname = goodsname;
	}
	public String getGoodspicstr() {
		return goodspicstr;
	}
	public void setGoodspicstr(String goodspicstr) {
		this.goodspicstr = goodspicstr;
	}
	
}
