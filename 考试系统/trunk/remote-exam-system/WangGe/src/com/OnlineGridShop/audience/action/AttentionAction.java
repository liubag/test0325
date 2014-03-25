package com.OnlineGridShop.audience.action;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.OnlineGridShop.audience.Entity.Attention;
import com.OnlineGridShop.audience.Service.AttentionService;
import com.OnlineGridShop.util.PageUtil;
import com.opensymphony.xwork2.ActionContext;
@SuppressWarnings({"serial","unchecked"})
public class AttentionAction {
	@Resource
	private AttentionService attentionService;
	private Attention attention;
	private String audience_id;
	private String audience_name;
	private String obj_id;
	private int type;  //0:����  1����Ʒ
	private int subType; //0:Ʒ�Ƹ���orƷ����Ʒ  1��ɢ�����orɢ����Ʒ
	private Long unReadCount;
	private Long hasAttention; // ���ݵ�����
	private int page; // ��ǰҳ
	private int hasPages; // ҳ��
	private List<Integer> page_l;
	private Map<String, Object> session;
	private String current_audience;
	private List myAttention1_l;
	private List myAttention2_l;
	/**
	 * ��ӹ�ע
	 */
	public void addAttention(){
		try{			
			String flag=attentionService.add(audience_id, obj_id,type,subType);						
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			// ֱ��������Ӧ������
			out.print(flag);
			out.flush();
			out.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	/**
	 * ȡ����ע
	 */
	public void deletAttention(){
		try{			
			String flag=attentionService.delete(audience_id, obj_id);						
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			// ֱ��������Ӧ������
			out.print(flag);
			out.flush();
			out.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	/**
	 * ����δ����Ϣ����
	 * @return
	 */
//	public void findUnReadCount(){
//		this.unReadCount=attentionService.findUnreadCount(audience_name);
//		HttpServletRequest request = ServletActionContext.getRequest();
//		request.setAttribute("unReadCount", this.unReadCount);
//	}
//	
	/**
	 * �����ҹ�ע����Ʒ�����
	 */
	public String myAttention(){
		try{
				
				myAttention1_l=new ArrayList();
				myAttention2_l=new ArrayList();
//				int hasPage1,hasPage2;
				Long hasAttention1,hasAttention2;
				session = ActionContext.getContext().getSession();
				current_audience = (String) session.get("current_audience");
				
//				hasPage1=attentionService.findAllPages(current_audience, 0,type);
//				hasPage2=attentionService.findAllPages(current_audience, 0,type);
				hasAttention1= attentionService.findAllCount(current_audience,0, type);
				hasAttention2= attentionService.findAllCount(current_audience,1, type);
				
				if(hasAttention1>hasAttention2){
				
					this.hasPages=attentionService.findAllPages(current_audience, 0,type);
				}else{
					
					this.hasPages=attentionService.findAllPages(current_audience, 1,type);
				}
				this.hasAttention=hasAttention1+hasAttention2;
//				this.hasAttention = attentionService.findAllCount(current_audience, type); // ��ȡ��������
//				hasPages = attentionService.findAllPages(current_audience, type);// ��ȡҳ��
//				System.out.println(hasAttention+" "+hasPages);
				this.page_l = PageUtil.getPageList(hasPages); // ��ȡһ����1��hasPages������
				if (page <= 0) {
					page = 1;
				}
				if (hasPages == 0) {
					page = 0;
				} else {
					if (page <= 0) {
						page = 1;
					} else if (page > hasPages) {
						page = hasPages;
					}
					myAttention1_l=attentionService.showAttention_by_page(current_audience, type,0, page);
					myAttention2_l=attentionService.showAttention_by_page(current_audience, type,1, page);
				}
				// ��ȡ��ǰҳ������
				
		//		System.out.println(myAttention1_l.size()+" "+myAttention2_l.size());
				
				return "success";
		}catch(Exception e){
			e.printStackTrace();
			return "input";
		}
		
//		
	}
	public Attention getAttention() {
		return attention;
	}
	public void setAttention(Attention attention) {
		this.attention = attention;
	}
	public String getAudience_id() {
		return audience_id;
	}
	public void setAudience_id(String audience_id) {
		this.audience_id = audience_id;
	}
	public String getObj_id() {
		return obj_id;
	}
	public void setObj_id(String obj_id) {
		this.obj_id = obj_id;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}

	public String getAudience_name() {
		return audience_name;
	}

	public void setAudience_name(String audience_name) {
		this.audience_name = audience_name;
	}

	public Long getUnReadCount() {
		return unReadCount;
	}

	public void setUnReadCount(Long unReadCount) {
		this.unReadCount = unReadCount;
	}

	public int getSubType() {
		return subType;
	}

	public void setSubType(int subType) {
		this.subType = subType;
	}

	public Long getHasAttention() {
		return hasAttention;
	}

	public void setHasAttention(Long hasAttention) {
		this.hasAttention = hasAttention;
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

	public List<Integer> getPage_l() {
		return page_l;
	}

	public void setPage_l(List<Integer> page_l) {
		this.page_l = page_l;
	}

	public List getMyAttention1_l() {
		return myAttention1_l;
	}

	public void setMyAttention1_l(List myAttention1_l) {
		this.myAttention1_l = myAttention1_l;
	}

	public List getMyAttention2_l() {
		return myAttention2_l;
	}

	public void setMyAttention2_l(List myAttention2_l) {
		this.myAttention2_l = myAttention2_l;
	}


}
