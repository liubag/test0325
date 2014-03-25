<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="${pageContext.request.contextPath}/ScatteredGrid/css/css.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/ScatteredGrid/css/style.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/ScatteredGrid/css/dvi.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/ScatteredGrid/js/jquery-1.5.1.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/ScatteredGrid/js/manageupdatelogininfopage.js" type="text/javascript"></script>
</head>

<body>
  	<div style="color: red; text-align: center; margin-bottom: 20px;"><s:property value="tip"/></div>
	 <s:form method="post" action="updateUserName" autocomplete="off">
		<div class="int">
			<label for="username">新用户名：</label>
			<input type="text" name="username" value="" id="username" class="required" onkeyup="usernamekeyup();"/>
		</div>
		<div class="int">
			<label for="pw">密码：</label>
			<input type="password" name="oldPw" value="" id="oldPw1" class="required"/>
		</div>
		<div class="sub">
			<input type="submit" value="确定修改" id="send"/><input type="reset" id="res"/>
		</div>
	</s:form>
	<br/>
	<br/>
	<s:property value="tipPw"/>
	<s:form method="post" action="updataUserPw" autocomplete="off">
		<div class="int">
		<label for="oldPw"> 旧密码：</label>
		<input type="password" name="oldPw" id="oldPw" class="required2" />
		</div>
		<div class="int">
			<label for="newpw">新密码：</label>
			<input type="password" name="newPw" id="newPw" class="required2" />
		</div>
		<div class="int">
			<label for="againPw">确认密码：</label>
			<input type="password" name="againPw" id="againPw" class="required2" />
		</div>
		<div class="sub">
			<input type="submit" value="确定修改 " id="send2"/><input type="reset" id="res2"/>
		</div>
	 </s:form>
</body>
</html>