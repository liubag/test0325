<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@taglib uri="http://tag.forever.org/jsp/tagutil/sitemap" prefix="tagUtil" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>网络在线考试</title>
<link href="<%=request.getContextPath() %>/css/style.css" rel="stylesheet">
</head>
<body>
<%@ include file="../public/top.jsp"%>
<%
	String account = (String) session.getAttribute("teacherInfo"); 
 %>
	<table width="778" border="0" align="center" cellspacing="0" cellpadding="0">
  		<tr>
    		<td width="176" align="center" valign="top" bgcolor="#FFFFFF"><%@ include file="teacher_left.jsp"%></td>
    		<td width="602" valign="top" bgcolor="#FFFFFF">
    			<table width="99%" height="487"  border="0" cellpadding="0" cellspacing="0" align="right">
      				<tr>
        				<td height="30" bgcolor="#EEEEEE" class="tableBorder_thin">
        					<table width="100%" border="0" cellspacing="0" cellpadding="0">
            					<tr>
              						<td width="78%" class="word_grey">&nbsp;当前位置：<span class="word_darkGrey"><tagUtil:siteMap/></span></td>
              						<td align="right"><img src="<%=request.getContextPath() %>/images/m_ico1.gif" width="5" height="9">&nbsp;当前教师：<%=account %></td>
              					</tr>
          					</table>	
          				</td>
        			</tr>
      				<tr>
							<td  valign="top">

								<s:form>
									<table width="30%" >
									
										<s:iterator value="exam_l" status="st">
											<tr>
												<td width="20%">
													<a href="<%=request.getContextPath() %>/classRank.do?exam_id=<s:property value="exam_id" />"><s:property value="exam_name" /></a>
												</td>
												<td width="10%">

													 <a href="Download.do?filename=<s:property value="exam_name" />.doc">下载</a>
												</td>
											</tr>
										</s:iterator>
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
