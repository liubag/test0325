<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title></title>
	<script src="${pageContext.request.contextPath}/admin/js/jquery-1.5.1.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/ScatteredGrid/js/onloadIframe.js" type="text/javascript"></script>
	<link href="${pageContext.request.contextPath}/admin/css/table.css" type="text/css" rel="stylesheet" />
</head>

<body>
<div id="box" >
  <div id="zhuanghu" align="center">
  	<%
		String rendtype_id = request.getParameter("rendtype_id");
		String type_called = new String(request.getParameter("type_called").getBytes("ISO8859-1"),"utf-8");
		
		String months = request.getParameter("months");
		String rendtype_agio = request.getParameter("rendtype_agio");
	 %>
	 
	 	<s:property value="tip"/>
		<s:form method="post" action="updateRendType">
		<input type="hidden"  name="scatteredGridRendtypeMake.rendtype_id" value="<%=rendtype_id %>"/>
		<table>
			
			<tr>
			<td class="table_td_11">出租类型名称：</td><td class="table_td_12"><input type="text"  name="scatteredGridRendtypeMake.type_called" value="<%=type_called %>"/></td>
			</tr>
			<tr>
			<td class="table_td_11">出租月份：</td><td class="table_td_12"><input type="text" name="scatteredGridRendtypeMake.months" value="<%=months %>"/></td>
			</tr>
			<tr>
			<td class="table_td_11">折扣：</td><td class="table_td_12"><input type="text" name="scatteredGridRendtypeMake.rendtype_agio" value="<%=rendtype_agio %>"/></td>
			</tr>
			<tr>
			<td class="table_td_11"><s:submit value="确定" /></td><td class="table_td_12"><s:reset value="重置"/></td>
			</tr>
		</table>
			
		</s:form>
  </div>
</div>
</body>
</html>