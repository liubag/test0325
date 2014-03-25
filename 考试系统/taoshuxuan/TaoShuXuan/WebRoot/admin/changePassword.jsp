<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>无标题文档</title>
<link href="<%=request.getContextPath()%>/admin/css/taoshuxuan.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/admin/css/personalInfor.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/admin/js/jquery-1.5.2.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/admin/js/changePassword.js" charset="utf-8"></script>
</head>

<body>
<div  class="main_right">
<div id="breadNav">
	<jsp:include page="breadcrumbNavigation.jsp" />
</div>
  <div class="archives_title">
    <h2>修改密码</h2>
  </div>

      <div class="myForm">
      	<form action="#">
        <table width="100%"  border="0" class="myTable" >
          <tbody>
            <tr>
              <td class="lable"> 我的旧密码：</td>
              <td><input type="password" id="oldPassword" class="required1" name="oldPassword" /></td>
            </tr>
            <tr>
              <td class="lable"> 我的新密码：</td>
              <td><input type="password" id="newPassword" class="required1" name="staff.pw"/></td>
            </tr>
            <tr>
              <td class="lable"> 确定密码：</td>
              <td><input type="password" id="confirmPassword" class="required1" name="confirmPassword"/></td>
            </tr>
            <tr><td colspan="2">
            	<input type="submit" id="send" value="保存新密码"/>
            	<input type="reset" value="重置"/>
            </td></tr>
          </tbody>
          
        </table>
        </form>
      </div> 
</div>
</body>
</html>
