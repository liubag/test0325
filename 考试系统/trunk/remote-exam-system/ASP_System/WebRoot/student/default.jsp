<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>网络在线考试――后台管理</title>
	<link href="<%=request.getContextPath() %>/css/style.css" rel="stylesheet">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/js/jquery-easyui-1.2.1/themes/icon.css"></link>
	<link href="<%=request.getContextPath() %>/js/jquery-easyui-1.2.1/themes/default/easyui.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-1.4.2.min.js"></script>
	<script src="<%=request.getContextPath() %>/js/jquery-easyui-1.2.1/locale/easyui-lang-zh_CN.js" type="text/javascript"></script>
	<script src="<%=request.getContextPath() %>/js/jquery-easyui-1.2.1/jquery.easyui.min.js" type="text/javascript"></script>


<script type="text/javascript">
	$(function(){
		$(".startExam").click(function(){
			var flag=false;
			var exam_id=$(this).attr("id");
			$.ajax({
			  type: "GET",
			  url:"checkIsExamBegin.do?exam_id="+exam_id,
			  dataType: "text",
			  async:false,
			  success: function(data){
			  	if(data=="isBegin"){
			  		flag=true;
			  	}else if(data=="isOver"){
			  		 $.messager.show({
		                title: "操作提示",
		                msg: "考试已经结束！",
		                showType: 'fade',
		                timeout: 3000
           		 });
           			 flag=false;
			  	}else{
			  		 $.messager.show({
		                title: "操作提示",
		                msg: "考试还没开始！",
		                showType: 'fade',
		                timeout: 3000
           		 });
			  		flag=false;
			  	}
			  }
			});
			return flag;
		});
	});
</script>
</head>
<body>
<jsp:include page="../public/top.jsp"/>
		
		<table width="778" border="0" align="center" cellspacing="0" cellpadding="0">
		
  			<tr>
   				 <td width="176" align="center" valign="top" bgcolor="#FFFFFF"><%@ include file="student_left.jsp"%></td>
    			 <td width="602" valign="top" bgcolor="#FFFFFF">
    			 <table width="99%" height="487"  border="0" cellpadding="0" cellspacing="0" align="right">
      				
      				<tr>
       					 <td height="30" bgcolor="#EEEEEE" class="tableBorder_thin">
       					 	<table width="100%" border="0" cellspacing="0" cellpadding="0">
            					<tr>
             					 <td width="65%" class="word_grey">&nbsp;当前位置：<span class="word_darkGrey">在线考试  &gt;&gt;&gt;</span></td>
              					 <td width="20%"><img src="<%=request.getContextPath() %>/images/m_ico1.gif" width="5" height="9">当前学生:${studentInfo}</td>
              					 <td width="15%"align="right"><a href="studentLogout.do">安全退出</a></td>
              					</tr>
         					</table>
         				</td>
        			</tr>
      				<tr>
        		 		 <td align="center" valign="top">
        								
		 <table width="96%"  border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" >
		 	<tr>
		 		
		 			<s:if test="%{exam_l.size==0}">
		 				<td>最近没有考试！</td>
		 			</s:if>
					<s:else>
						<td>最近可参加的考试：</td>
					</s:else>
			</tr>
			<s:iterator value="exam_l" status="st" id="Exam">
		  		<tr>
		  			<td >
		  				<s:url id="url" action="showExamInfo.do">
					    	<s:param name="exam_id"><s:property value="exam_id" /></s:param>
						</s:url>
						<s:a href="%{url}" cssClass="startExam" id="%{exam_id}"><s:property value="exam_name"></s:property> </s:a>
					</td>
		  		</tr>
		  	</s:iterator>									 									  
		</table>

						</td>
      		</tr>
      		</table>
    </td>
  </tr>
</table>
<jsp:include page="../public/copyright.jsp"/>
</body>
</html>
