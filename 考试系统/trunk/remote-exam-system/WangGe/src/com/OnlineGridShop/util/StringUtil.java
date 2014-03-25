package com.OnlineGridShop.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class StringUtil {
	public static float makeprice(Integer integer,Integer decimal){
		String str_price = Integer.toString(integer) + "." + Integer.toString(decimal);
		return Float.parseFloat(str_price);
	}
	
	public static String stringWithFormat(String str, Object... args) {
		str = String.format(str, args);
		return str;
	}
	
	
	/*
	 *flag : 分割标志 
	 */
	public static List<String> stringToList(String str,String flag){
		String str_[] = str.split(flag);
		List<String> l = new ArrayList<String>();
		for(String s : str_){
			if(!s.equals("")){
				l.add(s);
			}
		}
		return l;
	}
	
	/*例如：
	 * addGoods_no = 1；
	 * return : "100" + addGoods_no;  //一共四位数
	 */
	public static String addGoods_noToString(Integer addGoods_no){
		String addGoods_no_str = Integer.toString(addGoods_no);
		int i = 3 - addGoods_no_str.length();
		for(;i>0;i--){
			addGoods_no_str = "0" + addGoods_no_str;
		}
		return "1" + addGoods_no_str;
	}
	
	/*
	 * 将折扣优惠商品id封装Map
	 * 如：,id01:0.95,id02:0.65,....
	 */
	public static Map<String,String> stringToMap(String str){
		Map<String,String> id_zk_map = new HashMap<String, String>();
		//去掉最前“,”
		str = str.substring(1, str.length());
		String str01[] = str.split(",");
		String str02[] = null;
		for(String s01 : str01){
			str02 = s01.split(":");
			id_zk_map.put(str02[0], str02[1]);
		}
		return id_zk_map;
	}
	
	
	
	

	
}
