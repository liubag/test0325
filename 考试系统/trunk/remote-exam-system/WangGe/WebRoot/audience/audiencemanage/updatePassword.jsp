<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>修改登录密码</title>
     <script src="${pageContext.request.contextPath}/audience/js/jquery-1.6.4.min.js" type="text/javascript"></script>
      <script src="${pageContext.request.contextPath}/audience/js/updatePassword.js" type="text/javascript"></script>
      
    <link href="${pageContext.request.contextPath}/audience/css/updatePassword.css" rel="stylesheet" type="text/css" />
  </head>
   
  <body>
  <s:form id="form2" autocomplete="off" method="post" action="/updatePw_audience.do">
<table cellspacing="0">
  <tr>
    <td class="td5">旧密码&nbsp;：</td>
    <td class="td6">
	<label>
      <input type="password" name="oldPw" id="oldPw" class="required input1" />
    </label>
	</td>
  </tr>
  <tr>
    <td class="td5">新密码&nbsp;：</td>
    <td class="td6">
	<label>
      <input type="password" name="newPw" id="newPw"  class="required input1"/>
    </label>
	</td>
  </tr>
  <tr>
    <td class="td5">确认密码&nbsp;：</td>
    <td class="td6">
	<label>
      <input type="password" id="repw" class="required input1"/>
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
</html>
