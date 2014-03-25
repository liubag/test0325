<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://tag.forever.org/jsp/tagutil/sitemap" prefix="tagUtil" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>面包屑导航</title>
    <link href="<%=request.getContextPath()%>/staff/css/main.css" rel="stylesheet" type="text/css" />
  </head>
  
  <body>
     <div id="right_font"><img src="<%=request.getContextPath()%>/staff/images/main_14.gif"/> 您现在所在的位置：<tagUtil:siteMap/></div>
  </body>
</html>
