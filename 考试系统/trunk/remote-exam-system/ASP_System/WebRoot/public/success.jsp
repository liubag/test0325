<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
<title>错误提示</title>
<link href="<%=request.getContextPath() %>/css/style.css" rel="stylesheet">
<%
	Boolean isChangePassword=session.getAttribute("isChangePassword")==null?null:Boolean.parseBoolean(session.getAttribute("isChangePassword").toString());
 	Boolean isExamOver=request.getParameter("isExamOver")==null?null:Boolean.parseBoolean(request.getParameter("isExamOver"));
 %>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-1.5.2.js"></script>	
<script type="text/javascript">
	$(function(){
		var isChangePassword=<%=isChangePassword%>
		var isExamOver=<%=isExamOver%>
		$("#tip").fadeIn(3000,function(){
			if(isChangePassword!=null && isChangePassword){
				top.location.href = "<%=request.getContextPath()%>/login.jsp";
			}else if(isExamOver!=null && isExamOver){
				top.location.href = "<%=request.getContextPath()%>/student/showExam.do";
			}		
		});
	});
</script>
</head>

<body>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#EEEEEE">
  <tr>
    <td align="center"><table width="350" height="192" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td align="center" background="<%=request.getContextPath() %>/images/error.jpg">&nbsp;&nbsp;<font style="font-size:17;color:red">操作成功:</font> <br><br>
        		<div id="tip" style="font-size:16;display:none;color:red">
        			<s:property value="tip"/>
        		</div>
              <br>
      </tr>
    </table></td>
  </tr>
</table>
<center>
</center>
</body>
</html>
