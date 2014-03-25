<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title></title>
<style>

</style>

</head>
<body>
<p>BrandgridGoods</p>
<s:if test="goods_l != null && goods_l.size()>0">
<table width="100%">
<tr>
<th>商品id</th>
<th>商品名称</th>
</tr>
<s:iterator value="goods_l" status="st">
<tr>
<td><s:property value="brandgrid_goods_id"/></td>
<td><s:property value="goods_name"/></td>
</tr>
</s:iterator>
</table>
</s:if>
<s:else>
没有相关宝贝！
</s:else>
<p>ScatteredGridGoods</p>
<s:if test="goods_l2 != null && goods_l2.size()>0">
<table width="100%">
<tr>
<th>商品id</th>
<th>商品名称</th>
</tr>
<s:iterator value="goods_l2" status="st">
<tr>
<td><s:property value="goods_id"/></td>
<td><s:property value="goods_name"/></td>
</tr>
</s:iterator>
</table>
</s:if>
<s:else>
没有相关宝贝！
</s:else>
</body>
</html>
