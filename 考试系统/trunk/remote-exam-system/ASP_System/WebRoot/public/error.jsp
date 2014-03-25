<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
<title>错误提示</title>
<link href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-1.5.2.js"></script>
<script type="text/javascript">
	$(function(){
		$("#tip").fadeIn(3000,function(){
			history.go(-1);
		});
	});
</script>
</head>

<body>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#EEEEEE">
  <tr>
    <td align="center"><table width="350" height="192" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td align="center" background="<%=request.getContextPath()%>/images/error.jpg">&nbsp;&nbsp;<font style="font-size:16;color:red">错误提示信息:</font> <br><br>
        <div id="tip" style="font-size:16;display:none;color:red">
        		<s:property value="tip"/>
        </div>                         
      </tr>
    </table></td>
  </tr>
</table>
<center>
</center>
</body>
</html>
