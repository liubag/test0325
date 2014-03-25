<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*,com.OnlineGridShop.scattered.Entity.GridType,com.OnlineGridShop.scattered.Entity.ScatteredGridRendtypeMake" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<html >
<head>
	<title></title>
	<%
		String owner_id = request.getParameter("owner_id");  
	 %>
	<script src="${pageContext.request.contextPath}/Brand/js/jquery-1.6.4.min.js" type="text/javascript"></script>
<script type="text/javascript">
	  	function sure() {
			var select = $("#select").val(); 
			var owner_id = $("#owner_id").val();;
			if(select == null){
				alert("没有空闲的格子！");
				return false;
			}else{
				$("#iframe",window.parent.parent.parent.document.body).attr("src","jihuo_gridGridOwner.do?owner_id=" + owner_id + "&brandgrid_grid_id=" + select);
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
	<input type="hidden" id="owner_id" value="<%=owner_id %>"/>
    <div style="text-align: center;">
    <s:action name="getGeNum_l_brandowner" executeResult="false"></s:action>
    	<div style="margin-top: 30px;">选择分配格子：<s:select list="#request.genum_l"  name="brandgrid_grid_id" id="select"/></div>
    	<div style="margin-top: 30px;"><input type="submit" class="sumbit" id="sure" value="激活" onclick="return sure();"/></div>
	</div>
</body>
</html>