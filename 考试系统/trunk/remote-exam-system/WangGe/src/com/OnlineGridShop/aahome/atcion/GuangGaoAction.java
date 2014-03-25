package com.OnlineGridShop.aahome.atcion;

import java.io.File;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.OnlineGridShop.aahome.serivce.AahomeSerivce;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
@SuppressWarnings({"unchecked", "serial" })
public class GuangGaoAction extends ActionSupport{
	@Resource
	private AahomeSerivce aahomeSerivce;
	
	private String show_str;
	
	private String mytime;  //li_id
	private String add_type;  //目前分为：add(往下插入)，add_up（往上插入）
	private String li_id;   //参考物
	private String add;  //目前分为：1,2,3
	
	
	private List<File> file;
	private List<String> fileFileName;
	private List<String> fileContentType;
	
	private List<String> href;

	public String addGuangGao_aa(){
		try{
			Map m;
			m = ActionContext.getContext().getSession();
			String admin_loginstatu = (String) m.get("admin_loginstatu");
			if(admin_loginstatu == null){
				return "login";
			}
			if(this.aahomeSerivce.addGuangGao_aa(mytime,add_type,li_id,add,file,href)){
				return "success";
			}else{
				return "fail";
			}
		}catch (Exception e) {
			// TODO: handle exception
			return "input";
		}
	}
	
	public void deleGuangGao_aa(){
		try{
			Map m;
			String flag = "";
			m = ActionContext.getContext().getSession();
			String admin_loginstatu = (String) m.get("admin_loginstatu");
			if(admin_loginstatu == null){
				flag = "login";
			}else{
				if(this.aahomeSerivce.dele_aa(li_id)){
					flag = "success";
				}else{
					flag = "fail";
				}
			}
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			// 直接输入响应的内容
			out.print(flag);
			out.flush();
			out.close();
		}catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	public void showGuangGaoToUpdata_aa(){
		try{
			show_str = aahomeSerivce.showToUpdata_aa();
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			// 直接输入响应的内容
			out.print(show_str);
			out.flush();
			out.close();
		}catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	public String getMytime() {
		return mytime;
	}
	public void setMytime(String mytime) {
		this.mytime = mytime;
	}
	public String getAdd_type() {
		return add_type;
	}
	public void setAdd_type(String addType) {
		add_type = addType;
	}
	public String getLi_id() {
		return li_id;
	}
	public void setLi_id(String liId) {
		li_id = liId;
	}

	public String getShow_str() {
		return show_str;
	}

	public void setShow_str(String showStr) {
		show_str = showStr;
	}

	public List<File> getFile() {
		return file;
	}

	public void setFile(List<File> file) {
		this.file = file;
	}

	public List<String> getFileFileName() {
		return fileFileName;
	}

	public void setFileFileName(List<String> fileFileName) {
		this.fileFileName = fileFileName;
	}

	public List<String> getFileContentType() {
		return fileContentType;
	}

	public void setFileContentType(List<String> fileContentType) {
		this.fileContentType = fileContentType;
	}

	public List<String> getHref() {
		return href;
	}

	public void setHref(List<String> href) {
		this.href = href;
	}

	public String getAdd() {
		return add;
	}

	public void setAdd(String add) {
		this.add = add;
	}
	
	
	
}
