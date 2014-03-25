<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*,com.OnlineGridShop.brand.Entity.BrandgridGridOwner" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<html >
<head>
	<title></title>
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
	<s:if test="tip.length()!=0">
		<s:property value="tip"/>
	</s:if>
	<s:else>
	<div id="shang"> 
    <div class="div_title">格主信息</div>
    <div class="div_1_2">格子名字：</div><div class="div_2_2"><s:property value="brandgridGridOwner.grid_name"/></div>
     <div class="div_1_2">全部商品数：</div><div class="div_2_2"><s:property value="brandgridGridOwner.brandgrid_grid_hasgoods"/></div>
	<div class="div_1">姓名：</div><div class="div_2"><s:property value="brandgridGridOwner.brandgrid_gridowner_name"/></div>
	<div class="div_1_2">性别：</div><div class="div_2_2"><s:property value="brandgridGridOwner.brandgrid_gridowner_sex"/></div>
	<div class="div_1">创建时间:</div><div class="div_2"><s:property value="brandgridGridOwner.brandgrid_gridowner_newtime.toLocaleString()"/></div>
	<div class="div_1_2">联系方式：</div><div class="div_2_2"><s:property value="brandgridGridOwner.brandgrid_gridowner_phone"/></div>
	<div class="div_1">在架商品数：</div><div class="div_2"><s:property value="brandgridGridOwner.u_hasgoods"/></div>
	<div class="div_1_2">更新置顶时间</div><div class="div_2_2"><s:property value="brandgridGridOwner.LZ_time.toLocaleString()"/></div>
	<div class="div_1">剩余置顶商品数：</div><div class="div_2"><s:property value="brandgridGridOwner.LZ_note"/></div>
	<div class="div_1_2">剩余置顶优惠数：</div><div class="div_2_2"><s:property value="brandgridGridOwner.LZ_preferential"/></div>
	<div class="div_1">总业绩：</div><div class="div_2"><s:property value="brandgridGridOwner.brandgrid_outstanding"/></div>
	<div class="div_1_2">空间：</div><div class="div_2_2"><s:property value="brandgridGridOwner.brandgrid_hasused_space"/>/<s:property value="brandgridGridOwner.brandgrid.brandgridGridtype.hard_disk_space"/>MB</div>
	</div>
    </s:else>
</body>
</html>   