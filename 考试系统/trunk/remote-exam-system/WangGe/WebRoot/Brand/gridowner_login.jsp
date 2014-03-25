<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>品牌店格主-登录入口</title>
		<script src="${pageContext.request.contextPath}/ScatteredGrid/js/jquery-1.5.1.min.js" type="text/javascript"></script>
		<script language="JavaScript">
			$(document).ready(function(){
		  		var loginstatu = $("#loginstatu").attr("value");
		  		if(loginstatu.length > 1){
		  			alert("登录状态丢失，请重新登录。");
		  			return;
		  		}
		  		var tiplogin = $("#tiplogin").attr("value");
		  		if(tiplogin.length > 1){
		  			alert(tiplogin);
		  		}
		  	})
			if (window != top)
			top.location.href = "${pageContext.request.contextPath}/Brand/gridowner_login.jsp";
			function check(){
				var username = $("#username").attr("value");
				var pw = $("#pw").attr("value");
				if(username == null || username.length <= 0){
					alert("用户名不能为空。")
					return false;
				}
				if(pw == null || pw.length <= 0){
					alert("密码不能为空。")
					return false;
				}
				document.loginform.submit();
			}
		</script><link href="${pageContext.request.contextPath}/Brand/css/login.css" rel="stylesheet" type="text/css" />
</head>

<body>
<input type="hidden" value="<s:property value="tiplogin"/> " id="tiplogin"/>
<input type="hidden" value="<s:property value="loginstatu"/> " id="loginstatu"/>
<div id="middle_bg"></div>
<div id="dekoration"></div>
<div id="login_box5">
	<s:form method="post" action="login_gridowner" id="loginform">
	<div id="login_box1">
	<div class="text">
		<span>用户名</span><input class="text1" name="username" type="text" id="username"/>
	</div>
	<div class="text">
		<span>密&nbsp;&nbsp;码</span><input class="text1" name="pw" type="password" id="pw"/>  
	</div>
	<div id="yes">
	<img src="${pageContext.request.contextPath}/Brand/pic/login_yes.jpg" width="66" height="27" onclick="return check();"/>
	</div>
    </div>
    </s:form>
</div>
</body>
</html>
