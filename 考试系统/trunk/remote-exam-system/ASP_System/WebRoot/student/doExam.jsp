<%@ page language="java" import="java.util.*,com.aspsystem.entity.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>网络在线考试</title>
<link href="<%=request.getContextPath() %>/css/style.css" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath() %>/js/jquery-easyui-1.2.1/themes/icon.css"></link>
	<link href="<%=request.getContextPath() %>/js/jquery-easyui-1.2.1/themes/default/easyui.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-1.4.2.min.js"></script>
	<script src="<%=request.getContextPath() %>/js/jquery-easyui-1.2.1/locale/easyui-lang-zh_CN.js" type="text/javascript"></script>
	<script src="<%=request.getContextPath() %>/js/jquery-easyui-1.2.1/jquery.easyui.min.js" type="text/javascript"></script>
</head>
<body>
<%  
	String student=session.getAttribute("studentInfo")==null?null:session.getAttribute("studentInfo").toString();
	List<String> option_l=null;
	Integer page01 = (Integer)request.getAttribute("page");
	Integer hasPages = (Integer)request.getAttribute("hasPages");
	Integer hasQuestions=(Integer)request.getAttribute("hasQuestions");
	String exam_id=(String)request.getAttribute("exam_id");
	List<Questions> ques_l=(List<Questions>)request.getAttribute("question_l");
	int perFolioAmount=(Integer)request.getAttribute("perFolioAmount");
	Boolean isSaveExamSuccess =request.getAttribute("isSaveExamSuccess")==null? false:Boolean.parseBoolean(request.getAttribute("isSaveExamSuccess").toString());
	
	//for(int i=(page01-1)*perFolioAmount;i<page01*perFolioAmount;i++){
	for(Questions ques:ques_l){
        String checkboxvalues[]=null;
        String radiovalue=null;
		if(session.getAttribute(ques.getQues_id())!=null){
			if(ques.getType()==1){
				radiovalue=(String)session.getAttribute(ques.getQues_id());
			}else{
				checkboxvalues=(String[])session.getAttribute(ques.getQues_id());
				for(String cbv:checkboxvalues){
	%>
		<script type="text/javascript">
			$(function(){
				$("input:checkbox[value=<%=cbv%>]").attr("checked","true");
			});
		</script>
	<%					
				}
			}
		}
		
 %>
 	<script type="text/javascript">
 	var type=<%=ques.getType()%>;
 		$(function(){
 			if(type==1){
 				$("input:radio[name=<%=ques.getQues_id()%>][value=<%=radiovalue%>]").attr("checked","checked");
 			}
 		});
 	</script>
 <%
	}
 %>
 <script type="text/javascript">
				var page = <%=page01 %>;
				var hasPages = <%=hasPages%>;
				var isSaveExamSuccess =<%=isSaveExamSuccess%>
				if(isSaveExamSuccess){
					 $.messager.show({
			                title: "操作提示",
			                msg: "保存试卷成功",
			                showType: 'fade',
			                timeout: 2000
					 });
				}
				function justUpPage(){
				//alert("test");
					if(page == hasPages){
						 $.messager.show({
				                title: "操作提示",
				                msg: "已经是最后一页了",
				                showType: 'fade',
				                timeout: 2000
						 });
						 return false;
					}
					document.getElementById("page").value=page+1;
					document.getElementById("form1").submit();
					return false;
				}
				
				function justNextPage(){
					if(page == 0 || page == 1){
						 $.messager.show({
				                title: "操作提示",
				                msg: "已经是第一页了",
				                showType: 'fade',
				                timeout: 2000
						 });
						 return false;
					}
					document.getElementById("page").value=page-1;
					document.getElementById("form1").submit();
					return false;
				}
			</script>

<%@ include file="../public/top.jsp"%>
<form action="doExam.do" id="form1" method="post">
	<table width="778" border="0" align="center" cellspacing="0" cellpadding="0">
  		<tr>
    		<td width="176" align="center" valign="top" bgcolor="#FFFFFF"><%@ include file="exam_left.jsp"%></td>
    		<td width="602" valign="top" bgcolor="#FFFFFF">
    			<table width="99%" height="487"  border="0" cellpadding="0" cellspacing="0" align="right">
      				<tr>
        				<td height="30" bgcolor="#EEEEEE" class="tableBorder_thin">
        					<table width="100%" border="0" cellspacing="0" cellpadding="0">
            					<tr>
              						<td width="78%" class="word_grey">&nbsp;当前位置：<span class="word_darkGrey">在线考试   &gt;&gt;&gt;</span></td>
              						<td align="right"><img src="<%=request.getContextPath() %>/images/m_ico1.gif" width="5" height="9">&nbsp;当前学生：&nbsp;<%=student %></td>
              					</tr>
          					</table>	
          				</td>
        			</tr>
<s:iterator value="question_l" id="question" status="st" >
			<tr>
				<td>
					<strong>第<s:property value="(page-1)*perFolioAmount+(#st.index+1)"/>题</strong> 
					题型:<s:if test="type==1">单选题</s:if>
						<s:elseif test="type==2">多选题</s:elseif>
						<s:else>不定项</s:else>
					分值：2
				</td>
			</tr>
			<tr>
				<td><s:property value="topic"/></td>
			</tr>
			<s:action name="cutOptions" executeResult="false">
				<s:param name="question.ques_id" value="%{ques_id}"></s:param>
			</s:action>
			<s:iterator value="#request.option_l" id="option" status="st1">
				<tr>
					<td>
						<s:if test="type==1"><input type="radio" id="${question.ques_id}" name="${question.ques_id}" value="${option}"/>${option}</s:if>
						<s:else><input type="checkbox" id="${question.ques_id}"  name="${question.ques_id}" value="${option}"/>${option}</s:else>
					</td>
				</tr>
			</s:iterator>
		</s:iterator>
			<tr>
		
			<td align="center"><s:property value="page"/>/<s:property value="hasPages"/>
				<s:url id="url" action="doExam">
			        <s:param name="page"><s:property value="page-1"/></s:param>
			         <s:param name="exam_id" >${exam_id}</s:param>
				</s:url>
				<s:a href="%{url}" onclick="return justNextPage();">上一页</s:a>
			
			
				<s:url id="url" action="doExam">
			        <s:param name="page"><s:property value="page+1"/></s:param>
			         <s:param name="exam_id" >${exam_id}</s:param>
				</s:url>
				<s:a href="%{url}" onclick="return justUpPage();">下一页</s:a>
			
			共有<s:property value="hasQuestions"/>条试题
			</td>
			</tr>
			<tr>
				<td>
					<input type="hidden" id="page" name="page" value="${page}">
					<input type="hidden" id="exam_id" name="exam_id" value="${exam_id}">
					<input type="hidden" id="isExamOver" name="isExamOver" value="false">
					<input type="hidden" id="isTimesUp" name="isTimesUp" value="false">
				</td>
			</tr>
					</table>
				</td>
			
	</table>
	</form>
<%@ include file="../public/copyright.jsp"%>
</body>
</html>
