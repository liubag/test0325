package com.drag.action;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.apache.struts2.ServletActionContext;

import com.drag.entity.MoveDivs;
import com.drag.entity.Title;
import com.drag.service.MoveDivsService;
import com.drag.service.TitleService;
import com.drag.util.StringUtil;

public class MoveDivsAction {
	@Resource
	private MoveDivsService moveDivsService;
	@Resource 
	private TitleService titleService;
	private MoveDivs div;
	private String jsonTitles;
	private String moveDivs_id;
	private String div_content;
	private String deleDivs;//需要删除的div的id的集合，以逗号隔开
	
	/**
	 * 更新/新增 地图
	 */
	public void saveOrUpdateMoveDivs(){
		String flag="success";
		try {
			if(moveDivs_id==null){
				div_content=div_content.replaceAll("'", "&#039;");
				moveDivsService.save(div_content);
				MoveDivs md =moveDivsService.findByDivContent(div_content);
				moveDivs_id=md.getMoveDivs_id();
			}else if(moveDivs_id!=null && moveDivsService.find(moveDivs_id)==null){
				div_content=div_content.replaceAll("'", "&#039;");
				moveDivsService.save(moveDivs_id, div_content);
			}else{
				moveDivsService.update(moveDivs_id, div_content);
			}
			if(!StringUtil.isEmpty(deleDivs)){
				List<String> div_id_l=StringUtil.getOption(deleDivs, ",");
				for(String div_id:div_id_l){
					titleService.dele(div_id, moveDivs_id);
				}
			}
			if(!jsonTitles.equals("[]") && jsonTitles!=null && jsonTitles!=""){
				JSONArray ja =JSONArray.fromObject(jsonTitles);			
				Title[] titles=(Title[])JSONArray.toArray(ja, Title.class);
				for(Title title:titles){
					title.setMoveDivs_id(moveDivs_id);
					if(title.getTitle_id()!=null){
						titleService.updateTitle(title);
					}else{
						titleService.save(title);
					}
				}
			}
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("UTF-8");
			PrintWriter out=null;
			out = response.getWriter();
			// 直接输入响应的内容
			out.print(flag);
			out.flush();
			out.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			flag="fail";
		}
		
		
	}
	
	/**
	 * 通过地图id获取地图，显示到页面中
	 */
	public void getMoveDivsById(){
		
		if(moveDivs_id!=null){
			PrintWriter out=null;
			MoveDivs md= moveDivsService.find(moveDivs_id);
			try {
				HttpServletResponse response = ServletActionContext.getResponse();
				response.setCharacterEncoding("UTF-8");
				out = response.getWriter();
				if(md!=null){
					//如果有地图信息，返回
					div_content =md.getDiv_content();
					out.print(div_content);
				}else{
					//如果没有地图信息，返回empty
					out.print("empty");
				}
				out.flush();
				out.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				if(out!=null){
					out.close();
				}
			}
		}
	}
	public MoveDivs getDiv() {
		return div;
	}

	public void setDiv(MoveDivs div) {
		this.div = div;
	}

	public void setJsonTitles(String jsonTitles) {
		this.jsonTitles = jsonTitles;
	}

	public String getJsonTitles() {
		return jsonTitles;
	}

	public void setMoveDivs_id(String moveDivs_id) {
		this.moveDivs_id = moveDivs_id;
	}

	public String getMoveDivs_id() {
		return moveDivs_id;
	}

	public void setDiv_content(String div_content) {
		this.div_content = div_content;
	}

	public String getDiv_content() {
		return div_content;
	}

	public void setDeleDivs(String deleDivs) {
		this.deleDivs = deleDivs;
	}

	public String getDeleDivs() {
		return deleDivs;
	}
	

	
}
