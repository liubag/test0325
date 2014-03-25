package com.searchEngine.util;

import java.io.File;
import java.io.FileInputStream;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
/**
 * 解析 WEB-INF/conf/xlsLoad2DB.xml 文件，对应实体类 Questions
 * @author Winds
 *
 */
public class Read {  
	static String uploadCfgFile ="\\searchEngine\\xml\\SearchEngineDemo.xml"; 
	static Map<String, String> xmlValue_map = new HashMap<String, String>();
	
	 private static String getuploadCfgFile() {     
	      //return ServletActionContext.getRequest().getRealPath(uploadCfgFile);  
			String path=System.getProperty("webapp.root")+uploadCfgFile; 
			return path;
		
	 }     
    
  
    
     
	 public static boolean readXml(){  
    	String filePath= getuploadCfgFile();
        SAXReader saxReader = new SAXReader();          //使用SAXReader方式读取XML文件    
        //加载数据库XML配置文件，得到Document对象  
        Document document; // Document定义了XML文档
        try {  
            File file = new File(filePath);    
			FileInputStream fis=new FileInputStream(file);
			document =saxReader.read(fis); 
            Element root = document.getRootElement();                       //获得根节点  
			Iterator<?> iterator = root.elementIterator();  //枚举根节点下的所有子节点
            while(iterator.hasNext()){  
                 Element element = (Element) iterator.next(); 
                 Iterator<?> property = element.elementIterator();  //枚举当前节点下的所有子节点
                 while(property.hasNext()){  
                      Element elementPro = (Element) property.next();             
                      xmlValue_map.put(elementPro.attributeValue("name"), elementPro.attributeValue("value"));  
                 }  
            }  
            return true;
        } catch (Exception e) {  
            e.printStackTrace();  
            return false;
        }     
     }  
    

}
      