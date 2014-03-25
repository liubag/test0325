<%@ page language="java" import="java.util.*,com.aspsystem.util.StringUtil" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@include file="../public/common.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>网络在线考试――后台管理</title>
<script type="text/javascript" src="<%=request.getContextPath() %>/student/js/changePW.js"></script>

</head>
<%
	String stu_id=session.getAttribute("student_permission")==null?null:StringUtil.cutOutId((String)session.getAttribute("student_permission"));
 %>
<body>
<%@ include file="../public/top.jsp"%>
		<table width="778" border="0" align="center" cellspacing="0" cellpadding="0">
  			<tr>
    			<td width="176" align="center" valign="top" bgcolor="#FFFFFF"><%@ include file="student_left.jsp"%></td>
    			<td width="602" valign="top" bgcolor="#FFFFFF">
    				<table width="99%" height="487"  border="0" cellpadding="0" cellspacing="0" align="right">
      					<tr>
       						 <td height="30" bgcolor="#EEEEEE" class="tableBorder_thin">
       						 	<table width="100%" border="0" cellspacing="0" cellpadding="0">
           						 	<tr>
              							<td width="78%" class="word_grey">&nbsp;当前位置：<span class="word_darkGrey">学生信息管理 &gt; 修改学生密码 &gt;&gt;&gt;</span></td>
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
<s:form action="studentChangePassword" method="post">
  								<table width="63%"  border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#D2E3E6" bordercolorlight="#FFFFFF">
  									<tr align="center">
    									<td width="73%" align="left"><input type="hidden" name="student.stu_id" value="<%=stu_id %>" size="30">
     									</td>
	         						</tr>
   									 <tr>
    									<td align="left" style="padding:5px;">原密码：</td>
   										<td align="left"><input type="password" name="student.pw" id="oldpw" size="30"/>
    								</tr>
    								<tr>
      									<td align="left" style="padding:5px;">新密码：</td>
      									<td align="left"><input type="password" name="pw" id="newpw"  size="30"></td>
    								</tr>
    								<tr>
      									<td align="left" style="padding:5px;">确认新密码：</td>
      									<td align="left"><input type="password"  name="confirmednewpw" id="confirmednewpw" size="30"/></td>
    								</tr>
    								<tr>
      									<td height="65" align="left" style="padding:5px;">&nbsp;</td>
      									<td><input type="submit" Class="btn_grey" value="保存"/>
        									&nbsp;
       										 <input type="reset" Class="btn_grey" value="取消"/>
											 &nbsp;
											<input type="button" Class="btn_grey" value="返回" onclick="window.location.href='manager.do?action=managerQuery'"/>
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
<%@ include file="../public/copyright.jsp"%>
</body>
</html>
