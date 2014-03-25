<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/login.css" type="text/css" />
</head>
	
<body>
	<div id="login">
    	 <form method="post" action="adminLogin.do">
	  		<table >
	        	<tr><td id="title" colspan="2">管理员后台</td></tr>
	           
	        	<tr>
	            	<td class="first">管理员账号:</td><td><input type="text" name="admin.account"/></td>
	            </tr>
	            <tr>
	            	<td class="first">密&nbsp;&nbsp;&nbsp;码:</td><td><input type="password" name="admin.pw" /></td>
	            </tr>
	            <tr>
	            	<td class="first"></td>
	                <td>
	                	<input class="button" type="submit"value="登录"/>
	                	<input class="button" type="reset" value="重置" />
	                </td>
	            </tr>
	           
			</table>
		 </form>
    </div>
    <div id="bottom">
    	<font id="bottom_font">Copyright ©2012 淘书轩后台管理系统</font> 
    </div>
</body>
</html>
