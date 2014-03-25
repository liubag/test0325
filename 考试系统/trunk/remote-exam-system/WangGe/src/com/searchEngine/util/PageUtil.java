package com.searchEngine.util;

import java.util.ArrayList;
import java.util.List;

public class PageUtil {
	//将页数制成List<>,用于页数跳转下拉框
	public static List<Integer> getPageList(Integer hasPage){
		List<Integer> page_l = new ArrayList<Integer>();
		if(hasPage != null && hasPage >0){
			for(int i= 1;i <= hasPage;i++){
				page_l.add(i);
			}
		}
		return page_l;
	}
	//计算总页数
	public static int findAllPages(int perFolioAmount,Long has){
		int pagenum;
		int num = has.intValue();
		pagenum = num/perFolioAmount;
		num = num%perFolioAmount;
		if(num>0){
			pagenum++;
		}
		return pagenum;
	}
}
