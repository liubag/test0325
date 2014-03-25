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
		String gridtypeid = request.getParameter("gridtypeid");
		String gridtypename = new String(request.getParameter("gridtypename").getBytes("ISO8859-1"),"utf-8");
		String hard_disk_space = request.getParameter("hard_disk_space");
		String canshowgoods = request.getParameter("canshowgoods");
		String unitprice = request.getParameter("unitprice");
		String lz_note = request.getParameter("lz_note");
	 %>

	 	<s:property value="tip"/>
		<s:form method="post" action="updateGridType">
		<input type="hidden"  name="gridType.gridtype_id" value="<%=gridtypeid %>" />
		<table>
		<tr>
		<td class="table_td_11">格子类型名称：</td><td class="table_td_12"><input type="text"  name="gridType.gridtypename" value="<%=gridtypename %>"/></td>
		</tr>
		<tr>
		<td class="table_td_11">可容纳商品数：</td><td class="table_td_12"><input type="text" name="gridType.canshowgoods" value="<%=canshowgoods %>"/></td>
		</tr>
		<tr>
		<td class="table_td_11">可使用空间大小：</td><td class="table_td_12"><input type="text" name="gridType.hard_disk_space" value="<%=hard_disk_space %>" size="3"/>MB</td>
		</tr>
		<tr>
		<td class="table_td_11">单价：</td><td class="table_td_12"><input type="text" name="gridType.unitprice" value="<%=unitprice %>"/></td>
		</tr>
		<tr>
		<td class="table_td_11">每天可置顶次数：</td><td class="table_td_12"><input type="text" name="gridType.LZ_note" value="<%=lz_note %>"/></td>
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