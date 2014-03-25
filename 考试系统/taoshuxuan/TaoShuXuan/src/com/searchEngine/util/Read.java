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
 * ���� WEB-INF/conf/xlsLoad2DB.xml �ļ�����Ӧʵ���� Questions
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
        SAXReader saxReader = new SAXReader();          //ʹ��SAXReader��ʽ��ȡXML�ļ�    
        //�������ݿ�XML�����ļ����õ�Document����  
        Document document; // Document������XML�ĵ�
        try {  
            File file = new File(filePath);    
			FileInputStream fis=new FileInputStream(file);
			document =saxReader.read(fis); 
            Element root = document.getRootElement();                       //��ø��ڵ�  
			Iterator<?> iterator = root.elementIterator();  //ö�ٸ��ڵ��µ������ӽڵ�
            while(iterator.hasNext()){  
                 Element element = (Element) iterator.next(); 
                 Iterator<?> property = element.elementIterator();  //ö�ٵ�ǰ�ڵ��µ������ӽڵ�
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
      