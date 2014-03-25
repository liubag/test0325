<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>网络在线考试――后台管理</title>
		<link href="<%=request.getContextPath()%>/css/style.css"
			rel="stylesheet">
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/jquery-1.5.2.js"></script>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/admin/js/addLuTi.js"></script>
	</head>
	<%
		String ques_id = (String) request.getParameter("ques_id");
		String account=(String)session.getAttribute("adminInfo");
	%>
	<body>
		<jsp:include page="../public/top.jsp" />
		<table width="778" border="0" align="center" cellspacing="0"
			cellpadding="0">
			<tr>
				<td width="176" align="center" valign="top" bgcolor="#FFFFFF"><%@ include
						file="admin_left.jsp"%></td>
				<td width="602" valign="top" bgcolor="#FFFFFF">
					<table width="99%" height="487" border="0" cellpadding="0"
						cellspacing="0" align="right">
						<tr>
							<td height="30" bgcolor="#EEEEEE" class="tableBorder_thin">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="70%" class="word_grey">
											&nbsp;当前位置：
											<span class="word_darkGrey">考试题目管理 &gt; 修改考试题目
												&gt;&gt;&gt;</span>
										</td>
										<td width="20%">
											<img src="<%=request.getContextPath()%>/images/m_ico1.gif"
												width="5" height="9">
											当前管理员:&nbsp;<%=account%>&nbsp;
										</td>
										<td width="10%" align="right">
											<a href="adminLogout.do">安全退出</a>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td align="center" valign="top">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="84%">
											&nbsp;
										</td>
									</tr>
								</table>

								<s:action name="findQuestions" executeResult="false">
									<s:param name="questions.ques_id"><%=ques_id%></s:param>
								</s:action>
							<!--  <s:action name="getAllCourse" executeResult="false" />
								<s:action name="getAllTeacher" executeResult="false" />
							-->	
								<s:form action="updateQuestions.do" method="post">
									<table width="85%" border="0" cellpadding="0" cellspacing="0"
										bordercolor="#FFFFFF">
										<tr><td><input type="hidden" name="questions.ques_id" value="<%=ques_id %>"/></td></tr>
										<tr>
											
											<td height="30" align="left" style="padding: 5px;">
												所属科目：
											</td>
											<td align="left">
												<input name="course_id" value="${questions.course.course_name}" disabled="disabled">
										<!-- 	<s:select list="#request.allCourse_l" name="course_id"
													id="select" listValue="course_name" listKey="course_id"
													headerKey="%{#request.questions.course.course_id}"
													headerValue="%{#request.questions.course.course_name}"></s:select>
										 -->	
											</td>
										</tr>

										<tr>
											<td height="30" align="left" style="padding: 5px;">
												出题老师：
											</td>
											<td align="left">
												<input name="teacher_id" value="${questions.teacher.name}" disabled="disabled">
											<!-- 	<s:select list="#request.allTeacher_l" name="teacher_id"
													id="select" listValue="name" listKey="teacher_id"
													headerKey="%{#request.questions.teacher.teacher_id}"
													headerValue="%{#request.questions.teacher.name}" />
											 -->
											</td>
										</tr>

										<tr align="center">
											<td width="15%" height="30" align="left"
												style="padding: 5px;">
												考试题目：
											</td>
											<td width="85%" align="left">
												<textarea name="questions.topic" rows="2" cols="20" id="topic" class="required1">${questions.topic }</textarea>

											</td>
										</tr>
										<tr>
											<td height="30" align="left" style="padding: 5px;">
												试题类型：
											</td>
											<td align="left">
												<select name="questions.type" id="type" class="required1">											
													<option value="1">
														单选题
													</option>
													<option value="2">
														多选题
													</option>
													<option value="3">
														不定选
													</option>
												</select>
											</td>
										</tr>
										<tr align="center">
											<td width="15%" height="30" align="left"
												style="padding: 5px;">
												选项：
											</td>
											<td width="85%" align="left">
												<textarea name="questions.options" rows="3" cols="20" class="required1" id="options">${questions.options}</textarea>
											</td>
										</tr>

										<tr align="center">
											<td width="15%" height="30" align="left"
												style="padding: 5px;">
												正确答案：
											</td>
											<td width="85%" align="left" id="sOption">
												<input name="questions.answer" id="answer"
													value="${questions.answer}" class="required1"/>
											</td>

										</tr>

										<tr align="center">
											<td width="15%" height="30" align="left"
												style="padding: 5px;">
												答案解析：
											</td>
											<td width="85%" align="left">
												<textarea name="questions.analysis" rows="3" cols="20" id="analysis" class="required1">${questions.analysis}</textarea>
											</td>
										</tr>
										<tr>
											<td height="65" align="left" style="padding: 5px;">
												&nbsp;
											</td>
											<td>
												<input type="submit" name="submit" id="submit" value="保存" />
												&nbsp;
												<input type="reset" name="reset" value="取消" />
												&nbsp;
												<input type="button" name="button" value="返回"
													onclick="window.location.href='javascript:history.back(-1)'" />
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
		<jsp:include page="../public/copyright.jsp" />
	</body>
</html>
