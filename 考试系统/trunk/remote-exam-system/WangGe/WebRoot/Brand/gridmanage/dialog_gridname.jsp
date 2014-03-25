<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*,com.OnlineGridShop.scattered.Entity.GridType,com.OnlineGridShop.scattered.Entity.ScatteredGridRendtypeMake" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<html >
<head>
	<title></title>
	<% 
		String gridname = request.getParameter("gridname"); 
	 %>
	<script src="${pageContext.request.contextPath}/Brand/js/jquery-1.6.4.min.js" type="text/javascript"></script>
	<link href="${pageContext.request.contextPath}/Brand/css/dialog_gridname.css" rel="stylesheet" type="text/css" />
	<script src="${pageContext.request.contextPath}/Brand/js/dialog_gridname.js" type="text/javascript"></script>
	<style type="text/css">
	.sumbit{
	background-color:#d8be98;
	border:dashed 1px #d8be98;
	}
	.text_red{
		color: red;
	}
	
	.text_black{
		color: black;
	}
	</style>
</head>
<body style="background-color：#FFF3D2;">
	<table cellspacing="0" width="100%;">
		<tr>
		<td style="text-align: right; width: 40%;">
		格子名称（<span id="namewordcount">0/15</span>）：
		</td>
		<td style="width: 40%;">
		<label style="text-align: center;">
		<input type="text" id="gridname" name="<%=gridname %>" value="<%=gridname %>" class="required" onkeyup="gridnamekeyup();"/>
		</label>
		</td>
		<td style="width: 20%; text-align: left;" id="span">
		</td>
		</tr>
		<tr>
		<td>
		</td>
		<td>
		<input type="submit" class="sumbit" id="sure" value="确定" />
		</td>
		</tr>
	</table>
</body>
</html>