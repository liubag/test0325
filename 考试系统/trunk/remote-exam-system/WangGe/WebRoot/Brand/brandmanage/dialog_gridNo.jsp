<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*,com.OnlineGridShop.scattered.Entity.GridType,com.OnlineGridShop.scattered.Entity.ScatteredGridRendtypeMake" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<html >
<head>
	<title></title>
	<% 
		String gridNo = new String(request.getParameter("gridNo").getBytes("ISO8859-1"),"utf-8"); 
		String addgoods_no = request.getParameter("addgoods_no"); 
		String gridid = request.getParameter("gridid"); 
	 %>
	<script src="${pageContext.request.contextPath}/Brand/js/jquery-1.6.4.min.js" type="text/javascript"></script>
	<link href="${pageContext.request.contextPath}/Brand/css/dialog_gridNo.css" rel="stylesheet" type="text/css" />
	<script src="${pageContext.request.contextPath}/Brand/js/dialog_gridNo.js" type="text/javascript"></script>
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
<input type="hidden" value="<%=gridid %>" id="gridid"/>
	<table cellspacing="0" width="100%;">
		<tr>
		<td style="text-align: right; width: 40%;">
		格子编号（<span id="namewordcount">0/5</span>）：
		</td>
		<td style="width: 30%;">
		<label style="text-align: center;">
		修改<input type="checkbox" value="1" id="xgno"/><br/>
		<span id="grid_num2"><%=gridNo %></span>
		<input type="text" id="grid_num" name="<%=gridNo %>" value="<%=gridNo %>" class="required" onkeyup="gridNokeyup();"/>
		</label>
		</td>
		<td style="width: 30%; text-align: left;" id="span">
		<strong class='high'>*</strong>
		</td>
		</tr>
		<tr>
			<td style="text-align: right; width: 40%;">
				商品编码前缀（数字<span id="namewordcount2">0/5</span>）：
			</td>
			<td style="width: 30%;">
				<label style="text-align: center;">
				修改<input type="checkbox" value="1" id="xggno"/><br/>
				<span id="addgoods_no2"><%=addgoods_no %></span>
				<input type="text" id="addgoods_no" name="<%=addgoods_no %>" value="<%=addgoods_no %>" class="required" onkeyup="addgoods_nokeyup();"/>
				</label>
			</td>
			<td style="width: 30%; text-align: left;" id="span2">
				<strong class='high'>*</strong>
			</td>
		</tr>
		<tr>
		<td style="text-align: right;">
		
		</td>
		<td style="text-align: right;">
		&nbsp;
		</td>
		<td>
		</td>
		</tr>
		<tr>
		<td style="text-align: right;">
		<input type="submit" class="sumbit" id="sure" value="确定" />
		</td>
		<td style="text-align: right;">
		<input type="reset" class="sumbit" id="res" value="重置" onclick="res();"/>
		</td>
		<td>
		</td>
		</tr>
	</table>
</body>
</html>