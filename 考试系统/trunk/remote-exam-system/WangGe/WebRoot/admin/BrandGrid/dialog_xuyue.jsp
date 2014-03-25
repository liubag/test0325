<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*,com.OnlineGridShop.scattered.Entity.GridType,com.OnlineGridShop.scattered.Entity.ScatteredGridRendtypeMake" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<html >
<head>
	<title></title>
	 <script src="${pageContext.request.contextPath}/ScatteredGrid/js/jquery-1.5.1.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/ScatteredGrid/js/jquery-latest.pack.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/ScatteredGrid/js/dialog.js" type="text/javascript"></script>
<style type="text/css">
    #shang
    {
        width:410px;
        height:auto;
        margin:5px;
        float:left;
		
        }
	.div_1{
		width:150px; 
		float:left;
		text-align:right;
		background:#FFF38F;
		margin-right:5px;
		margin-top: 5px;
	}
	.div_1_2{
		width:150px; 
		float:left;
		text-align:right;
		background:#FFFFEE;
		margin-right:5px;
		margin-top: 5px;
	}
	.div_2{
		width:245px;
		float:left;
		background:#FFF38F;
		margin-right:10px;
		margin-top: 5px;
	}
	.div_2_2{
		width:245px;
		float:left;
		background:#FFFFEE;
		margin-right:10px;
		margin-top: 5px;
	}
	.div_title{
		background:#669999; 
		text-align:center;
	    width:400px;
	}
</style>
 <script type="text/javascript">
		 	$(function(){
			 	$("#sure").click(function(){
			 		var guuid = $("#guuid").attr("value");
			 		var xuyue = $("#xuyue").attr("value");
			 		var page = $("#page").attr("value");
					$("#rightIframe",window.parent.parent.parent.document.body).attr("src","brandgrid_xuyue.do?page=" + page + "&brandgrid_id=" + guuid + "&xuyue="+xuyue);
		 			$(window.parent.document).find("#floatBox .title span").trigger('click');	 
		 		});
		 	});
		 </script>
</head>
<%
	String gn = new String(request.getParameter("gn").getBytes("ISO8859-1"),"utf-8");
	String guuid = request.getParameter("guuid");
	String page1 = request.getParameter("page");
 %>
<body>
    <div id="shang">
    	<input type="hidden" id="guuid" value="<%=guuid %>"/>
    	<input type="hidden" id="page" value="<%=page1 %>"/>
    	<div class="div_title">品牌店： <%=gn %>       -->续约</div>
		<div class="div_1">续约月数：</div><div class="div_2"><input type="text" size="4" id="xuyue"/>个月</div>
		<div class="div_1_2"></div><div class="div_2_2"><input type="submit" value="确定" id="sure"/></div>
	</div>
</body>
</html>