<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>网络在线考试――后台管理</title>

<link href="<%=request.getContextPath() %>/css/style.css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-1.5.2.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/admin/js/findMyClass.js" charset="utf-8"></script>
  <% 
		Integer page01 = (Integer)request.getAttribute("page");
		Integer hasPages = (Integer)request.getAttribute("hasPages");
		Long hasGrade = (Long)request.getAttribute("hasGrade"); 
		pageContext.setAttribute("contextpath",request.getContextPath());
		String account=(String)session.getAttribute("adminInfo");
	 %>
	<script language="javascript">
		var page = <%=page01 %>;
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
	  		top.location.href = "showGrade_by_page.do?page="+select.value ;
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
<%@ include file="../public/top.jsp"%>
	<table width="778" border="0" align="center" cellspacing="0" cellpadding="0">
  		<tr>
    		<td width="176" align="center" valign="top" bgcolor="#FFFFFF"><%@ include file="student_left.jsp"%></td>
    		<td width="602" valign="top" bgcolor="#FFFFFF">
    			<table width="99%" height="487"  border="0" cellpadding="0" cellspacing="0" align="right">
      				<tr>
        				<td height="30" bgcolor="#EEEEEE" class="tableBorder_thin">
        					<table width="100%" border="0" cellspacing="0" cellpadding="0">
            					<tr>
              						<td width="78%" class="word_grey">&nbsp;当前位置：<span class="word_darkGrey">考生成绩查询  &gt;&gt;&gt;</span></td>
              						<td align="right"><img src="<%=request.getContextPath() %>/images/m_ico1.gif" width="5" height="9">&nbsp;当前学生：${studentInfo}&nbsp;</td>
              					</tr>
          					</table>	
          				</td>
        			</tr>
      				<tr>
      					<tr>
        					<td align="center" valign="top">
        						<table width="100%" height="40" border="0" cellpadding="0" cellspacing="0">

        						</table>
				
								<table width="98%"  border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#FFFFFF" bordercolorlight="#67A8DB">
  									<tr align="center">
    									<td width="20%" height="27" bgcolor="#B2D6F1">考试名称</td>
										<td width="20%" bgcolor="#B2D6F1">考试课程</td>
										<td width="20%" bgcolor="#B2D6F1">分数</td>
										<td width="20%" bgcolor="#B2D6F1">班级排名</td>
										<td width="20%" bgcolor="#B2D6F1">年级排名<br></td>
  									</tr>
  									
  								<s:iterator value="Grade_l" status="st">
							  		<tr>
							  			<td width="20%"><s:property value="exam.exam_name"/></td>
							  			<td width="20%" ><s:property value="exam.course.course_name"/></td>
							  			<td width="20%" ><s:property value="grade"/></td>
							  			<td width="20%" ><s:property value="%{rank_in_class_l[#st.index]}"/></td>
							  			<td width="20%" ><s:property value="%{rank_in_grade_l[#st.index]}"/></td>
							  		</tr>
							  	</s:iterator>
	 							</table>
	 							
	 							<table id="table2">
									<tr>
										<td width="5%"><%=page01 %>/<%=hasPages %></td>
										<td width="10%">
											<a href="showGrade_by_page.do?page=1" onclick="return justNextPage();" >第一页</a>
										</td >
										<td width="10%">
											<a href="showGrade_by_page.do?page=<%=page01-1 %>" onclick="return justNextPage();" >上一页</a>
										
										</td>
										<td width="10%">
											<a href="showGrade_by_page.do?page=<%=page01+1 %>" onclick="return justUpPage()" >下一页</a>				
										</td>
										<td width="10%">
											<a href="showGrade_by_page.do?page=<%=hasPages %>" onclick="return justUpPage()" >最后一页</a>
										</td>
										<td width="10%">
									
											跳转<s:select list="page_l" name="page" onchange="test(this);"/>
										</td>
										<td width="10%">
										共有<%=hasGrade %>条记录
										</td>
									</tr>
								</table>	
						
							</td>
						</tr>
					</table>
				</td>
			</tr>
</table>
<%@ include file="../public/copyright.jsp"%>
</body>
</html>
