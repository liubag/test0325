<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title></title>

	</head>

	<body>
	<div align="center">
	<p>品牌</p>
	<s:if test="brandGrid_l.size()==0">
	品牌模块未开启
	</s:if>
	<s:else>
	<s:iterator value="brandGrid_l">
	<a href="showAllBgGrid_aa.do?brandgrid_id=<s:property value="brandgrid_id"/>"><s:property value="brandgrid_id"/> ----- <s:property value="brandgrid_name"/></a><br/>
	</s:iterator>
	</s:else>
	</div>
	</body>
</html>
