package com.bookshop.action;

import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.apache.struts2.ServletActionContext;

import com.bookshop.service.CollectionService;
import com.bookshop.service.ShoppingRecordService;
import com.opensymphony.xwork2.ActionSupport;
/**
 * 会员购书记录信息Action层
 * @author Winds
 *
 */
@SuppressWarnings("serial")
public class ShoppingRecordAction extends ActionSupport {
	 @Resource
	 private ShoppingRecordService shoppingRecordService;
	 @Resource
	 private CollectionService collectionService;
	 public void getIndexPageLists(){
		 String flag=null;
		 PrintWriter out=null;
		 try{
			 List<Object> hotsale_newbook_l=shoppingRecordService.getHotsale_newbook();
			 List<Object> hotsale_l =shoppingRecordService.getHotsale();
			 List<Object> hotAuthor_l=shoppingRecordService.getHotAuthorBooks();
			 List<Object> hotCollection_l=collectionService.getHotCollection();
			
			 JSONArray ja =new JSONArray();
			 ja.add(0, hotsale_newbook_l);
			 ja.add(1, hotsale_l);
			 ja.add(2,hotAuthor_l);
			 ja.add(3,hotCollection_l);
			
			 flag=ja.toString();
			 HttpServletResponse response = ServletActionContext.getResponse();
			 response.setCharacterEncoding("UTF-8");
		     out = response.getWriter();
			 // 直接输入响应的内容
			 out.print(flag);
		     out.flush();
		 }catch(Exception e){
			 e.printStackTrace();
		 }finally{
			 if(out!=null){
				 out.close();
			 }
		 }
			
	 }
}
