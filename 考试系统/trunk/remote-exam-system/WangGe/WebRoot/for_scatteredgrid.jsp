<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title></title>

	</head>

	<body>
	<div align="center">
	<p>散租网格</p>
	<s:if test="scatteredGrid_l.size()==0">
	没有相关散租网格
	</s:if>
	<s:else>
	<s:iterator value="scatteredGrid_l">
	<s:property value="gridid"/> ----- <s:property value="grid_name"/><br/>
	</s:iterator>
	</s:else>
	</div>
	</body>
</html>
