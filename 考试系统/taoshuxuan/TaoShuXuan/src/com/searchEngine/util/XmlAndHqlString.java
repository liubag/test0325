package com.searchEngine.util;

import java.util.List;

public class XmlAndHqlString {
	public static String entityName = null;
	public static String rowName = null;
	public static String rowName2 = null;
	public static String rowName3 = null;
	public static String orderBy = null;
	public static String otherWhere = null;
	public static String entityName2 = null;
	
	public static String orderBy2 = null;
	public static String otherWhere2 = null;
	public static int perFolioAmount = 0;
	public static int updataKeyWordDays = 0;
	public static String startTime = null;
	public static int keyWords_max = 0;
	public static int showperFolioAmount = 0;
	
	//配置文件xml中获取
	public static void initString(){
		Read.readXml();
		entityName = Read.xmlValue_map.get("entityName");
		rowName = Read.xmlValue_map.get("rowName");
		rowName2 = Read.xmlValue_map.get("rowName2");
		rowName3 = Read.xmlValue_map.get("rowName3");
		orderBy = Read.xmlValue_map.get("orderBy");
		otherWhere = Read.xmlValue_map.get("otherWhere");
		entityName2 = Read.xmlValue_map.get("entityName2");
		
		orderBy2 = Read.xmlValue_map.get("orderBy2");
		otherWhere2 = Read.xmlValue_map.get("otherWhere2");
		perFolioAmount = Integer.parseInt(Read.xmlValue_map.get("perFolioAmount"));
		updataKeyWordDays = Integer.parseInt(Read.xmlValue_map.get("updataKeyWordDays"));;
		startTime = Read.xmlValue_map.get("startTime");
		keyWords_max = Integer.parseInt(Read.xmlValue_map.get("keyWords_max"));
		showperFolioAmount = Integer.parseInt(Read.xmlValue_map.get("showperFolioAmount"));
	}
	
	
	/*
	 * 以下为生成HQL方法
	 * 	
	 */
	
	//查询entityName ,宝贝数量HQL
	public static String getEntityNameCount_hql(String keyword_content,int rowName){
		String rowNameTemp=XmlAndHqlString.rowName;
		int rowName_num=rowName;
		switch (rowName_num) {
		case 1:rowNameTemp=XmlAndHqlString.rowName;
			break;
		case 2:rowNameTemp=XmlAndHqlString.rowName2;
			break;
		case 3:rowNameTemp=XmlAndHqlString.rowName3;
			break;
		default:
			break;
		}
		List<String> keyWord_l=StringUtil.getOption(keyword_content, " ");
		String hql = "select count(*) from "+XmlAndHqlString.entityName+" as e where e."+rowNameTemp+" like '%"+keyWord_l.get(0)+"%'";
		for(int i=1;i<keyWord_l.size();i++){
			hql+="and e."+rowNameTemp+" like '%"+keyWord_l.get(i)+"%'";
		}
		if(XmlAndHqlString.otherWhere != null && XmlAndHqlString.otherWhere.length()>0){
			hql = hql + " and e." + XmlAndHqlString.otherWhere;
		}
		return hql;
	}
	//查询entityName ,宝贝集合HQL 
	public static String getKeyWord_l_hql(String keyword_content,String otherOrderBy,int rowName){
		List<String> keyWord_l=StringUtil.getOption(keyword_content, " ");
		String rowNameTemp=XmlAndHqlString.rowName;
		switch (rowName) {
		case 1:rowNameTemp=XmlAndHqlString.rowName;
			break;
		case 2:rowNameTemp=XmlAndHqlString.rowName2;
			break;
		case 3:rowNameTemp=XmlAndHqlString.rowName3;
			break;
		default:
			break;
		}
		String hql = "from "+XmlAndHqlString.entityName+" as e where e."+rowNameTemp+" like '%"+keyWord_l.get(0)+"%'";
		for(int i=1;i<keyWord_l.size();i++){
			hql+="and e."+rowNameTemp+" like '%"+keyWord_l.get(i)+"%'";
		}
		
		if(XmlAndHqlString.otherWhere != null && XmlAndHqlString.otherWhere.length()>0){
			hql = hql + " and e." + XmlAndHqlString.otherWhere;
		}
		if(otherOrderBy != null && otherOrderBy.length() > 0){
			hql = hql + " order by e." + otherOrderBy;
		}else{
			hql = hql + " order by e." + XmlAndHqlString.orderBy;
		}
		return hql;
	}
	
	
	
	
	public static String getKeyWord_hql(String keyword_content){
		return "from KeyWord as kw where kw.keyword_content='"+keyword_content+"'";
	}
	
	
	public static String getKeyWord_orderBy_hql(String keyword_content){
		return "from KeyWord as kw where kw.keyword_content like '"+keyword_content+"%' order by kw.keyword_before_click DESC";
	}
	
}
