<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>销售记录打印</title>
<script src="${pageContext.request.contextPath}/Brand/js/jquery-1.6.4.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/Brand/Daterangepicker/js/daterangepicker.jQuery.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/Brand/Daterangepicker/js/jquery-ui-1.7.1.custom.min.js" type="text/javascript"></script>
<link href="${pageContext.request.contextPath}/Brand/Daterangepicker/css/ui.daterangepicker.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/Brand/Daterangepicker/css/redmond/jquery-ui-1.7.1.custom.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
*{
	font-size: 14px;
	float:none;
	margin:0px;
	padding:0px;
}
#td1 {
    text-align: center;
    font-size: 20px;
}
#jilu2 {
    background-color:#FFF5E1;
}
#rangeB {
    font-size: 10px;
}
body {	
}

#content{
 width:1000px;
 margin:0 auto;
}
.sumbit{
background-color:#d8be98;
	border:dashed 1px #d8be98;
}
-->
</style>

<script type="text/javascript">
function refreshSize() {
		$('#rangeB').daterangepicker({arrows:true}); 
     } 
 $(function(){             
		$('#queding').click(function(){
			 var t = $('#rangeB').val();
			 var gz = $('#grid_num').val();
			 if(t=="点击选择筛选时间"){
			 	t = "";
			 }
			 if(gz=="0"){
			 	gz = "";
			 }
			 if(t=="" || gz==""){
			 	alert("请正确选择筛选条件");	
			 	return false;		 
			 }else{
			 	$("#jilu2",document.body).attr("src","for_daying.do?brandgrid_Grid_id="+gz+"&time="+t);	
			 }
		});
})

</script>
</head>

<body onLoad="refreshSize()">
<div style="width:100%;"><jsp:include page="../header.htm"/></div>
<div style="width:1000px;margin-left: expression((body.clientWidth-1000)/2);">
<div id="td1">销售记录打印</div>
		<div>
			<div style="float:left; width:35%;">
			 请选择格子：
			 <s:action name="getAllNum_l_brandowner" executeResult="false"></s:action>
			<s:select list="#request.brandgridGrid_l" listValue="brandgrid_grid_number" name="brandgrid_Grid_id" listKey="brandgrid_grid_id" id="grid_num"/>
			</div>
			<div style="float:left;width:35%;">
			 <input type="text" value="" id="rangeB" class="sou" name="time_be" onFocus="if (value =='点击选择筛选时间'){value =''}" onBlur="if (value ==''){value='点击选择筛选时间'}"/>
			</div>
			<div style="float:left;width:30%;">
			<input type="submit" id="queding" value="确定" class="sumbit"/>
			</div>
		</div>
		<div style="clear:left;float:none;"><iframe id="jilu2" src="" style="width: 100%;"></iframe></div>
</div>
<div style="width:100%;"><jsp:include page="../bottom.jsp"/></div>
</body>
</html>
