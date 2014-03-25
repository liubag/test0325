<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*,com.OnlineGridShop.scattered.Entity.GridType,com.OnlineGridShop.scattered.Entity.ScatteredGridRendtypeMake" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<html >
<head>
	<title></title>
	<%
		String username = request.getParameter("username"); 
		String pw = request.getParameter("pw");  
		String in = request.getParameter("in"); 
		String outt = request.getParameter("outt"); 
		String u_goods = request.getParameter("u_goods");
		String h_goods = request.getParameter("h_goods");
	 %>
	<style type="text/css">
	.sumbit{
	background-color:#d8be98;
	border:dashed 1px #d8be98;
	}
	</style>
</head>
<body style="background-color：#FFF3D2;">
    <div style="text-align: center;">
    	<div style="margin-top: 30px;margin-left: 80px;">
    	<table cellspacing="0">
    		<tr>
    			<td style="text-align:right;">用户名：</td>
    			<td style="text-align:left;"><%=username %></td>
    		</tr>
    		<tr>
    			<td style="text-align:right;">密码：</td>
    			<td style="text-align:left;"><%=pw %></td>
    		</tr>
    		<tr>
    			<td style="text-align:right;">在架商品数：</td>
    			<td style="text-align:left;"><%=u_goods %></td>
    		</tr>
    		<tr>
    			<td style="text-align:right;">全部商品数：</td>
    			<td style="text-align:left;"><%=h_goods %></td>
    		</tr>
    		<tr>
    			<td style="text-align:right;">入驻时间：</td>
    			<td style="text-align:left;"><%=in %></td>
    		</tr>
    		<tr>
    			<td style="text-align:right;">最近注销时间：</td>
    			<td style="text-align:left;"><%=outt %></td>
    		</tr>
    	</table>
    	</div>
	</div>
</body>
</html>