<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title></title>	
		<script language="JavaScript">
			if (window != top)
				top.location.href = "${pageContext.request.contextPath}/ScatteredGrid/fail.jsp";
			}
		</script>
		<meta http-equiv="Refresh" content="2;url='${pageContext.request.contextPath}/ScatteredGrid/login.jsp'">
	</head>

	<body>
	非常抱歉！登录状态丢失...<br/>
	2秒后自动跳转登录界面...<br/>如果不能自动跳转，请点击<a href="${pageContext.request.contextPath}/ScatteredGrid/fail.jsp">登录</a>进入登录界面
	</body>
</html>
