package com.aspsystem.action;
import java.io.*;

import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class TestPaperAction extends ActionSupport{
	private String filename;
	

	public void setFilename(String filename) {
		try {
			this.filename= new String(filename.getBytes("ISO8859-1"),"utf-8");
			
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public InputStream getInputStream() throws Exception{
		
		return ServletActionContext.getServletContext().getResourceAsStream("/admin/examFile/"+filename);
	}
	
	public String download() throws Exception{
		return SUCCESS;
	}
	/** 提供转换编码后的供下载用的文件名 */   
	 
	public String getDownloadFileName() {   
		String downFileName = filename;   		
	    try {   	 
	        downFileName = new String(downFileName.getBytes(),"ISO8859-1"); 	 
	    } catch (UnsupportedEncodingException e) {   	  
	        e.printStackTrace();   	  
	    }   
	    return downFileName;   
	 
	    }   

}

