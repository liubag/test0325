<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*,com.OnlineGridShop.scattered.Entity.GridType,com.OnlineGridShop.scattered.Entity.ScatteredGridRendtypeMake" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<html >
<head>
	<title></title>
	<% 
		String qq = request.getParameter("qq"); 
	 %>
	<script src="${pageContext.request.contextPath}/Brand/js/jquery-1.6.4.min.js" type="text/javascript"></script>
<script type="text/javascript">
	  	function sure() {
			var qq = $("#qq").val();
			var pw = $("#pw").val(); 
			if(qq == null || qq.length == 0 || pw == null || pw.length == 0 ){
				alert("客服或密码不能为空！");
				return false;
			}else{
				$("#iframe",window.parent.parent.parent.document.body).attr("src","updataQQ_brandgrid.do?qq=" + qq+"&pw="+pw);
		 		$(window.parent.document).find("#floatBox .title span").trigger('click');	 
				return true;
			}
		}	
	  	
	</script>
	<style type="text/css">
	.sumbit{
	background-color:#d8be98;
	border:dashed 1px #d8be98;
	}
	</style>
</head>
<body style="background-color：#FFF3D2;">
    <div style="text-align: center;">
    	<div style="margin-top: 30px;">客服QQ：<input type="text" name="qq" id="qq" value="<%=qq %>"/></div>
    	<div style="margin-top: 30px;">密码：<input type="password" name="pw" id="pw"/></div>
    	<div style="margin-top: 30px;"><input type="submit" class="sumbit" id="sure" value="确定" onclick="return sure();"/></div>
	</div>
</body>
</html>