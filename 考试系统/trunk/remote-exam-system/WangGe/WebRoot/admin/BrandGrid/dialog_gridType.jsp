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
	String gn = new String(request.getParameter("gn").getBytes("ISO8859-1"),"utf-8");
	String csg = request.getParameter("csg");
	String u = request.getParameter("u");
	String hds = request.getParameter("hds");
	String lz = request.getParameter("lz");
 %>
<body>
    <div id="shang">
    <div class="div_title">格子类型</div>
	<div class="div_1">类型：</div><div class="div_2"><%=gn %></div>
	<div class="div_1_2">可容商品数：</div><div class="div_2_2"><%=csg %>个商品</div>
	<div class="div_1">单价：</div><div class="div_2"><%=u %>元整/月</div>
	<div class="div_1_2">空间大小：</div><div class="div_2_2"><%=hds %>MB</div>
	<div class="div_1">每天可置顶次数：</div><div class="div_2"><%=lz %>次</div>
	</div>
</body>
</html>