package com.aspsystem.util;

import java.io.File;
import java.io.FileInputStream;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
/**
 * 解析 WEB-INF/conf/xlsLoad2DB.xml 文件，对应实体类 Questions
 * @author Winds
 *
 */
public class XmlRead4Xls {  
	static String uploadCfgFile = "WEB-INF/conf/xlsLoad2DB.xml"; 
	
	 private String getuploadCfgFile(ServletRequest request) {     
	      return ((HttpServletRequest) request).getSession().getServletContext().getRealPath(uploadCfgFile);     
	 }     
    
    public Map<Integer, String> readXml(ServletRequest request,String beanName){  
       String filePath= getuploadCfgFile(request);
          
        return readXml(filePath, beanName);  
    }     
    
     
    @SuppressWarnings("rawtypes")
	public  Map<Integer, String> readXml(String filePath, String beanName){  
          
        SAXReader saxReader = new SAXReader();          //使用SAXReader方式读取XML文件  
        Map<Integer, String> map = new HashMap<Integer, String>();  
        //加载数据库XML配置文件，得到Document对象  
        Document document;  
        try {  
            File file = new File(filePath);  
          System.out.println(file.getAbsolutePath());  
			FileInputStream fis=new FileInputStream(file);
			document =saxReader.read(fis);
           // document = saxReader.read(this.getClass().getClassLoader().getResourceAsStream(filePath));  
            Element root = document.getRootElement();                       //获得根节点  
			Iterator iterator = root.elementIterator();  
            while(iterator.hasNext()){  
                 Element element = (Element) iterator.next(); 
                 if( element.attributeValue("name") != null &&  element.attributeValue("name").compareTo(beanName) == 0){  
                     Iterator property = element.elementIterator();  
                     while(property.hasNext()){  
                         Element elementPro = (Element) property.next();             
                         map.put(Integer.valueOf(elementPro.attributeValue("position")), elementPro.attributeValue("name"));  
//                         System.out.println(elementPro.attributeValue("name"));  
//                         System.out.println(elementPro.attributeValue("position"));  
                     }  
                 }  
            }  
            return map;
        } catch (Exception e) {  
            e.printStackTrace();  
            return null;
        }     
     }  
    
//      public static void main(String[] args){  
//          XmlRead4Xls xrx = new XmlRead4Xls();  
//          xrx.readXml("D:\\liu\\xlsLoad2DB.xml","Questions");  
//      }  
}
      