<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>无标题文档</title>
<link href="<%=request.getContextPath()%>/staff/css/main.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div id="top">
	      <div id="logo">淘书轩员工后台</div>
		  <div id="user">欢迎您:员工 <s:property value="#session.staff_id"/>,现在时间是 : <%=new Date().toLocaleString()%> </div>	 
	 </div>
</body>
</html>
 