<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
<script src="${pageContext.request.contextPath}/Brand/js/jquery-1.6.4.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/Brand/Daterangepicker/js/daterangepicker.jQuery.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/Brand/Daterangepicker/js/jquery-ui-1.7.1.custom.min.js" type="text/javascript"></script>
<link href="${pageContext.request.contextPath}/Brand/css/xiaoshoujilu-top.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/Brand/Daterangepicker/css/ui.daterangepicker.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/Brand/Daterangepicker/css/redmond/jquery-ui-1.7.1.custom.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	 function refreshSize() {
		$('#rangeB').daterangepicker({arrows:true}); 
     } 
     function dangqian(){
     	$("#dangqian").attr("class","yes");
     	$("#dqwz").html("当前位置：全部");
     	$("#jilu",document.body).attr("src","show_All_Notes_brandOwner.do?page=1&time=&sales_id=&brandgrid_Grid_id=&owner_status=1");	
     	return false;
     }    
     $(function(){             
		$('#tianjia').click(function(){
			 var t = $('#rangeB').val();
			 var sh = $('#sales_name').val();
			 var gz = $('#grid_num').val();
			 if(t=="点击选择筛选时间"){
			 	t = "";
			 }
			 if(sh=="0"){
			 	sh = "";
			 }
			 if(gz=="0"){
			 	gz = "";
			 }
			 if(t=="" && sh=="" && gz==""){
			 	alert("请选择筛选条件");	
			 	return false;		 
			 }else{
			 	$("#dqwz").html("当前位置：" + t);
				$("#dangqian").attr("class","no");
			 	$("#jilu",document.body).attr("src","show_All_Notes_brandOwner.do?page=1&time="+t+"&sales_id="+sh+"&brandgrid_Grid_id="+gz+"&owner_status=2");	
			 }
		});
		})
</script>
</head>
<body onload="refreshSize()">
<table cellspacing="0">

  <tr>
    <td class="line1" style="vertical-align:middle;">
    <a href="#" id="dangqian" onclick="return dangqian();">全部</a>
    </td>
    <td class="line1"><input type="text" value="" id="rangeB" class="sou" name="time_be" onFocus="if (value =='点击选择筛选时间'){value =''}" onBlur="if (value ==''){value='点击选择筛选时间'}"/></td>
    <td class="line1">
    <s:action name="getSalesName_l_brandowner" executeResult="false"></s:action>
    <s:select list="#request.brandgridSalesman_l" listValue="brandgrid_salesman_name" name="sales_id" listKey="brandgrid_salesman_id" id="sales_name"/>
	</td>
    <td class="line1">
     <s:action name="getAllNum_l_brandowner" executeResult="false"></s:action>
    <s:select list="#request.brandgridGrid_l" listValue="brandgrid_grid_number" name="brandgrid_Grid_id" listKey="brandgrid_grid_id" id="grid_num"/>
	</td>
    <td class="line1"><input name="" type="button" value="确定" id="tianjia" /></td>
  </tr>
  <tr>
  <td colspan="5" class="td1"><hr/><span id="dqwz"></span><hr/></td>
  </tr>
  <tr>
    <td colspan="5"><iframe id="jilu" src=""></iframe></td>
  </tr>
</table>
</body>
</html>
