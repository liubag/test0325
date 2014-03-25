package com.bookshop.servlet;

import java.awt.Color;
import java.awt.Font;
import java.io.IOException;
import java.io.PrintWriter;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/*
 * 
 *生成验证码
 * 
 */
@SuppressWarnings("serial")
public class RandomGraphics2 extends HttpServlet
{
	
	int width,height;

	public void init() throws ServletException {
	    width = 80;
	    height = 30;
    }
		
	
	public void doGet (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		@SuppressWarnings("unused")
		PrintWriter out;
		ServletOutputStream outb;

		outb=response.getOutputStream();

		response.setHeader ("Pragma", "no-cache");
		response.setHeader ("Cache-Control", "no-cache");
		response.setDateHeader ("Expires",0);
		//response.setContentType("image/jpeg");

		if((request.getParameter("width") != null) || (!request.getParameter("width").equals(""))){
			if((request.getParameter("height") != null) || (!request.getParameter("height").equals(""))){
				width = new Integer(request.getParameter("width")).intValue();
				height = new Integer(request.getParameter("height")).intValue();
			}
		}
		
		String r1 = request.getParameter("r1");
		String r2 = request.getParameter("r2");
		String r3 = request.getParameter("r3");
		String r4 = request.getParameter("r4");
		
		
		try 
		{			     
			java.awt.image.BufferedImage BarImage=new java.awt.image.BufferedImage(width,height,java.awt.image.BufferedImage.TYPE_BYTE_INDEXED);
			java.awt.Graphics BarGraphics = BarImage.createGraphics();
			
			BarGraphics.setColor(Color.white);
			BarGraphics.fillRect(0,0,width,height);
			
			BarGraphics.setColor(Color.cyan);
			BarGraphics.fillRect(0,0,width-1,height-1);
			
			BarGraphics.setColor(Color.red);
			BarGraphics.setFont(new Font("Atlantic Inline",Font.PLAIN,18));
			BarGraphics.drawString(r1,width/8-6,height/2+6);
			BarGraphics.drawString(r2,width/8+width/4-6,height/2+6);
	    	BarGraphics.drawString(r3,width/8+(width/4)*2-6,height/2+6);
	    	BarGraphics.drawString(r4,width/8+(width/4)*3-6,height/2+6);
	    	
	    	java.util.Random random = new java.util.Random();
	    	for(int i = 0;i < 100;i++){//画麻点
		    	int x = random.nextInt(width-1);
		    	int y = random.nextInt(height-1);
		    	if(i%2 == 0){
		    		BarGraphics.setColor(Color.black);
		    	}else{
		    		BarGraphics.setColor(Color.green);
		    	}
	     		
	     		BarGraphics.drawOval(x,y,0,0);
	    	}
	    	
	    	ImageIO.write(BarImage,"JPEG",outb);
			/*com.sun.image.codec.jpeg.JPEGImageEncoder encoder = com.sun.image.codec.jpeg.JPEGCodec.createJPEGEncoder(outb);
			com.sun.image.codec.jpeg.JPEGEncodeParam param = encoder.getDefaultJPEGEncodeParam(BarImage); 
			param.setQuality(1.0F,true);
			encoder.setJPEGEncodeParam(param);
			encoder.encode(BarImage,param);*/
			
		} catch (Exception e) { e.printStackTrace();}
	}

	public void doPost (HttpServletRequest request, HttpServletResponse response) throws ServletException
	{
		try 
		{
			doGet(request,response);
		}catch (Exception e) { e.printStackTrace();}
	}

}
