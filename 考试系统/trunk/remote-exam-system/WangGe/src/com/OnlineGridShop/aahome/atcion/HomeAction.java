package com.OnlineGridShop.aahome.atcion;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.apache.struts2.ServletActionContext;

import com.OnlineGridShop.aahome.serivce.AahomeSerivce;
import com.OnlineGridShop.brand.Entity.BrandgridGoods;
import com.OnlineGridShop.brand.Entity.BrandgridPreferential;
import com.OnlineGridShop.scattered.Entity.ScatteredGridGoods;
import com.OnlineGridShop.scattered.Entity.ScatteredGridPreferential;
import com.opensymphony.xwork2.ActionSupport;
@SuppressWarnings({ "unchecked", "serial" })
public class HomeAction extends ActionSupport{
	@Resource
	private AahomeSerivce aahomeSerivce;

	private List<BrandgridGoods> brandGoods_l;
	private List<ScatteredGridGoods> scatteredGoods_l;
	
	private List<BrandgridPreferential> brandP_l;
	private List<ScatteredGridPreferential> scatteredP_l;
	
	private String tip;
	
	
	public void showHome_aa(){
		try{
			Map<String,List> map = this.aahomeSerivce.showHome_aa();
			JSONArray  jsonObject = JSONArray.fromObject(map); 			
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			// 直接输入响应的内容
			out.print(jsonObject.toString());
			out.flush();
			out.close();
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
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



	public List<BrandgridPreferential> getBrandP_l() {
		return brandP_l;
	}



	public void setBrandP_l(List<BrandgridPreferential> brandPL) {
		brandP_l = brandPL;
	}



	public List<ScatteredGridPreferential> getScatteredP_l() {
		return scatteredP_l;
	}



	public void setScatteredP_l(List<ScatteredGridPreferential> scatteredPL) {
		scatteredP_l = scatteredPL;
	}



	public String getTip() {
		return tip;
	}



	public void setTip(String tip) {
		this.tip = tip;
	}
	
	
}
