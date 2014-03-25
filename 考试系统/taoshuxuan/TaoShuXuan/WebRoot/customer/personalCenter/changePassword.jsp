<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="css/taoshuxuan.css" rel="stylesheet" type="text/css" />
<link href="css/personalInfor.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div  class="main_right">
<div id="breadNav">
	<jsp:include page="breadcrumbNavigation.jsp" />
</div>
  <div class="archives_title">
    <h2>修改密码</h2>
  </div>

    <div id="EditAddress">
      <div class="new_dizhi">
        <table width="100%"  border="0" class="addNewAddr">
          <tbody>
            <tr>
              <td class="lable"> 我的旧密码：</td>
              <td><input type="password" id="oldPassword" maxlength="20" name="oldPassword"></td>
            </tr>
            <tr>
              <td class="lable"> 我的新密码：</td>
              <td><input type="password" id="newPassword" maxlength="20" name="newPassword"></td>
            </tr>
            <tr>
              <td class="lable"> 确定密码：</td>
              <td><input type="password" id="confirmPassword" maxlength="20" name="confirmPassword"></td>
            </tr>
            <tr><td><input type="submit" value="保存新密码"/></td></tr>
          </tbody>
          
        </table>
      </div>
    </div>    

</div>
</body>
</html>
