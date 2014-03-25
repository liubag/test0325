<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>网络在线考试后台管理</title>
<link href="<%=request.getContextPath() %>/css/style.css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.5.2.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/admin/js/addTeacher.js" charset="utf-8"></script>
</head>

<body>
<jsp:include page="../public/top.jsp"/>
		<table width="778" border="0" align="center" cellspacing="0" cellpadding="0">
  			<tr>
    			<td width="176" align="center" valign="top" bgcolor="#FFFFFF"><%@ include file="admin_left.jsp"%></td>
    			<td width="602" valign="top" bgcolor="#FFFFFF">
    				<table width="99%" height="487"  border="0" cellpadding="0" cellspacing="0" align="right">
      					<tr>
       						 <td height="30" bgcolor="#EEEEEE" class="tableBorder_thin">
       						 	<table width="100%" border="0" cellspacing="0" cellpadding="0">
           						 	<tr>
              							<td width="78%" class="word_grey">&nbsp;当前位置：<span class="word_darkGrey">网管信息管理 &gt; 新增教师 &gt;&gt;&gt;</span></td>
              							<td align="right"><img src="<%=request.getContextPath() %>/images/m_ico1.gif" width="5" height="9">&nbsp;&nbsp;</td>
              						</tr>
          						</table>
          					</td>
        				</tr>
      					<tr>
        					<td align="center" valign="top">
 								<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  									<tr>
    									<td width="84%">&nbsp;      </td>
									</tr>
								</table> 
							<s:form action="addTeacher.do" method="post">
  								<table width="70%"  border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#D2E3E6" bordercolorlight="#FFFFFF">
  									
   									 <tr>
    									<td align="center" style="padding:5px;">教师工号：</td>
   										<td align="left" width="60%"><input type="text" name="teacher.teacher_id" id="teacher_id" class="required1" size="20"/> </td>     									
    								</tr>
    								<tr>
    									<td align="center" style="padding:5px;">教师名称：</td>
   										<td align="left" width="60%"><input type="text" name="teacher.name" id="name" class="required1" size="20"/> </td>     									
    								</tr>
    								<tr>
    									<td align="center" style="padding:5px;">教师性别：</td>
   										<td align="left" width="60%"><input type="radio" name="teacher.sex" id="man" value="男" checked="checked"/>男 &nbsp; 
   										 <input type="radio" name="teacher.sex" id="weman" value="女"/>女</td>    									
    								</tr>
    								<tr>
    									<td align="right">
    										<input type="submit" class="btn_grey" id="send" value="提交"/>
        									&nbsp;
       										 <input type="reset" class="btn_grey" value="取消"/>
										
    									</td>
    								</tr>
								</table>
							</s:form>
						</td>
					</tr>
				</table>
			</td>
		</tr>
</table>
<jsp:include page="../public/copyright.jsp"/>
</body>
</html>
