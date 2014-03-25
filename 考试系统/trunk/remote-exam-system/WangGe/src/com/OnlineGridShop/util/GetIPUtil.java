package com.OnlineGridShop.util;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

public class GetIPUtil {
	
	public static String getMyIP() {
        try {
            HttpServletRequest request = (HttpServletRequest)ServletActionContext.getRequest();
            String ip = request.getRemoteAddr();
            return ip;
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return "";
    }
	

}
