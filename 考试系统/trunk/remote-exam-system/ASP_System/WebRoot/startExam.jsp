<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">


<html>
<head>
<title>网络在线考试</title>
<link href="css/style.css" rel="stylesheet">
</head>
<body>

	<table width="778" border="0" align="center" cellpadding="0" cellspacing="0">
  		<tr>
    		<td height="131" background="images/top_bg.jpg">&nbsp;</td>
  	   </tr>
	</table>
	<table width="778" border="0" align="center" cellspacing="0" cellpadding="0">
  		<tr>
    		<td valign="top" bgcolor="#FFFFFF">
    		<table width="774" height="487"  border="0" cellpadding="0" cellspacing="0" align="right">
      			<tr>
       				 <td height="30" bgcolor="#EEEEEE" class="tableBorder_thin">
       				 	<table width="100%" border="0" cellspacing="0" cellpadding="0">
            				<tr>
              					<td width="76%" class="word_grey">&nbsp;<img src="Images/f_ico.gif" width="8" height="8"> 当前位置：→ <span class="word_darkGrey">在线考试 → 选择课程 &gt;&gt;&gt;</span></td>
			  					<td width="24%" align="right"><img src="images/m_ico1.gif" width="5" height="9">
			   					 <a href="" >返回首页</a>&nbsp;</td>
              				</tr>
          				</table>
          			</td>
       			 </tr>
      			<tr>
       				 <td align="center" valign="top">
<s:form action="" method="post" onsubmit="return checkForm(lessonForm)">
 						<table width="100%" height="211"  border="0" cellpadding="0" cellspacing="0">
  							<tr>
    							<td height="39" colspan="3" align="center" class="word_orange1">&nbsp;</td>
							</tr>
  							<tr>
    							<td width="12%">&nbsp;</td>
    							<td width="77%" align="center" valign="top">准备好了吗？考生单击“开始考试”按钮，系统将立即记录本次考试并登记考试成绩！</td>
    							<td width="11%">&nbsp;</td>
							 </tr>
  							<tr>
   								 <td>&nbsp;</td>
   								 <td align="center" valign="top">
   								 	<input type="button" styleClass="btn_grey" value="开始考试"/>	
									<input type="button" styleClass="btn_grey" value="返回" onclick="history.back(-1)"/>
								</td>
    							<td>&nbsp;</td>
  							</tr>
					</table> 
</s:form>
        			</td>
        		</tr>
        	</table>
        </td>
     </tr>
</table>
<%@ include file="public/copyright.jsp"%>
</body>
</html>
