package com.aspsystem.util;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class ReadXlsAndXlsx {
	
	 @SuppressWarnings("rawtypes")
	public static List<Map<String,String>> loadXls(String filePath, int fromRow, String beanName,ServletRequest request){  
	        List<Map<String,String>> list = new ArrayList<Map<String,String>>();  
	        Map<String, String> m = null;  
	        XmlRead4Xls xrx = new XmlRead4Xls();  
	        Map<Integer, String> xmlM = xrx.readXml(request,beanName);        //从配置文件中读取xls文件中的参数位置配置  
	          
	        try {  
	        	 InputStream input = new FileInputStream(filePath);
	            POIFSFileSystem fs = new POIFSFileSystem(input);  
	            HSSFWorkbook wb = new HSSFWorkbook(fs);  
	            HSSFSheet sheet = wb.getSheetAt(0);  
	            // Iterate over each row in the sheet     
	            Iterator rows = sheet.rowIterator();  
	            while (rows.hasNext()) {  
	                HSSFRow row = (HSSFRow) rows.next();  
	                m = new HashMap<String,String>();  
	              
	                if(row.getRowNum() >= fromRow){  
	                    Iterator cells = row.cellIterator();  
	                    int count = 1;          //数一行中的位置  
	                    while (cells.hasNext()) {  
	                        HSSFCell cell = (HSSFCell) cells.next();  
	                        String cellValue = "";  
	                        if(cell!=null){
		                        switch (cell.getCellType()) {  
		                            case HSSFCell.CELL_TYPE_NUMERIC:  
		                                cellValue = String.valueOf(((Double)cell.getNumericCellValue()).longValue());  
		                                break;  
		                            case HSSFCell.CELL_TYPE_STRING:  
		                                cellValue = cell.getStringCellValue();  
		                                break;  
		                            case HSSFCell.CELL_TYPE_BOOLEAN:  
		                                cellValue = String.valueOf(cell.getBooleanCellValue());  
		                                break;  
		                            case HSSFCell.CELL_TYPE_FORMULA:  
		                                cellValue = String.valueOf(cell.getCellFormula());  
		                                break;  
		                            case HSSFCell.CELL_TYPE_BLANK:  
		                            
		                            default:  
		                        
		                                break;  
		                        } 
	                        }
	                        if(xmlM.get(count) != null){  
	                          m.put(xmlM.get(count), cellValue);
	                        }  
	                        count++;  
	                    }  
	                        list.add(m);   
	                }  
	            }  
	           
	            return list;  
	        } catch (Exception ex) {  
	            ex.printStackTrace();  
	            return null;
	        }
	    }
	
	 public static List<Map<String,String>> loadXlsx(String filepath, int fromRow, String beanName,ServletRequest request) {   
		 List<Map<String,String>> list = new ArrayList<Map<String,String>>();  
	        Map<String, String> m = null;  
	        XmlRead4Xls xrx = new XmlRead4Xls();  
	        Map<Integer, String> xmlM = xrx.readXml(request,beanName);        //从配置文件中读取xlsx文件中的参数位置配置  
	        XSSFWorkbook xwb = null;  	      
	        try {  
	              
	            xwb = new XSSFWorkbook(filepath);  
	            XSSFSheet sheet = xwb.getSheetAt(0);   
	            XSSFRow row;      
	            if(fromRow >= sheet.getPhysicalNumberOfRows()){  
	                fromRow = sheet.getPhysicalNumberOfRows() -1 ;  
	            }  
	            for (int i = fromRow; i < sheet.getPhysicalNumberOfRows(); i++) {  
	                row = sheet.getRow(i);  
	                int count = 1;          //数一行中的位置  
	                m = new HashMap<String, String>();  
	                for (int j = 0; j < xmlM.size();j++) {  
	                    XSSFCell cell = row.getCell(j);  
	                    String cellValue = "";  
	                    if(cell!=null){
		                    switch (cell.getCellType()) {  
		                   
		                        case XSSFCell.CELL_TYPE_NUMERIC:  
		                            cellValue = String.valueOf(((Double)cell.getNumericCellValue()).longValue());  
		                            break;  
		                        case XSSFCell.CELL_TYPE_STRING:  
		                            cellValue = (cell.getStringCellValue());  
		                            break;  
		                        case XSSFCell.CELL_TYPE_BOOLEAN:  
		                            cellValue = String.valueOf(cell.getBooleanCellValue());  
		                            break;  
		                        case XSSFCell.CELL_TYPE_FORMULA:  
		                            cellValue = String.valueOf(cell.getCellFormula());  
		                            break;  
		                        case XSSFCell.CELL_TYPE_BLANK:  
		                            cellValue = (cell.getStringCellValue());  
		                            break;  
		                        default:  
		                        
		                            break;  
		                      
		                    }
	                    }
	                    if(xmlM.get(count) != null){  
	                      m.put(xmlM.get(count), cellValue);
	                    }  
	                    count++;  
	                      
	                }  
	                    list.add(m);   
	            }
	            return list;
	        } catch (Exception e1) {  
	            e1.printStackTrace(); 
	            return null;
	        } 
	       
	    }   
	      
}
