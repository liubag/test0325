<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
	<head>
		<title>网络在线考试――后台管理</title>
		<sx:head extraLocales="en-us,nl-nl,de-de" />
		<link href="<%=request.getContextPath()%>/css/style.css"
			rel="stylesheet">
		<link rel="stylesheet" type="text/css"
			href="<%=request.getContextPath()%>/admin/css/jquery.multiselect.css" />
		<link rel="stylesheet" type="text/css"
			href="<%=request.getContextPath()%>/admin/css/style.css" />
		<link rel="stylesheet" type="text/css"
			href="<%=request.getContextPath()%>/admin/css/prettify.css" />
		<link rel="stylesheet" type="text/css"
			href="<%=request.getContextPath()%>/admin/css/jquery-ui.css" />
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/admin/js/jquery.js"></script>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/admin/js/jquery-ui.min.js"></script>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/admin/js/jquery.multiselect.js"></script>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/admin/js/prettify.js"></script>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/admin/js/addTaoTi.js"></script>
		<script type="text/javascript">
		
	$(function(){

	$("#test-1").multiselect({
		show: ["bounce", 200],
		hide: ["explode", 1000]
	});
	

});
</script>
	</head>
	<body>
	<%String account = (String) session.getAttribute("adminInfo"); %>
		<%@ include file="../public/top.jsp"%>
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
											<span class="word_darkGrey">套题信息管理 &gt; 添加套题信息
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
								<!--  <s:action name="getAllCourse" executeResult="false" />
								<s:action name="getAllTeacher" executeResult="false" />
								<s:action name="gainMyClass" executeResult="false" />
							-->
								<s:form action="addExam.do" method="post">
									
									<table width="63%" border="0" cellpadding="0" cellspacing="0"
										bordercolor="#FFFFFF">

										<tr align="center">
											<td width="27%" height="30" align="left"
												style="padding: 5px;">
												试题名称：
											</td>
											<td width="73%" align="left">
												<input type="text" name="exam.exam_name" class="required1"
													id="exam_name" style="width: 120px;" />
											</td>
										</tr>

										<tr>
											<td align="left" style="padding: 5px;">
												考试科目：
											</td>
											<td>
												<s:select list="#request.allCourse_l" name="course_id"
													cssClass="required1" id="course_id" listValue="course_name"
													listKey="course_id" headerKey="0" headerValue="--请选择科目--" />
											</td>
										</tr>

										<tr>
											<td align="left" style="padding: 5px;">
												考试班级：
											</td>
											<td>
												<s:select list="#request.allMyClass_l" name="class_id"
													cssClass="required1" id="test-1" multiple="multiple"
													listValue="class_name" listKey="class_id" />
											</td>
											<td>
												<input type="hidden" class="hid" name="exam.class_id" />
											</td>
										</tr>

										<tr>
											<td align="left" style="padding: 5px;">
												负责老师：
											</td>
											<td>
												<s:select list="#request.allTeacher_l" name="teacher_id"
													cssClass="required1" id="teacher_id" listValue="name"
													listKey="teacher_id" headerKey="0" headerValue="--请选择老师--" />
											</td>
										</tr>

										<tr>
											<td align="left" style="padding: 5px;">
												考试题目：
											</td>
											<td>
												<span id="all"></span>
											</td>

										</tr>
										<tr>
											<td align="left" style="padding: 5px;">
											</td>
											<td>
												单选题
												<input type="text" name="singleNumber" id="single"
													class="required1" style="width: 50px;" />
											</td>
										</tr>
										<tr>
											<td align="left" style="padding: 5px;">
											</td>
											<td>
												多选题
												<input type="text" name="manyNumber" id="many"
													class="required1" style="width: 50px;" />
											</td>
										</tr>
										<tr>
											<td align="left" style="padding: 5px;">
											</td>
											<td>
												不定选
												<input type="text" name="uncertainNumber" id="uncertain"
													class="required1" style="width: 50px;" />
										</tr>

										<tr>
											<td align="left" style="padding: 5px;">
												开考日期：
											</td>
											<td>
												<sx:datetimepicker name="begin_date" id="begin_date"
													cssClass="required1 begin_date" toggleType="wipe" toggleDuration="400"
													displayFormat="yyyy-MM-dd" />
											</td>
										</tr>
										<tr>
											<td align="left" style="padding: 5px;">
												开考时间：
											</td>
											<td>
												<sx:datetimepicker name="begin_time" id="begin_time"
													cssClass="required1 begin_time" type="time" language="en_US"
													displayFormat="HH:mm:ss" />
											</td>
										</tr>
										<tr>
											<td align="left" style="padding: 5px;">
												考试时长：
											</td>
											<td>
												<input type="text" name="exam.exam_time" id="time"
													class="required1" style="width: 30px;" />
												分钟
											</td>
										</tr>
										<tr>
											<td height="65" align="left" style="padding: 5px;">
												&nbsp;
											</td>
											<td>
												<input type="submit" id="submit" value="保存" />
												&nbsp;
												<input type="reset" value="取消" />
												&nbsp;
												<input type="button" value="返回"
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
