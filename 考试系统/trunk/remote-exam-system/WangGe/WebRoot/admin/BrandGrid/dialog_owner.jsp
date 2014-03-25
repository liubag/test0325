<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*,com.OnlineGridShop.scattered.Entity.GridType,com.OnlineGridShop.scattered.Entity.ScatteredGridRendtypeMake" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<html >
<head>
	<title></title>
<style type="text/css">
    #shang
    {
        width:410px;
        height:auto;
        margin:5px;
        float:left;
		
        }
	.div_1{
		width:150px; 
		float:left;
		text-align:right;
		background:#FFF38F;
		margin-right:5px;
		margin-top: 5px;
	}
	.div_1_2{
		width:150px; 
		float:left;
		text-align:right;
		background:#FFFFEE;
		margin-right:5px;
		margin-top: 5px;
	}
	.div_2{
		width:245px;
		float:left;
		background:#FFF38F;
		margin-right:10px;
		margin-top: 5px;
	}
	.div_2_2{
		width:245px;
		float:left;
		background:#FFFFEE;
		margin-right:10px;
		margin-top: 5px;
	}
	.div_title{
		background:#669999; 
		text-align:center;
	    width:400px;
	}
</style>
</head>
<%
	String on = new String(request.getParameter("on").getBytes("ISO8859-1"),"utf-8");
	String os = new String(request.getParameter("os").getBytes("ISO8859-1"),"utf-8");
	String op = request.getParameter("op");
 %>
<body>
    <div id="shang">
    <div class="div_title">品牌店法人信息</div>
	<div class="div_1">名称：</div><div class="div_2"><%=on %></div>
	<div class="div_1_2">性别：</div><div class="div_2_2"><%=os %></div>
	<div class="div_1">联系电话：</div><div class="div_2"><%=op %></div>
	</div>
</body>
</html>