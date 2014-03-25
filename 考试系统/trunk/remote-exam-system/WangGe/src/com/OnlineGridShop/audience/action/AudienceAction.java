package com.OnlineGridShop.audience.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.OnlineGridShop.audience.Entity.Audience;
import com.OnlineGridShop.audience.Service.AudienceSerivce;
import com.OnlineGridShop.util.MyStringAppConfigs;
import com.OnlineGridShop.util.PageUtil;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@SuppressWarnings({ "serial", "rawtypes" } )
public class AudienceAction extends ActionSupport implements ModelDriven{
	@Resource
	private AudienceSerivce audienceSerivce;
	
	private Audience audience;
	private String oldPw;
	private String newPw;
	private String audience_nickname;
	private String audience_pw;
	private int page;
	private List<Integer> page_l;
	private int hasPages;
	private long hasAudiences;
	private int perFolioAmount;
	private List<Audience> audience_l;
	private String tip;
	private int point;
	private Map<String,Object> session;
	private MyStringAppConfigs myStringAppConfigs;  //字符串资源
	
	
	/*
	 * 
	 * 1：成功 ；0 ：密码错误；-1：用户不存在
	 */
	public String login(){
		String flag = "";
		int result = audienceSerivce.login(audience.getAudience_nickname(), audience.getAudience_pw());
		switch(result){
		case 1 :
			flag = "login_success";
			session=ActionContext.getContext().getSession();
			session.put("current_audience", audience.getAudience_nickname());
			myStringAppConfigs = MyStringAppConfigs.login_success;
			break;
		case 0 :
			flag = "pw_error";
			this.audience_nickname =audience.getAudience_nickname();
			myStringAppConfigs = MyStringAppConfigs.pw_error;
			break;
		case -1 :
			flag = "user_null";
			this.audience_nickname =audience.getAudience_nickname();
			myStringAppConfigs = MyStringAppConfigs.user_null;
			break;
		case 2 :
			flag = "user_cancel";
			this.audience_nickname =audience.getAudience_nickname();
			myStringAppConfigs = MyStringAppConfigs.user_cancel;
			break;
		}
		this.tip = myStringAppConfigs.getValue();
		
		return flag;
	}
	
	/**
	 * 安全退出
	 * @return
	 */
	public String logout(){
		session=ActionContext.getContext().getSession();
		session.remove("current_audience");
		this.audience_nickname=null;
		return "success";
	}
	/**
	 * 新增网格会员
	 * @return
	 */
	public String addAudience(){
		String flag ="fail";
		if(this.audience!=null){
			if(audienceSerivce.save(audience)){
				flag="success";
				myStringAppConfigs = MyStringAppConfigs.add_audience_success;
			}else{
				myStringAppConfigs = MyStringAppConfigs.add_audience_fail;
			}
		}
		this.tip =myStringAppConfigs.getValue();
		return flag;
	}
	/**
	 * 验证昵称（账户）是否可用
	 */
	public void checkNickname(){
		String flag ="fail";
		PrintWriter out=null;
		try {
			String audience_nickname=new String(audience.getAudience_nickname().getBytes("ISO8859-1"),"UTF-8");
			if(audienceSerivce.find_nickname(audience_nickname)==null){
				flag="success";
			}
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("UTF-8");
			 out = response.getWriter();
			// 直接输入响应的内容
			out.print(flag);
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
		
	public void checkAudienceIdcard(){
		String flag ="fail";
		PrintWriter out=null;
		try {
			String audience_idcard=new String(audience.getAudience_idcard().getBytes("ISO8859-1"),"UTF-8");
			if(audienceSerivce.find_idcard(audience_idcard)==null){
				flag="success";
			}
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("UTF-8");
			 out = response.getWriter();
			// 直接输入响应的内容
			out.print(flag);
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
	
	public void checkAudienceIdcardTwo(){
		String flag ="fail";
		PrintWriter out=null;
		System.out.println(audience.getAudience_idcard());
		try {
			Audience aud=audienceSerivce.find_idcard(audience.getAudience_idcard());
			if(aud==null || aud.getId().equals(audience.getId())){
				flag="success";
			}else {
				flag="fail";
			}
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("UTF-8");
			 out = response.getWriter();
			// 直接输入响应的内容
			out.print(flag);
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
	public void audienceCancel(){
		String flag="fail";
		PrintWriter out=null;
		try {
			if(audienceSerivce.AudienceCancel(audience.getId())){
				flag="success";
			}
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("UTF-8");
			 out = response.getWriter();
			// 直接输入响应的内容
			out.print(flag);
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
	
	public void audienceActive(){
		String flag="fail";
		PrintWriter out=null;
		try {
			if(audienceSerivce.AudienceActive(audience.getId())){
				flag="success";
			}
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("UTF-8");
			 out = response.getWriter();
			// 直接输入响应的内容
			out.print(flag);
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
	
	
	public String update_exceptPw(){
		String flag="";
		if(audienceSerivce.update_exceptPw(audience)){
			myStringAppConfigs = MyStringAppConfigs.update_audiencec_info_success;
			flag= "success";
		}else{
			myStringAppConfigs = MyStringAppConfigs.update_audiencec_info_fail;
			flag= "fail";
		}
		this.tip=myStringAppConfigs.getValue();
		return flag;
	}
	
	public String updatePw(){
		String flag = "";
		if(audienceSerivce.updataPw(audience.getAudience_nickname(), oldPw, newPw)){
			flag = "success";
			myStringAppConfigs = MyStringAppConfigs.updataPw_success;
		}else{
			myStringAppConfigs = MyStringAppConfigs.updataPw_fail;
			flag = "fail";
		}
		this.tip = myStringAppConfigs.getValue();
		return flag;
	}
	
	public String updateIdcard(){
		String flag="";
		if(audience.getAudience_nickname()!=null){
			audienceSerivce.updateIdcardAndTruename(audience);
			flag="success";
		}else{
			myStringAppConfigs=MyStringAppConfigs.update_audiencec_info_fail;
			this.tip=myStringAppConfigs.getValue();
			flag="fail";
		}
		return flag;
	}
	//显示当前用户的信息
	public String showAudienceInfo(){
		String flag="";
		String current_audience_nickname=null;
		session=ActionContext.getContext().getSession();
		current_audience_nickname=(String)session.get("current_audience");
		if(current_audience_nickname!=null){
			audience =audienceSerivce.find_nickname(current_audience_nickname);
			flag="success";
		}else{
			flag="fail";
			myStringAppConfigs=MyStringAppConfigs.show_audience_info_fail;
			this.tip=myStringAppConfigs.getValue();
		}
		
		return flag;
	}
	
	public String showAudienceInfoById(){
		String flag="";
		if(audience.getId()!=null){
			audience=audienceSerivce.find(audience.getId());
			flag="success";
		}else{
			myStringAppConfigs=MyStringAppConfigs.show_audience_info_fail;
			tip=myStringAppConfigs.getValue();
			flag="fail";
		}
		
		return flag;
	}
	public String findPoint(){
		point = audienceSerivce.findPoints(audience.getAudience_nickname());
		return "sucess";
	}
	
	//只需要传递 page值
	public String showAudience_by_page(){
		hasPages = audienceSerivce.findAllAudiencePages();
		if(hasPages == 0){
			page = 0;
		}else{
			if(page <= 0){
				page = 1;
			}else if(page > hasPages){
				page = hasPages;
			}
		}
		this.page_l=PageUtil.getPageList(hasPages);
		this.hasAudiences=audienceSerivce.findAllAudienceCount();
		this.audience_l = audienceSerivce.showAudience_by_page(page);
		return "success";
	}
	
	public Object getModel() {
		// TODO Auto-generated method stub
		return audience;
	}

	public AudienceSerivce getAudienceSerivce() {
		return audienceSerivce;
	}

	public void setAudienceSerivce(AudienceSerivce audienceSerivce) {
		this.audienceSerivce = audienceSerivce;
	}

	public Audience getAudience() {
		return audience;
	}

	public void setAudience(Audience audience) {
		this.audience = audience;
	}

	public String getOldPw() {
		return oldPw;
	}

	public void setOldPw(String oldPw) {
		this.oldPw = oldPw;
	}

	public String getNewPw() {
		return newPw;
	}

	public void setNewPw(String newPw) {
		this.newPw = newPw;
	}


	public String getAudience_pw() {
		return audience_pw;
	}

	public void setAudience_pw(String audiencePw) {
		audience_pw = audiencePw;
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

	public List<Audience> getAudience_l() {
		return audience_l;
	}

	public void setAudience_l(List<Audience> audienceL) {
		audience_l = audienceL;
	}

	public String getTip() {
		return tip;
	}

	public void setTip(String tip) {
		this.tip = tip;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public int getPerFolioAmount() {
		return perFolioAmount;
	}

	public void setPerFolioAmount(int perFolioAmount) {
		this.perFolioAmount = perFolioAmount;
	}

	public void setHasAudiences(long hasAudiences) {
		this.hasAudiences = hasAudiences;
	}

	public long getHasAudiences() {
		return hasAudiences;
	}

	public void setPage_l(List<Integer> page_l) {
		this.page_l = page_l;
	}

	public List<Integer> getPage_l() {
		return page_l;
	}
	public void setSession(Map<String,Object> session) {
		this.session = session;
	}
	public Map<String,Object> getSession() {
		return session;
	}
	public void setAudience_nickname(String audience_nickname) {
		this.audience_nickname = audience_nickname;
	}
	public String getAudience_nickname() {
		return audience_nickname;
	}
	
}
