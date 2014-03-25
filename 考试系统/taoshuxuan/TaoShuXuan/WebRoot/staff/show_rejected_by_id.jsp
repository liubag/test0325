<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>无标题文档</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/staff/css/main.css" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/staff/js/jquery-1.5.2.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/staff/js/jquery.confirm-1.3.js" charset="utf-8"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/staff/js/setPage.js" ></script>

<style type="text/css">
<!--
.STYLE1 {font-size: 12px}
.STYLE3 {color: #707070; font-size: 12px; }
.STYLE5 {color: #0a6e0c; font-size: 12px; }
body {
	margin-top: 0px;
	margin-bottom: 0px;
}
.STYLE7 {font-size: 12}
-->
</style>
</head>

<body>
<%! String url = "showBookInOrder.do?status=2";%>
<div id="breadNav">
	<jsp:include page="breadcrumbNavigation.jsp" />
</div>

   	<a  id="back" href="#" onclick ="javascript:history.go(-1);"> 《***返回  </a>
<h3>所查退货申请：</h3>
<table  width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#c9c9c9">
	 <tr>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">退货申请编号</span></strong></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">退货会员账号</span></strong></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">申请日期</span></strong></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">退货理由</span></strong></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">退货订单编号</span></strong></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">订单状态</span></strong></div></td>
      </tr>
      
      <tr>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3"><s:property value="rejectedApply.rejected_apply_id"/></span></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3"><s:property value="rejectedApply.customer.email"/></span></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3"><s:property value="rejectedApply.apply_date"/></span></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3"><s:property value="rejectedApply.apply_reason"/></span></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3"><a onclick="c()" href="showBookInOrder.do?order.order_id=<s:property value="rejectedApply.order.order_id"  /> "><s:property value="rejectedApply.order.order_id"/></a></span></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3">
        	<c:set var="sex" scope="request" >${rejectedApply.status }"</c:set>
        	<c:choose>	
        		<c:when test="${rejectedApply.status  ==0 }">等待审核</c:when>
				<c:when test="${rejectedApply.status  ==1}">申请成功，等待收货</c:when>
				<c:when test="${rejectedApply.status  ==2}">申请失败</c:when>
				<c:when test="${rejectedApply.status  ==3}">退货成功</c:when>
				
			</c:choose>
        
        </span></div></td>
      </tr>
</table>
<h3>所查订单：</h3>
<table  width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#c9c9c9">
	 <tr>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">订单编号</span></strong></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">下单会员</span></strong></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">下单时间</span></strong></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">订单总金额</span></strong></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">支付方式</span></strong></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">收货地址</span></strong></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">订单状态</span></strong></div></td>
      </tr>
      
      <tr>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3"><s:property value="rejectedApply.order.order_id"/></span></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3"><s:property value="rejectedApply.order.customer.email"/></span></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3"><s:property value="rejectedApply.order.order_date"/></span></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3"><s:property value="rejectedApply.order.amount"/></span></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3"><s:property value="rejectedApply.order.paymentMethod.name"/></span></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3"><s:property value="rejectedApply.order.shippingAddress.shipping_province"/></span></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3">
        	<c:set var="sex" scope="request" >${rejectedApply.order.status }"</c:set>
        	<c:choose>	
        		<c:when test="${rejectedApply.order.status ==0 }">待审核</c:when>
				<c:when test="${rejectedApply.order.status ==1}">待发货</c:when>
				<c:when test="${rejectedApply.order.status ==2}">审核失败</c:when>
				<c:when test="${rejectedApply.order.status ==3}">已发货</c:when>
				<c:when test="${rejectedApply.order.status ==4}">交易成功</c:when>
				<c:when test="${rejectedApply.order.status ==5}">已取消</c:when>
			</c:choose>
        
        </span></div></td>
      </tr>
</table>


<s:debug></s:debug>
</body>
</html>
