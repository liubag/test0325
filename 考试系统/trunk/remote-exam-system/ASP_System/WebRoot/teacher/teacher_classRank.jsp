<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>网络在线考试</title>
<link href="<%=request.getContextPath() %>/css/style.css" rel="stylesheet">
</head>
<body>
<% 
	String exam_id=(String)request.getParameter("exam_id");
	String account = (String) session.getAttribute("teacherInfo"); 
%>
<%@ include file="../public/top.jsp"%>
	<table width="778" border="0" align="center" cellspacing="0" cellpadding="0">
  		<tr>
    		<td width="176" align="center" valign="top" bgcolor="#FFFFFF"><%@ include file="teacher_left.jsp"%></td>
    		<td width="602" valign="top" bgcolor="#FFFFFF">
    			<table width="99%" height="487"  border="0" cellpadding="0" cellspacing="0" align="right">
      				<tr>
        				<td height="30" bgcolor="#EEEEEE" class="tableBorder_thin">
        					<table width="100%" border="0" cellspacing="0" cellpadding="0">
            					<tr>
              						<td width="78%" class="word_grey">&nbsp;当前位置：<span class="word_darkGrey">查看成绩   &gt;&gt;&gt;</span></td>
              						<td align="right"><img src="<%=request.getContextPath() %>/images/m_ico1.gif" width="5" height="9">&nbsp;当前教师：<%=account %></td>
              					</tr>
          					</table>	
          				</td>
        			</tr>
      				<tr>
							<td  valign="top">								
								<s:form>
									<table width="96%"  border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" >
																										
										<tr align="center" bgcolor="#A8D8FC">
						
											<th width="10%" height="20" bgcolor="#B2D6F1">
												排名
											</th>
											<th width="20%" bgcolor="#B2D6F1">
												班级名称
											</th>
											<th width="20%" bgcolor="#B2D6F1">
												考试名称
											</th>
											<th width="20%" bgcolor="#B2D6F1">
												学生人数
											</th>
											<th width="10%" bgcolor="#B2D6F1">
												平均分
											</th>
											<th width="10%" bgcolor="#B2D6F1">
												操作
											</th>
										</tr>
									
										<s:iterator value="classRank_l" status="st">
											<tr>
												<td width="10%">
													<s:property value="rank" />
												</td>
												<td width="25%">
													<s:property value="myclass.getClass_name()" />
												</td>
												<td width="25%">
													<s:property value="exam.getExam_name()" />
												</td>
												<td width="20%">
													<s:property value="stu_num" />
												</td>
												<td width="10%">
													<s:property value="avg_score" />
												</td>
												<td width="10%">
													<a href="studentRank.do?exam_id=<%=exam_id%>&class_id=<s:property value="myclass.getClass_id()" />">查看</a>
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
