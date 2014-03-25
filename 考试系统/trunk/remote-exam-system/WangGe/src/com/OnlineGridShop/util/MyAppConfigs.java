package com.OnlineGridShop.util;

import java.util.HashMap;
import java.util.Map;

/*
 * 配置信息
 * 
 */
public class MyAppConfigs {
	public static Map<String,String> appConfigs ;
	static{
		appConfigs = new HashMap<String, String>();
		appConfigs.put("perFolioAmount", "10");  //每页显示信息数量，当前为10
		appConfigs.put("perFolioAmount_admin", "8");  //每页显示信息数量，当前为10
		appConfigs.put("pfa_admin_showBrandgridGrid", "50");  //每页显示信息数量，当前为20
		appConfigs.put("brandgridGrid_prefere", "1");
		appConfigs.put("all_type", "16"); //all_type,brand,scattered
		appConfigs.put("brand", "20");
		appConfigs.put("scattered", "20");
		appConfigs.put("brand_grid", "20");
		appConfigs.put("scattered_grid", "20");
		appConfigs.put("brandgrid_grid", "20");
	}
	
	public static void updata(String keyName,String value){
		if(appConfigs.containsKey(keyName)){
			appConfigs.remove(keyName);
			appConfigs.put(keyName, value);
		}
	}
}
