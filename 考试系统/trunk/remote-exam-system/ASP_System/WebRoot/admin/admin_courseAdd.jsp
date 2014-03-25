<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>网络在线考试后台管理</title>
<link href="<%=request.getContextPath() %>/css/style.css" rel="stylesheet">
<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/jquery-1.5.2.js"></script>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/admin/js/addCourse.js"
			charset="utf-8"></script>
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
              							<td width="78%" class="word_grey">&nbsp;当前位置：<span class="word_darkGrey">网管信息管理 &gt; 新增科目 &gt;&gt;&gt;</span></td>
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
							<s:form action="addCourse.do" method="post">
  								<table width="80%"  border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#D2E3E6" bordercolorlight="#FFFFFF">
  									
   									 <tr>
    									<td align="left" style="padding:5px;">科目名称：</td>
   										<td width="70%"><input type="text" name="course.course_name" id="course_name" class="required1" size="20"/>      									
    								</tr>
    				
    								<tr>
      									<td height="65" align="left" style="padding:5px;">&nbsp;</td>
      									<td><input type="submit" class="btn_grey" id="send" value="保存"/>
        									&nbsp;
       										 <input type="reset" class="btn_grey" value="取消"/>
											 &nbsp;
											<input type="button" class="btn_grey" value="返回" onclick="window.location.href='javascript:history.back(-1)'" />
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
