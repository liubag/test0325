package com.OnlineGridShop.util;

import java.util.HashMap;
import java.util.Map;

/*
 * ������Ϣ
 * 
 */
public class MyAppConfigs {
	public static Map<String,String> appConfigs ;
	static{
		appConfigs = new HashMap<String, String>();
		appConfigs.put("perFolioAmount", "10");  //ÿҳ��ʾ��Ϣ��������ǰΪ10
		appConfigs.put("perFolioAmount_admin", "8");  //ÿҳ��ʾ��Ϣ��������ǰΪ10
		appConfigs.put("pfa_admin_showBrandgridGrid", "50");  //ÿҳ��ʾ��Ϣ��������ǰΪ20
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
