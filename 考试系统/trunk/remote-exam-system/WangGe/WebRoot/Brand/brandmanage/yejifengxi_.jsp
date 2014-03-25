<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
<%
	String owner_status = request.getParameter("owner_status");
	String n_statu = request.getParameter("n_statu");
 %>
<script src="${pageContext.request.contextPath}/Brand/js/jquery-1.6.4.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/Brand/brandmanage/yeji_js/<s:property value="#session.brand_id"/>/yejifengxi<%=owner_status+n_statu %>.js" type="text/javascript"></script>


</head>

<body  onload="refreshSize()">
<script src="${pageContext.request.contextPath}/highcharts_js/highcharts.js"></script>
<script src="${pageContext.request.contextPath}/highcharts_js/modules/exporting.js"></script>

<div id="container" style="min-width: 400px; height: 440px;margin: 0 auto;"></div>
</body>
</html>
