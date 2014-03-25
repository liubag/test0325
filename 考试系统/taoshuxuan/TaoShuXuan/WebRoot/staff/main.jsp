<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>淘书轩管理员后台</title>
</head>

<frameset rows="60,*,35" cols="*" frameborder="no" border="0" framespacing="0">
  <frame src="<%=request.getContextPath()%>/staff/top.jsp" name="topFrame" scrolling="0" noresize="noresize" id="topFrame" />
  <frameset rows="*" cols="188,*" framespacing="0" frameborder="0" border="no" >
    <frame src="<%=request.getContextPath()%>/staff/left.jsp" name="leftFrame" scrolling="0" noresize="noresize" id="leftFrame"/>

    <frameset rows="35,*" cols="*">
      <frame src="<%=request.getContextPath()%>/staff/right_top.jsp" name="mainFrame" id="mainFrame" />
      <frame src="<%=request.getContextPath()%>/staff/right.jsp" name="main" id="mainFrame"/> 
    </frameset>
  </frameset>
  <frame src="<%=request.getContextPath()%>/staff/bottom.jsp" name="bottomFrame" scrolling="no" noresize="noresize" id="bottomFrame" />
</frameset>

<noframes><body>
</body>
</noframes></html>
