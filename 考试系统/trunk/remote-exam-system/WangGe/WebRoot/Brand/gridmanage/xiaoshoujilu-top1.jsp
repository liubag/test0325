<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>销售记录</title>
<script src="${pageContext.request.contextPath}/Brand/js/jquery-1.6.4.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/Brand/Daterangepicker/js/daterangepicker.jQuery.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/Brand/Daterangepicker/js/jquery-ui-1.7.1.custom.min.js" type="text/javascript"></script>
<link href="${pageContext.request.contextPath}/Brand/css/xiaoshoujilu-top.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/Brand/Daterangepicker/css/ui.daterangepicker.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/Brand/Daterangepicker/css/redmond/jquery-ui-1.7.1.custom.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	function dandqian(){
				$('#rangeB').attr("value","点击选择筛选时间");
			 $("#dangqian").attr("class","yes");
			 $('#dq').html("全部");
			  $("#jilu",document.body).attr("src","show_All_Notes_gridOwner.do?page=1&time=&owner_status=2");	
			 return false;
		}
	 function refreshSize() {
		$('#rangeB').daterangepicker({arrows:true}); 
        var owner_status = $("#owner_status").val(); 
        if(owner_status == '1'){
             $("#dangqian").attr("class","yes");
        }else{
             $("#dangqian").attr("class","no");
        }                  
		$('#tianjia').click(function(){
			 var t = $('#rangeB').val();
			 if(t=="点击选择筛选时间"){	
			 	alert("未选择筛选时间.");	 
			}else{
				$('#dq').html(t);
				 $("#dangqian").attr("class","no");
				 $("#jilu",document.body).attr("src","show_All_Notes_gridOwner.do?page=1&time=" + t + "&owner_status=2");	
			}
		}	
)}
</script>
</head>
<body onload="refreshSize()">
<input type="hidden" id="owner_status" value="<s:property value="owner_status"/>"/>
<table cellspacing="0">

  <tr>
    <td class="line1" style="vertical-align:middle;"><a href="" id="dangqian" onclick="return dandqian();">全部</a></td>
    <td class="line1"><input type="text" value="" id="rangeB" class="sou" name="time_be" onFocus="if (value =='点击选择筛选时间'){value =''}" onBlur="if (value ==''){value='点击选择筛选时间'}"/></td>
    
    <td class="line1"><input name="" type="button" value="确定" id="tianjia" /></td>
  </tr>
  <tr>
  <td colspan="3" class="td1"><hr/>当前筛选：<span id="dq"></span><hr/></td>
  </tr>
  <tr>
    <td colspan="3"><iframe id="jilu" src=""></iframe></td>
  </tr>
</table>
</body>
</html>
