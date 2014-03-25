<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>淘书轩管理员后台</title>
</head>

<frameset rows="60,*,35" cols="*" >
  <frame src="<%=request.getContextPath()%>/admin/top.jsp" name="topFrame" scrolling="no" noresize="noresize" id="topFrame"  />
  <frameset rows="*" cols="188,*" framespacing="0" frameborder="0" border="no" >
    <frame src="<%=request.getContextPath()%>/admin/left.jsp" name="leftFrame" scrolling="no" noresize="noresize" frameborder ="0" id="leftFrame"/>
    <frameset rows="35,*" cols="*">
      <frame src="<%=request.getContextPath()%>/admin/right_top.jsp" name="mainFrame" scrolling="no" noresize="noresize" id="mainFrame" frameborder ="0"/>
      <frame src="<%=request.getContextPath()%>/admin/right.jsp" name="main" id="mainFrame" scrolling="auto" noresize="noresize" frameborder ="0"/> 
    </frameset>
  </frameset>
  <frame src="<%=request.getContextPath()%>/admin/bottom.jsp" frameborder ="0" name="bottomFrame" scrolling="no" noresize="noresize" id="bottomFrame" />
</frameset>

<noframes><body>
</body>
</noframes></html>
