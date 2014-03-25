<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title></title>

	</head>

	<body>
	<div align="center">
	<p>散租商品</p>
	<s:if test="scatteredGoods_l.size()==0">
	没有相关商品
	</s:if>
	<s:else>
	<s:iterator value="scatteredGoods_l">
	<s:property value="goods_id"/> ----- <s:property value="goods_name"/><br/>
	</s:iterator>
	</s:else>
	</div>
	</body>
</html>
