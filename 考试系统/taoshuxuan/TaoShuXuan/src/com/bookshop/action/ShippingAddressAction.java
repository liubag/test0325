package com.bookshop.action;

import java.io.PrintWriter;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.bookshop.entity.ShippingAddress;
import com.bookshop.service.ShippingAddressService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
/**
 *  ’ªıµÿ÷∑Action≤„
 * @author Winds
 *
 */
@SuppressWarnings("serial")
public class ShippingAddressAction extends ActionSupport {
	@Resource 
	private ShippingAddressService shippingAddressService;
	private ShippingAddress shippingAddress;
	private Map<String,Object> session;
	
	public void getShippingAddressByEmail(){
		session = ActionContext.getContext().getSession();
		String customer_email;
		if(session.containsKey("customer_email")){
			customer_email = session.get("customer_email").toString();
		}else{
			return;
		}
		try{
		shippingAddress = shippingAddressService.getShippingAddressByEmail(customer_email);
		 HttpServletRequest request = ServletActionContext.getRequest();
		 request.setAttribute("shippingAddress", shippingAddress);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	public void updateShippingAddress(){
		PrintWriter out = null;
		try{
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("UTF-8");
			out = response.getWriter();
			if(shippingAddressService.updateShippingAddress(shippingAddress)){
				out.print("success");
			}else{
				out.print("input");
			}
			out.flush();
			out.close();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			out.close();
		}
	}

	public ShippingAddressService getShippingAddressService() {
		return shippingAddressService;
	}

	public void setShippingAddressService(
			ShippingAddressService shippingAddressService) {
		this.shippingAddressService = shippingAddressService;
	}

	public ShippingAddress getShippingAddress() {
		return shippingAddress;
	}

	public void setShippingAddress(ShippingAddress shippingAddress) {
		this.shippingAddress = shippingAddress;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	
}
