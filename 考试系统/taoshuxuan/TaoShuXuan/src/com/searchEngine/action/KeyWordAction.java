package com.searchEngine.action;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.searchEngine.entity.KeyWord;
import com.searchEngine.service.KeyWordService;
import com.searchEngine.util.PageUtil;
import com.searchEngine.util.XmlAndHqlString;

@SuppressWarnings("serial")
public class KeyWordAction extends ActionSupport{
	@Resource
	private KeyWordService keyWordService;
	private String keyWord;
	private String keyword_show;
	private String otherOrderBy;  //������ǰ̨�ͻ�����Actionʱ��Ϊ��ǰ���������
	private List<KeyWord> keyWord_l;
	private String keyword_id;
	private List<?> goods_l;
	private List<?> goods_l2;
	private int rowName;
	private int page;
	private int hasPages;
	private Long has;
	private List<Integer> page_l;
	
	//���ҹؼ����б�
	public void findKeyWord_By_Rate() {
		try {
			keyWord = keyWord.replaceAll("\\s{1,}", " ").trim();			 		    
			keyWord_l=keyWordService.findKeyWord_By_Rate(keyWord);
			JSONArray  jsonObject = JSONArray.fromObject(keyWord_l); 			
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			// ֱ��������Ӧ������
			out.print(jsonObject.toString());
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	//��ҳ��ʾkeyword
	public String showKeyWord_by_page(){
		try {
			this.has = this.keyWordService.findKeyWordCount();
			hasPages = PageUtil.findAllPages(XmlAndHqlString.showperFolioAmount, has);
			//��ȡ������ת��ҳ��
			this.page_l = new ArrayList<Integer>();
			this.page_l = PageUtil.getPageList(hasPages);
			if(page <= 0){
				page = 1;
			}
			if(hasPages == 0){
				page = 0;
				//��Ҫ��ӳ��												
				keyWord_l = new ArrayList<KeyWord>();
			}else{
				if(page <= 0){
					page = 1;
				}else if(page > hasPages){
					page = hasPages;
				}
				keyWord_l = keyWordService.showKeyWord_by_page(page, XmlAndHqlString.showperFolioAmount);
			}			
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return INPUT;
		}
	}
	
	//ɾ��
	public String deleKeyWord(){
		try{
			if(this.keyWordService.deleKeyWord(keyword_id)){
				return "success";
			}else{
				return "fail";
			}
			
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "input";
		}
	}
	
	//ȷ����ѯ
	public String gainGoods_by_keyWord(){
		try {
			String test = keyWord.replaceAll("\\s{1,}", " ").trim();
			System.out.println(test);
			if(test.equals("")||test.equals(" ")){
				return "fail";
			}
			System.out.println(rowName);
			keyWordService.gainGoods_by_keyWord(test,rowName);			
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return INPUT;
		}
	}
	
	public void findFridKeyWord(){	
		keyWord = this.keyWordService.findFridKeyWord();
		ServletActionContext.getRequest().setAttribute("keyWord", keyWord);
	}
	
	//��ת��ҳҳ��    otherOrderBy  ֱ����ǰ̨��������//��������  LZ_time���ö�����,upload_time���ϼ�����,money_up����Ǯ����,money_down����Ǯ����,hot���������
	@SuppressWarnings("unchecked")
	public String showAll(){
		try {
			keyword_show=keyWord;
			goods_l = null;
			goods_l2 = null;
			String test = keyWord.replaceAll("\\s{1,}", " ").trim();
			if(test.length()==0){
				test = this.keyWordService.findFridKeyWord();
			}
			this.has = this.keyWordService.findCount(test,rowName);
			hasPages = PageUtil.findAllPages(XmlAndHqlString.perFolioAmount, has);
			//��ȡ������ת��ҳ��
			this.page_l = new ArrayList<Integer>();
			this.page_l = PageUtil.getPageList(hasPages);
			if(page <= 0){
				page = 1;
			}
			if(hasPages == 0){
				page = 0;
				//��Ҫ��ӳ��												
				this.goods_l = new ArrayList();
			}else{
				if(page <= 0){
					page = 1;
				}else if(page > hasPages){
					page = hasPages;
				}
				List<List<?>> l = keyWordService.showAll(test,page, XmlAndHqlString.perFolioAmount,otherOrderBy,rowName);
				if(l != null){
					goods_l=l.get(0);
				}
				
			}
			
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return INPUT;
		}
		
	}
	

	public String getKeyWord() {
		return keyWord;
	}	
	public void setKeyWord(String keyWord) {
		try {
			this.keyWord = new String(keyWord.getBytes("ISO8859_1"),"utf-8");			
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public List<KeyWord> getKeyWord_l() {
		return keyWord_l;
	}

	public void setKeyWord_l(List<KeyWord> keyWord_l) {
		this.keyWord_l = keyWord_l;
	}


	public List<?> getGoods_l() {
		return goods_l;
	}


	public void setGoods_l(List<?> goods_l) {
		this.goods_l = goods_l;
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



	public Long getHas() {
		return has;
	}


	public void setHas(Long has) {
		this.has = has;
	}


	public List<Integer> getPage_l() {
		return page_l;
	}


	public void setPage_l(List<Integer> pageL) {
		page_l = pageL;
	}


	public List<?> getGoods_l2() {
		return goods_l2;
	}


	public void setGoods_l2(List<?> goodsL2) {
		goods_l2 = goodsL2;
	}


	public String getOtherOrderBy() {
		return otherOrderBy;
	}


	public void setOtherOrderBy(String otherOrderBy) {
		this.otherOrderBy = otherOrderBy;
	}


	public String getKeyword_id() {
		return keyword_id;
	}


	public void setKeyword_id(String keywordId) {
		keyword_id = keywordId;
	}


	public void setRowName(int rowName) {
		this.rowName = rowName;
	}


	public int getRowName() {
		return rowName;
	}


	public void setKeyword_show(String keyword_show) {
		this.keyword_show = keyword_show;
	}


	public String getKeyword_show() {
		return keyword_show;
	}

	


}
