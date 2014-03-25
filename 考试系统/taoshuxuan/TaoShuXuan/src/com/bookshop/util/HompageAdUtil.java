package com.bookshop.util;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.InputStreamReader;
import java.util.Map;
/**
 * 动态生成首页广告工具类
 * @author Winds
 *
 */
public class HompageAdUtil {
	static String readJsPath="\\js_modo\\homepage_ad_modo.js"; //js模板文件路径
	static String outputJsPath="\\js\\homepage_ad.js";  //动态生成js文件输出路径
	
    public static void createJs(Map<String,String> map,String rootPath){
    	try {
			String modoFilePath =rootPath+readJsPath;
			String outputfilePath= rootPath+outputJsPath;
			File file = new File(modoFilePath);    
			FileInputStream fis=new FileInputStream(file);
			BufferedReader br =new BufferedReader(new InputStreamReader(fis));
			StringBuilder sb=new StringBuilder("");
			String temp;
			while((temp=br.readLine())!=null){
				sb.append(temp);
			}
			
			//改变js的内容
			String s=sb.toString().replace("[ad1_href]", map.get("ad1_href"))
								.replace("[ad1_title]", map.get("ad1_title"))
								.replace("[ad1_alt]", map.get("ad1_alt"))
								
								.replace("[ad2_href]", map.get("ad2_href"))
								.replace("[ad2_title]", map.get("ad2_title"))
								.replace("[ad2_alt]", map.get("ad2_alt"))
								
								.replace("[ad3_href]", map.get("ad3_href"))
								.replace("[ad3_title]", map.get("ad3_title"))
								.replace("[ad3_alt]", map.get("ad3_alt"))
								
								.replace("[ad4_href]", map.get("ad4_href"))
								.replace("[ad4_title]", map.get("ad4_title"))
								.replace("[ad4_alt]", map.get("ad4_alt"));
	
			//将动态生成的js文件输出到服务器指定文件夹中
		    BufferedWriter out = new BufferedWriter(new FileWriter(new File(outputfilePath)));
		    out.write(s);
		    out.close();
		    br.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
    
    public static void main(String[] args){
    	createJs(null,"F:\\Program Files\\apache-tomcat-6.0.32\\webapps\\TaoShuXuan");
    }
}
