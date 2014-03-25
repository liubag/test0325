<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
	<head>
		<title>网络在线考试――后台管理</title>
		<link href="<%=request.getContextPath()%>/css/style.css"
			rel="stylesheet">
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/jquery-1.5.2.js"></script>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/admin/js/delExam.js"
			charset="utf-8"></script>
		<%
			Integer page01 = (Integer) request.getAttribute("page");
			Integer hasPages = (Integer) request.getAttribute("hasPages");
			Integer hasQuestions = (Integer) request.getAttribute("hasQuestions");
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
	  		top.location.href = "showExam_by_page.do?page="+select.value ;
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
											<span class="word_darkGrey">试卷信息管理 &gt;&gt;&gt;</span>
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
								<table width="96%"  border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#FFFFFF" bordercolorlight="#67A8DB">

									<tr align="center">
										<th width="5%" bgcolor="#B2D6F1"></th>
										<td width="20%" height="30" bgcolor="#B2D6F1">
											试卷名称
										</td>
										<td width="20%" bgcolor="#B2D6F1">
											所属科目
										</td>
										<td width="30%" bgcolor="#B2D6F1">
											考试时间
										</td>
										<td width="20%" bgcolor="#B2D6F1">
											操作
										</td>
									</tr>
									<s:iterator value="exam_l" status="st">
										<tr>
											<td width="5%">
												<input name="checkbox" type="checkbox" class="checkDel"
													value="<s:property value="exam_id"/>"  id="<s:property value="begin_time" />"/>

											</td>
											<td width="20%">
												<s:property value="exam_name" />
											</td>
											<td width="20%">
												<s:property value="course.getCourse_name()" />
											</td>
											<td width="30%">
												<s:property value="begin_time" />
											</td>
											<td width="20%">
												<span id="delDive" class="<s:property value="exam_id"/>">
													<a href="#" style="cursor: hand;" id="<s:property value="begin_time" />" class="del" name="<s:property value="exam_name" />">删除 </a> </span>
											</td>
										</tr>
									</s:iterator>
								</table>
								<table id="table2">
									<tr>
										<td width="5%"><%=page01%>/<%=hasPages%></td>
										<td width="10%">
											<a href="showExam_by_page.do?page=1"
												onclick="return justNextPage();">第一页</a>
										</td>
										<td width="10%">
											<a href="showExam_by_page.do?page=<%=page01 - 1%>"
												onclick="return justNextPage();">上一页</a>

										</td>
										<td width="10%">
											<a href="showExam_by_page.do?page=<%=page01 + 1%>"
												onclick="return justUpPage()">下一页</a>
										</td>
										<td width="10%">
											<a href="showExam_by_page.do?page=<%=hasPages%>"
												onclick="return justUpPage()">最后一页</a>
										</td>
										<td width="10%">

											跳转
											<s:select list="page_l" name="page" onchange="test(this);" />
										</td>
										<td width="10%">
											共有<%=hasQuestions%>条记录
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
										</td>
									</tr>
								</table></s:form>
							</td>
						</tr>
					</table>
					
				</td>
			</tr>
		</table>
		<jsp:include page="../public/copyright.jsp" />
	</body>
</html>
