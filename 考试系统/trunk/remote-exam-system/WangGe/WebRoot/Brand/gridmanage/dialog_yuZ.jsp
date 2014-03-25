<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>预跳转页面</title>
		<script src="${pageContext.request.contextPath}/Brand/js/jquery-1.6.4.min.js" type="text/javascript"></script>
	  <script type="text/javascript">
	  $(document).ready(function(){
			  		var tip = $("#tip").attr("value");  //旧库存上传图片
			  			if(tip!=""){
			  				alert(tip);
				  		}else{
				  			var page = $("#page").attr("value");
				  			var statu_choice = $("#statu_choice").attr("value");
				  			var statu = $("#statu").attr("value");
				  			$("#giframe",window.parent.parent.parent.document.body).attr("src","show_All_Goods_gridOwner.do?page=" + page + "&statu_choice="+statu_choice+"&statu="+statu);	 
				  		}
				  		$(window.parent.document).find("#floatBox .title span").trigger('click');
			  	});
	  </script>
	</head>

	<body>
	<!--
	旧库存上传图片
		-->
		<input type="hidden" value="<s:property value="statu"/>" id="statu"/>
		<input type="hidden" value="<s:property value="statu_choice"/>" id="statu_choice"/>
		<input type="hidden" value="<s:property value="tip"/>" id="tip"/>
		<input type="hidden" value="<s:property value="page"/>" id="page"/>
		
	</body>
</html>
