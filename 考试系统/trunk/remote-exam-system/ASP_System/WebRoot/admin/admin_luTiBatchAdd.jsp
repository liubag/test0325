<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>网络在线考试――后台管理</title>
<link href="<%=request.getContextPath() %>/css/style.css" rel="stylesheet">
<script language="javascript" src="../js/AjaxRequest.js">
</script>
</head>
	<body >
		<%@ include file="../public/top.jsp"%>
		<table width="778" border="0" align="center" cellspacing="0" cellpadding="0">
  			<tr>
    			<td width="176" align="center" valign="top" bgcolor="#FFFFFF"><%@ include file="admin_left.jsp"%></td>
    				<td width="602" valign="top" bgcolor="#FFFFFF"><table width="99%" height="487"  border="0" cellpadding="0" cellspacing="0" align="right">
      					<tr>
        					<td height="30" bgcolor="#EEEEEE" class="tableBorder_thin">
        						<table width="100%" border="0" cellspacing="0" cellpadding="0">
            						<tr>
              							<td width="78%" class="word_grey">&nbsp;当前位置：<span class="word_darkGrey">考试题目管理 &gt; 批量添加考试题目 &gt;&gt;&gt;</span></td>
              							<td align="right"><img src="<%=request.getContextPath() %>/images/m_ico1.gif" width="5" height="9">&nbsp;当前管理员：&nbsp;</td>
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
			 <s:form action="uploadQuestions" method="POST" enctype="multipart/form-data">
     			<s:file name="upload" label="文件名"/>
    			<s:submit value="上传"/>
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
