<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@taglib uri="http://tag.forever.org/jsp/tagutil/sitemap" prefix="tagUtil" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>网络在线考试――后台管理</title>
<link href="<%=request.getContextPath() %>/css/style.css" rel="stylesheet">
</head>
<body>
<% 
	String account=(String)session.getAttribute("adminInfo"); 	
%>
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
             					 <td width="70%" class="word_grey">&nbsp;当前位置：<span class="word_darkGrey"><tagUtil:siteMap/></span></td>
              					 <td width="20%"><img src="<%=request.getContextPath() %>/images/m_ico1.gif" width="5" height="9">当前管理员:&nbsp;<%=account %>&nbsp;</td>
              					 <td width="10%"align="right"><a href="adminLogout.do">安全退出</a></td>
              					</tr>
         					</table>
         				</td>
        			</tr>
      				<tr>
        				<td align="center" valign="top">
							本月是考试月，4月份考java认证，6月份考六级，9月份考研班报名，下半年参加实习。
					</td>
      		</tr>
      		
      		</table>
    </td>
  </tr>
</table>
<jsp:include page="../public/copyright.jsp"/>
</body>
</html>
