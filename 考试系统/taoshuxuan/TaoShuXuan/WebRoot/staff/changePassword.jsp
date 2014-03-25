<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>无标题文档</title>

<link rel="stylesheet" href="<%=request.getContextPath()%>/staff/css/main.css" type="text/css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/staff/css/staff_personalInfo.css" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/staff/js/jquery-1.5.2.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/staff/js/changePassword.js" charset="utf-8"></script>
</head>

<body>
<div id="breadNav">
	<jsp:include page="breadcrumbNavigation.jsp" />
</div>
<div  class="main_right">
      <div class="new_password">
      <form action="">
        <table  class="changePassword" >
          <tbody>
          <input type="hidden" id="staff_id" value="staff_id"/>
            <tr>
              <td class="lable"> 我的旧密码：</td>
              <td><input  type="password" id="oldPassword" maxlength="20" class="required1" name="oldPassword"/></td>
            </tr>
            <tr>
              <td class="lable"> 我的新密码：</td>
              <td>
              	<input type="password" id="newPassword" maxlength="20" class="required1" name="newPassword"/>
              </td>
            </tr>
            <tr>
              <td class="lable"> 确定密码：</td>
              <td><input type="password" id="confirmPassword" maxlength="20" class="required1" name="confirmPassword"/></td>
            </tr>
            <tr><td colspan="2"><input id="send" type="submit" value="保存新密码"/></td></tr>
          </tbody>
        </table>
        </form>
      </div> 
</div>
</body>
</html>
