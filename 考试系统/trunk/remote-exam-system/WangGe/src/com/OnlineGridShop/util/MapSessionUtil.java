package com.OnlineGridShop.util;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
@SuppressWarnings("unchecked")
public class MapSessionUtil {
	public static String getString(Map map,String key){
		return (String) map.get(key);
	}
	public static void remove(Map map,String key){
		if(map.get(key)!=null){
			map.remove(key);
		}
	}
	public static Map getSessionMap(){
		return ActionContext.getContext().getSession();
	}
}
