<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>网络在线考试――后台管理</title>
		<link href="<%=request.getContextPath()%>/css/style.css"
			rel="stylesheet">
		<%
			Integer page01 = (Integer) request.getAttribute("page");
			Integer hasPages = (Integer) request.getAttribute("hasPages");
			Long hasTeacher = (Long) request.getAttribute("hasTeacher");
			pageContext.setAttribute("contextpath", request.getContextPath());
			String account = (String) session.getAttribute("adminInfo");
		%>
		<script language="javascript">
		var page = <%=page01%>;
		var hasPages = <%=hasPages%>;
		function justUpPage(){
			if(page == hasPages){
				 alert("已经是最后一页了！");
				 return false;
			}	 
		}
		
		function justNextPage(){
			if(page == 0 || page == 1){
				 alert("已经是第一页了！");
				 return false;
			}	 
		}
		function test(select){
	  		top.location.href = "showTeacher_by_page.do?page="+select.value ;
	  	}
	  	
		
		function checkAll2(){
 			var checkBox=document.getElementById("checkAll");
			var checkBoxAll=document.getElementsByTagName("input");
			for(var i = 0 ; i < checkBoxAll.length ; i++){
 				if(checkBoxAll[i].type == "checkbox"){
					checkBoxAll[i].checked = checkBox.checked;
 				}
 			}
 			
 		}
 		
		function dele2(){
		
			var checkBoxAll=document.getElementsByName("checkbox");
			var str="";
			for(var i = 0 ; i < checkBoxAll.length ; i++){
 				if(checkBoxAll[i].checked== true){
					str = str + checkBoxAll[i].value+ "," ;
 				}
 			}
 			if(str==""){
 				alert("请选择要删除的老师记录？？");
 			}else if(confirm("你是否确定要删除吗？")){
 				top.location.href = "deletTeacher.do?idArray="+str ;
 				
 			}else{
 				alert("好的,你的选择是明确的！！");
 			}
				
		}
		
		function Caution(){
			if(!confirm("你删除这些班级,也会删除这些班级的学生.你还要删除吗？")){
				return false;
			}
		}
</script>

	</head>
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
											<span class="word_darkGrey">教师信息管理 &gt;&gt;&gt;</span>
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
								<s:form>
								<p align="left"><a href="<%=request.getContextPath() %>/admin/admin_teacherAdd.jsp" >新增教师</a></p>			
									<table width="96%" border="1" cellpadding="0" cellspacing="0"
										bordercolor="#FFFFFF" bordercolordark="#FFFFFF"
										bordercolorlight="#67A8DB">
										<tr align="center" bgcolor="#A8D8FC">
											<th width="5%" height="22" bgcolor="#B2D6F1"></th>
											<th width="19%" height="26" bgcolor="#B2D6F1">
												教师工号
											</th>
											<th width="10%" bgcolor="#B2D6F1">
												教师姓名
											</th>
											<th width="7%" bgcolor="#B2D6F1">
												性别
											</th>
											<th width="20%" bgcolor="#B2D6F1">
												操作
											</th>
										</tr>
										<s:iterator value="Teacher_l" status="st">
											<tr>
												<td width="5%">
													<input name="checkbox" type="checkbox"
														value="<s:property value="teacher_id"/>" />
												</td>
												<td width="19%">
													<s:property value="teacher_id" />
												</td>
												<td width="10%">
													<s:property value="name" />
												</td>
												<td width="7%">
													<s:property value="sex" />
												</td>
												<td width="38%">		  				 
													<s:url id="url" action="delTeacher.do">
														<s:param name="teacher.teacher_id">
															<s:property value="teacher_id" />
														</s:param>
													</s:url>
													<s:a href="%{url}" onclick="return Caution();">删除 </s:a>
												</td>
											</tr>
										</s:iterator>


									</table>
									<table id="table2">
										<tr>
											<td width="5%"><%=page01%>/<%=hasPages%></td>
											<td width="10%">
												<a href="showTeacher_by_page.do?page=1"
													onclick="return justNextPage();">第一页</a>
											</td>
											<td width="10%">
												<a href="showTeacher_by_page.do?page=<%=page01 - 1%>"
													onclick="return justNextPage();">上一页</a>

											</td>
											<td width="10%">
												<a href="showTeacher_by_page.do?page=<%=page01 + 1%>"
													onclick="return justUpPage()">下一页</a>
											</td>
											<td width="10%">
												<a href="showTeacher_by_page.do?page=<%=hasPages%>"
													onclick="return justUpPage()">最后一页</a>
											</td>
											<td width="10%">

												跳转
												<s:select list="page_l" name="page" onchange="test(this);" />
											</td>
											<td width="10%">
												共有<%=hasTeacher%>条记录
											</td>
										</tr>
									</table>
									<table width="94%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td width="60%" height="24">
												&nbsp;
											</td>
											<td width="40%" align="right">
												<input name="" type="checkbox" id="checkAll"
													onclick="checkAll2();" />
												[全选/反选]
												<a style="color: red; cursor: hand;" id="delAll">[删除]</a>
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
