<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>网络在线考试</title>
<link href="<%=request.getContextPath() %>/css/style.css" rel="stylesheet">
<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/jquery-1.5.2.js"></script>
<script type="text/ecmascript">
		$(function(){ 
			$('#filterName').keyup(function(){
				$("table tbody tr .student").hide().filter(":contains('"+$(this).val()+"')").show();	
			}).keyup();
		})
	</script>
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
              						<td width="78%" class="word_grey">&nbsp;当前位置：<span class="word_darkGrey">查看成绩   &gt;&gt;&gt;</span></td>
              						<td align="right"><img src="<%=request.getContextPath() %>/images/m_ico1.gif" width="5" height="9">&nbsp;当前教师：<%=account%></td>
              					</tr>
          					</table>	
          				</td>
        			</tr>
      				<tr>
							<td  valign="top">
								<br>
    							筛选：<input type="text" id="filterName" />   							
  							
								<s:form>
									<table width="98%"  border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#FFFFFF" bordercolorlight="#67A8DB">
																										
										<tr align="center">
						
											<th width="20%" height="20" bgcolor="#B2D6F1">
												学号
											</th>
											<th width="20%" bgcolor="#B2D6F1">
												姓名
											</th>
											<th width="20%" bgcolor="#B2D6F1">
												成绩
											</th>
											<th width="20%" bgcolor="#B2D6F1">
												班级排名
											</th>
											<th width="20%" bgcolor="#B2D6F1">
												年级排名
											</th>										
										</tr>
										<tbody>
										<s:iterator value="Grade_l" status="st">
											<tr class="student">
											<td width="20%"><s:property value="stu.stu_id"/></td>
							  				<td width="20%" ><s:property value="stu.name"/></td>
							  				<td width="20%" ><s:property value="grade"/></td>
							  				<td width="20%" ><s:property value="%{rank_in_class_l[#st.index]}"/></td>
							  				<td width="20%" ><s:property value="%{rank_in_grade_l[#st.index]}"/><br></td>
											</tr>
										</s:iterator>
										</tbody>
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