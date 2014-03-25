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

</head>
<body>
    <div id="shang">
    	<div class="div_title">格子信息</div>
		<div class="div_1">格子名称：</div><div class="div_2"><s:property value="brandgridGrid.brandgrid_grid_name"/></div>
		<div class="div_1_2">所属品牌：</div><div class="div_2_2"><s:property value="brandgridGrid.brandgrid.brandgrid_name"/></div>
		<div class="div_1">格子编号：</div><div class="div_2"><s:property value="brandgridGrid.brandgrid_grid_number"/></div>
		<div class="div_1_2">在架商品数量：</div><div class="div_2_2"><s:property value="brandgridGrid.brandgrid_grid_hasgoods"/></div>
		<div class="div_1">置顶次数：</div><div class="div_2"><s:property value="brandgridGrid.LZ_note"/></div>
		<div class="div_1_2">总业绩：</div><div class="div_2_2"><s:property value="brandgridGrid.brandgrid_outstanding"/></div>
	</div>
</body>
</html>