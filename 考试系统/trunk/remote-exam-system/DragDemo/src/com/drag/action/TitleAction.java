package com.drag.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.drag.entity.Title;
import com.drag.service.MoveDivsService;
import com.drag.service.TitleService;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class TitleAction extends ActionSupport{
	@Resource
	private TitleService titleService;
	@Resource MoveDivsService moveDivsService;
	private Title title;
	private String div_id;
	private String moveDivs_id;
	private String div_content;
	
	public void findTitle(){
		PrintWriter out=null;
		try {
			Title t=titleService.findTitle(title.getDiv_id(), title.getMoveDivs_id());	
			String str;
			if(t!=null){
				str ="<table style='margin:0'>";
				if(t.getFile()!=null){
					str +="<tr><td class='label'>File</td><td class='content'><span id='"+title.getDiv_id()+""+title.getMoveDivs_id()+"title_file' name='"+t.getFile()+"'>"+t.getFile()+"</span></td></tr>";
				}
				if(t.getVersion()!=null){
					str+="<tr><td class='label'>Version</td><td class='content'><span id='"+title.getDiv_id()+""+title.getMoveDivs_id()+"title_version' name='"+t.getVersion()+"'>"+t.getVersion()+"</span></td></tr>";
				}
				str+="</table>";
			}else{
				str="你还没有设置属性";
			}
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("UTF-8");
		    out = response.getWriter();
			// 直接输入响应的内容
			out.print(str);
			out.flush();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(out!=null){
				out.close();
			}
		}
	}
	public void deleTitleAndSaveMovedivs(){
		String flag ="fail";
		PrintWriter out=null;
		String moveDivs_id=title.getMoveDivs_id();
		String div_id=title.getDiv_id();
		try {
			if(titleService.dele(div_id, moveDivs_id)){
				if(moveDivsService.find(moveDivs_id)!=null){
					moveDivsService.update(moveDivs_id, div_content);
				}else{
					moveDivsService.save(div_content);
				}
				flag="success";
			}
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("UTF-8");
			out = response.getWriter();
			// 直接输入响应的内容
			out.print(flag);
			out.flush();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			if(out!=null){
				out.close();
			}
		}
	}
	public void updateTitle(){
		PrintWriter out=null;
		try {					
			title.setFile(new String(title.getFile().getBytes("ISO8859_1"),"utf-8"));
			title.setVersion(new String(title.getVersion().getBytes("ISO8859_1"),"utf-8"));
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("UTF-8");
			out = response.getWriter();
			if(titleService.updateTitle(title)){
				// 直接输入响应的内容
				out.print("success");
			}else{
				out.print("fail");
			}
			out.flush();
		} catch (Exception e) {
			e.printStackTrace();			
		}finally{
			if(out!=null){
				out.close();
			}
		}
	}
	public Title getTitle() {
		return title;
	}
	public void setTitle(Title title) {
		this.title=title;		
	}
	public void setDiv_id(String div_id) {
		this.div_id = div_id;
	}
	public String getDiv_id() {
		return div_id;
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

}
