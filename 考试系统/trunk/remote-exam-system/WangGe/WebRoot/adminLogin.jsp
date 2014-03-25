<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>网格网管-登录入口</title>
<script src="${pageContext.request.contextPath}/ScatteredGrid/js/jquery-1.5.1.min.js" type="text/javascript"></script>
		<script language="JavaScript">
			$(document).ready(function(){
		  		var loginstatu = $("#loginstatu").attr("value");
		  		if(loginstatu.length > 1){
		  			alert(loginstatu);
		  		}
		  	})
			if (window != top)
			top.location.href = "${pageContext.request.contextPath}/adminLogin.jsp";
			function check(){
				var name = $("#name").attr("value");
				var pw = $("#pw").attr("value");
				if(name == null || name.length <= 0){
					alert("用户名不能为空。")
					return false;
				}
				if(pw == null || pw.length <= 0){
					alert("密码不能为空。")
					return false;
				}
				document.loginform.submit();
			}
		</script>
<link href="${pageContext.request.contextPath}/css/login.css" rel="stylesheet" type="text/css" />
</head>

<body>
<input type="hidden" value="<s:property value="tip"/> " id="loginstatu"/>
<div id="middle_bg"></div>
<div id="dekoration"></div>
<div id="login_box">
	<s:form method="post" action="admin_login" id="loginform">
	<div id="login_box1">
	<div class="text">
		<span>用户名</span><input class="text1" name="name" type="text" id="name"/>
	</div>
	<div class="text">
		<span>密&nbsp;&nbsp;码</span><input class="text1" name="pw" type="password" id="pw"/>  
	</div>
	<div id="yes">
	<img src="${pageContext.request.contextPath}/pic/login_yes.jpg" width="66" height="27" onclick="return check();"/>
	</div>
    </div>
    </s:form>
</div>
</body>
</html>
