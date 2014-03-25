<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
<script src="${pageContext.request.contextPath}/Brand/js/jquery-1.6.4.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/Brand/js/xiugaidengluxinxi.js" type="text/javascript"></script>
<link href="${pageContext.request.contextPath}/Brand/css/xiugaidengluxinxi.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div class="top">修改登录信息</div>
<s:form id="form1" autocomplete="off" method="post" action="updataUsername_brandowner2">
<table cellspacing="0">
  <tr>
    <td class="td5">新用户名&nbsp;：</td>
    <td class="td6">
	<label>
      <input type="text" name="username" id="newuser" class="required input1" />
    </label>
	</td>
  </tr>
  <tr>
    <td class="td5">输入密码&nbsp;：</td>
    <td class="td6">
	<label>
      <input type="password" name="pw" id="pw"  class="required input1"/>
    </label>
	</td>
  </tr>
  <tr>
    <td class="td5">&nbsp;</td>
    <td class="td6"><label>
      <input type="submit" name="Submit" value="确定修改" id="yes1" class="anniu" />&nbsp;&nbsp;&nbsp;
	  <input type="reset" name="button" value="重置" id="no1" class="anniu"/>
        </label>
	</td>
  </tr>
</table>
</s:form>

<div class="top"></div>
<s:form id="form2" autocomplete="off" method="post" action="updataPw_brandowner2">
<table cellspacing="0">
  <tr>
    <td class="td5">旧密码&nbsp;：</td>
    <td class="td6">
	<label>
      <input type="password" name="pw" id="ppw" class="required input1" />
    </label>
	</td>
  </tr>
  <tr>
    <td class="td5">新密码&nbsp;：</td>
    <td class="td6">
	<label>
      <input type="password" name="newPw" id="npw"  class="required input1"/>
    </label>
	</td>
  </tr>
  <tr>
    <td class="td5">确认密码&nbsp;：</td>
    <td class="td6">
	<label>
      <input type="password" id="rpw" class="required input1"/>
    </label>
	</td>
  </tr>
  <tr>
    <td class="td5">&nbsp;</td>
    <td class="td6"><label>
      <input type="submit" name="Submit" value="确定修改" id="yes2" class="anniu" />&nbsp;&nbsp;&nbsp;
	  <input type="reset" name="Submit" value="重置" id="no2" class="anniu" />
        </label>
	</td>
  </tr>
</table>
</s:form>

</body>
</html>
