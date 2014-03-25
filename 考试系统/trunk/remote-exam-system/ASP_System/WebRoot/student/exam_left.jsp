<%@ page language="java" import="java.util.*,java.text.*,com.aspsystem.entity.Exam" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title></title>
	<link rel="stylesheet" href="<%=request.getContextPath() %>/js/jquery-easyui-1.2.1/themes/icon.css"></link>
	<link href="<%=request.getContextPath() %>/js/jquery-easyui-1.2.1/themes/default/easyui.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-1.4.2.min.js"></script>
	<script src="<%=request.getContextPath() %>/js/jquery-easyui-1.2.1/locale/easyui-lang-zh_CN.js" type="text/javascript"></script>
	<script src="<%=request.getContextPath() %>/js/jquery-easyui-1.2.1/jquery.easyui.min.js" type="text/javascript"></script>
<%
	Exam exam=(Exam)request.getAttribute("exam");
	Date examBeginTime=exam.getBegin_time();
	//Date examBeginTime=new Date(2012-1900, 3-1, 8, 0, 0, 0);
	float exam_time =exam.getExam_time();
	//float exam_time =30;
 %>
<script language="javascript"> 
//从服务器上获取初始时间 
var exam_begin_time =new Date(<%=examBeginTime.getTime()%>);
//alert(exam_begin_time.getTime());
var currentDate = new Date(<%=new java.util.Date().getTime()%>); 
var exam_time =<%=exam_time*60%>;
	var pass_time,pass_hour,pass_min,pass_sec;
	var remain_time,remain_hour,remain_min,remain_sec;
	var isSaveTime=false;
	var isOverExam=false;
function showTime() 
{
	 
	 pass_time=parseInt((currentDate.getTime()-exam_begin_time.getTime())/1000);//考试过去的总时间（秒）
	 pass_hour=parseInt(pass_time/3600);//小时
	 pass_min=parseInt((pass_time-pass_hour*3600)/60);
	 pass_sec=pass_time%60;
	if(pass_min<10){
		pass_min="0"+pass_min;
	}
	if(pass_sec<10){
		pass_sec="0"+pass_sec;
	}
	 remain_time=parseInt(exam_time-pass_time);
	 remain_hour=parseInt(remain_time/3600);
	 remain_min=parseInt((remain_time-remain_hour*3600)/60);
	 remain_sec=remain_time%60;
	if(remain_min<10){
		remain_min="0"+remain_min;
	}
	if(remain_sec<10){
		remain_sec="0"+remain_sec;
	}
	
	var pastshow="<strong>"+pass_hour+" 小时 "+pass_min+" 分 "+pass_sec+" 秒  </strong>";
	var remainshow="<strong>"+remain_hour+" 小时 "+remain_min+" 分 "+remain_sec+" 秒 </strong>";
	
	if(remain_time<0){
		remainshow="<strong> 0 小时 00 分 00 秒</strong>";
	}
	//5分钟自动保存答案
	if(pass_time>0 && pass_time%(1*60)==0){
		$("#form1").attr("action","saveExam.do").submit();
			$("#form1").attr("action","doExam.do");
	}else if(remain_time<=0){ //考试结束自动交卷
		document.getElementById("isExamOver").value=true;
		document.getElementById("isTimesUp").value=true;
					$("#form1").attr("action","saveExam.do").submit();
	} 
	document.getElementById("exam_time").innerHTML=pastshow;
	document.getElementById("remain_time").innerHTML=remainshow;
	currentDate.setSeconds(currentDate.getSeconds()+1); 
	document.getElementById("dt").innerHTML = "<strong>"+currentDate.toLocaleString()+"</strong>";    
	
}
window.setInterval("showTime();", 1000); 
</script> 
<script type="text/javascript">
	$(function(){
		$("#saveExam").click(function(){
			$("#form1").attr("action","saveExam.do").submit();
			$("#form1").attr("action","doExam.do");
			return false;
		});
		$("#finishExam").click(function(){
			if(pass_time>5*60){
				if(confirm("要交卷吗？")){
					document.getElementById("isExamOver").value=true;
					$("#form1").attr("action","saveExam.do").submit();
					$("#form1").attr("action","doExam.do");
				}
			}else{
				 $.messager.show({
	                title: "操作提示",
	                msg: "考试时间小于五分钟不能交卷！",
	                showType: 'fade',
	                timeout: 2000
            });
			}
		
			return false;
		});
		
	});	
</script>
</head>
<body>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="29" bgcolor="#5898C8"><span class="word_white">&nbsp;考试中</span></td>
  </tr>
  <tr>
    <td height="4"></td>
  </tr>
</table>
<table width="100%" height="441" border="0" cellpadding="0" cellspacing="0" class="tableBorder">
  <tr>
      <td width="25%" height="32" align="right" class="tableBorder_B">
    <td height="32" colspan="2" align="left" class="tableBorder_B">正在参加的考试是：${exam.exam_name}</td>
  </tr>
  <tr>
      <td width="25%" height="32" align="right" class="tableBorder_B">
    <td height="32" colspan="2" align="left" class="tableBorder_B">现在时间是：<div id="dt"></div>
测试时间已经过了：<div id="exam_time"><strong>0 小时 00 分钟 00 秒</strong></div>
剩余考试时间： <div id="remain_time"><strong>0 小时 00 分钟 00 秒</strong></div>

    </td>
  </tr>
  <tr>
      <td width="25%" height="32" align="right" class="tableBorder_B">
      <td height="32" colspan="2" align="left" class="tableBorder_B">考试时间为:<strong><%=exam_time %>分钟</strong><br/>
		最短交卷时间为:<strong>5分钟</strong>
		<p style="color:red;">提示：1分钟自动保存一次考卷！</p>
    </td>
  </tr>
   <tr>
      <td width="25%" height="32" align="right" class="tableBorder_B">
    <img src="<%=request.getContextPath() %>/images/m_ico.gif" width="11" height="11" />&nbsp;</td>
    <td height="32" colspan="2" align="left" class="tableBorder_B"><a href="" id="saveExam">保存答卷</a>
    </td>
   
  </tr>
  <tr>
  	  <td width="25%" height="32" align="right" class="tableBorder_B">
    <img src="<%=request.getContextPath() %>/images/m_ico.gif" width="11" height="11" />&nbsp;</td>
    <td height="32" colspan="2" align="left" class="tableBorder_B"><a href="" id="finishExam">交卷</a>
    </td>
  </tr>
  
</table>
	
</body>
</html>
