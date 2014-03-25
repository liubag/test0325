<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title></title>

	</head>

	<body>
	<div align="center">
	<p>品牌网格 ： <s:property value="brandgrid.brandgrid_name"/></p>
	<s:if test="brangridGrid_l.size()==0">
	没有格子
	</s:if>
	<s:else>
	<s:iterator value="brangridGrid_l">
	<s:property value="brandgrid_grid_id"/> ----- <s:property value="grid_name"/><br/>
	</s:iterator>
	</s:else>
	</div>
	</body>
</html>
