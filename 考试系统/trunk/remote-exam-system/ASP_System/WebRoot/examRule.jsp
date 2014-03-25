<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
<title>网络在线考试</title>
<link href="<%=request.getContextPath() %>/css/style.css" rel="stylesheet">
<script type="text/javascript">
	function doExam(){
		top.location.href="http://localhost:8080/ASP_System/student/doExam.jsp";
	}
</script>
</head>
<body>

	<table width="778" border="0" align="center" cellpadding="0" cellspacing="0">
  		<tr>
    		<td height="131" background="<%=request.getContextPath() %>/images/top_bg.jpg">&nbsp;</td>
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
             				 		<td width="76%" class="word_grey">&nbsp;<img src="<%=request.getContextPath() %>/images/f_ico.gif" width="8" height="8"> 当前位置：→ <span class="word_darkGrey">在线考试 → 考试规则 &gt;&gt;&gt;</span></td>
			  				 		<td width="24%" align="right"><img src="<%=request.getContextPath() %>/images/m_ico1.gif" width="5" height="9">
			    			 		<a href="" >返回首页</a>&nbsp;</td>
              					</tr>
          				    </table>
          			    </td>
        			</tr>
      				<tr>
        				<td align="center" valign="top">
<s:form action="" method="post">
 							<table align="center" width="100%" height="253"  border="0" cellpadding="0" cellspacing="0">
  								<tr>
    								<td height="81" colspan="3" align="center" class="word_orange1">考试规则</td>
								</tr>
								<tr>
    								<td align="center"><strong>考试科目&nbsp;</strong>${exam_course}</td>
  								</tr>
  								<tr>
    								<td align="center"><strong>试卷描述&nbsp;</strong>${exam.exam_name}</td>
  								</tr>
  								<tr>
    								<td align="center"><strong>答题时间&nbsp;</strong>${exam.exam_time}<strong>最短答题时间</strong>5分钟</td>
  								</tr>
  								<tr>
    								<td align="center"><strong>考试开始时间&nbsp;</strong>${exam.begin_time}</td>
  								</tr>
  								<tr>
    								<td align="center"><strong>考试结束时间&nbsp;</strong>${exam.end_time}</td>
  								</tr>
  								<tr>
  									<td align="center"><strong>试卷总分&nbsp;</strong>100</td>
  								</tr>
  								<tr>
    								<td align="center" valign="top"><input type="button" class="btn_grey" value="开始考试" onClick="javascript:doExam()"/></td>
  								</tr>
							</table> 
</s:form>
        				</td>
      				</tr>
    		</table>
    	</td>
    </tr>
</table>
<%@ include file="/public/copyright.jsp"%>
</body>
</html>
