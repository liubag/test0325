<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <title>网格首页</title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <link href="<%=request.getContextPath() %>/css/basic_nav1.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
    	<div id="header">
        	<div id="nav1">
            	<jsp:include page="top.jsp"></jsp:include>
            </div>
            <div id="logo">
            	<div id="logo11"><img src="<%=request.getContextPath() %>/images/logo1.jpg" alt="logo1"/></div>
                <div id="logo12"><img src="<%=request.getContextPath() %>/images/logo2.png" alt="logo1"/></div>	
            </div>
         	<div id="nav2">
                <img class="img3" src="<%=request.getContextPath() %>/images/logo3.png" align="logo3"/>
            </div>
        </div>
    </body>
</html>