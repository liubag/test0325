<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script src="${pageContext.request.contextPath}/ScatteredGrid/js/jquery-1.5.1.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/ScatteredGrid/js/onloadIframe.js" type="text/javascript"></script>
    <title></title>
 
    
<style type="text/css">
    #box
    {
        width:730px;
        height:auto;
        }
    #shang,#xia
    {
        width:700px;
        height:auto;
        margin:5px;
        float:left;
		
        }
       #shang1,#xia1,#shang2
    {
        width:700px;
        height:auto;
        margin:5px;
        float:left;
		
        }
     .abc
     {
         display:none;
         }
    #btn,.btn1
    {
        position:relative;
        left:5px;
        top:7px;
        width:130px;
        height:25px;
        background-color:White;
        }
	.div_1{
		float:left;
		width:150px; 
		text-align:right;
		background:#FFF38F;
		margin-left:10px;
		margin-right:5px;
		margin-top: 5px;
	}
	.div_2{
		float:left;
		text-align:left;
		width:500px; 
		background:#FFF38F;
		margin-top: 5px;
	}
	.div_1_2{
		float:left;
		width:150px; 
		text-align:right;
		margin-left:10px;
		background:#FFFFEE;
		margin-right:5px;
		margin-top: 5px;
	}
	.div_2_2{
		float:left;
		text-align:left;
		width:500px; 
		background:#FFFFEE;
		margin-top: 5px;
	}
	
	.div_1_1_1{
		float:left;
		width:150px; 
		text-align:right;
		margin-left:10px;
		background:#FFF38F;
		margin-right:5px;
		margin-top: 5px;
	}
	.div_2_1_1{
		float:left;
		text-align:left;
		width:320px; 
		background:#FFF38F;
		margin-top: 5px;
	}
	.div_1_2_1{
		float:left;
		width:150px; 
		text-align:right;
		margin-left:10px;
		background:#FFFFEE;
		margin-right:5px;
		margin-top: 5px;
	}
	.div_2_2_1{
		float:left;
		text-align:left;
		width:320px; 
		background:#FFFFEE;
		margin-top: 5px;
	}
	.div_title{
		background:#669999; 
		text-align:center;
		margin-left:10px;
	    width:655px;
	    margin-top: 5px;
	}
	.div_title1{
		background:#669999; 
		text-align:center;
		margin-left:10px;
	    width:475px;
	    margin-top: 5px;
	}
	.div_title1_1{
		color: red;
	}
</style>
</head>
<body>
<div id="body1" >
	<div id="account">
		<h3 style="text-align: center;">学生网格账号</h3>
		    <div id="shang">
		    <div class="div_title">用户信息</div>
			<div class="div_1">用户名：</div><div class="div_2"><s:text name="scatteredGridAccounts.scatteredGridUser.username"/></div>
			<div class="div_1_2">真实姓名：</div><div class="div_2_2"><s:text name="scatteredGridAccounts.scatteredGridUser.truename"/></div>
			<div class="div_1">身份证：</div><div class="div_2"><s:text name="scatteredGridAccounts.scatteredGridUser.idcard"/></div>
			<div class="div_1_2">性别：</div><div class="div_2_2"><s:text name="scatteredGridAccounts.scatteredGridUser.sex"/></div>
			<div class="div_1">联系电话：</div><div class="div_2"><s:text name="scatteredGridAccounts.scatteredGridUser.phone"/></div>
			<div class="div_1_2">住址：</div><div class="div_2_2"><s:text name="scatteredGridAccounts.scatteredGridUser.address"/></div>
			<div class="div_1">
			<a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=<s:property value="scatteredGridAccounts.scatteredGridUser.qq_number"/>&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:<s:property value="scatteredGridAccounts.scatteredGridUser.qq_number"/>:41" alt="点击这里给我发消息" title="点击这里给我发消息" /></a>
			</div>
			<div class="div_2">
				<s:text name="scatteredGridAccounts.scatteredGridUser.qq_number"/>
			</div>
			</div>  

	    <div id="shang1">
	    <div class="div_title">格子信息</div>
		<div class="div_1">格子名称：</div><div class="div_2"><s:text name="scatteredGridAccounts.scatteredGrid.grid_name" /></div>
		<div class="div_1_2">格子类型：</div><div class="div_2_2"><s:text name="scatteredGridAccounts.scatteredGrid.scatteredGridAgreement.gridType.gridtypename"/></div>
		<div class="div_1">可容纳商品数：</div><div class="div_2"><s:text name="scatteredGridAccounts.scatteredGrid.scatteredGridAgreement.gridType.canshowgoods"/></div>
		<div class="div_1_2">可用硬盘空间：</div><div class="div_2_2"><s:text name="scatteredGridAccounts.scatteredGrid.scatteredGridAgreement.gridType.hard_disk_space"/>MB</div>
		<div class="div_1">已使用空间：</div><div class="div_2"><s:text name="scatteredGridAccounts.hasused_space" />MB</div>
		<div class="div_1_2">单价：</div><div class="div_2_2"><s:text name="scatteredGridAccounts.scatteredGrid.scatteredGridAgreement.unitprice"/></div>
		<div class="div_1">提示信息：</div><div class="div_2"><s:text name="scatteredGridAccounts.scatteredGridUser.tipInfo"/></div>
		<div class="div_1_2">今可置顶商品次数：</div><div class="div_2_2"><s:text name="scatteredGridAccounts.scatteredGrid.LZ_note"/></div>
		<div class="div_1">今可置顶优惠次数：</div><div class="div_2"><s:text name="scatteredGridAccounts.scatteredGrid.LZ_preferential"/></div>
		</div>
		    <div id="shang2">
		    <div class="div_title">租用信息</div>
		    <div class="div_1_2">租用开始时间：</div><div class="div_2_2"><s:text name="scatteredGridAccounts.rendtype_starttime" /></div>
			<div class="div_1">租用到期时间：</div><div class="div_2"><s:text name="scatteredGridAccounts.rendtype_endtime" /></div>
			<div class="div_1_2">租用合约</div>
			<div class="div_2_2">
			<s:iterator value="scatteredGridAccounts.scatteredGridAgreement_l" status="st">
			
			<s:if test="account_status==1">
				<div class="div_title1">
				租用合约<s:text name="rendtype_starttime" />
				<span class="div_title1_1">(正在使用期)</span>
				</div>
			</s:if>
			<s:elseif test="account_status==2">
				<div class="div_title1">
				租用合约<s:text name="rendtype_starttime" />
				<span class="div_title1_1">(可修改期)</span>
				</div>
			</s:elseif>
			
			<s:elseif test="account_status==0">
		<div class="div_title1">
			租用合约<s:text name="rendtype_starttime" />
			（过期）
			</div>
		<div class="div_1_2_1">注销时间：</div><div class="div_2_2_1"><s:text name="logout_time"/></div>
		</s:elseif>
		<s:else>
		<div class="div_title1">
			租用合约<s:text name="rendtype_starttime" />
			（毁约过期）
			</div>
		<div class="div_1_2_1">注销时间：</div><div class="div_2_2_1"><s:text name="logout_time"/></div>
		</s:else>
			
			<div class="div_1_1_1">租用格子类型：</div><div class="div_2_1_1"><s:text name="gridType.gridtypename" /></div>
			<div class="div_1_2_1">可容纳商品数：</div><div class="div_2_2_1"><s:text name="gridType.canshowgoods"/></div>
			<div class="div_1_1_1">可用硬盘空间：</div><div class="div_2_1_1"><s:text name="gridType.hard_disk_space"/>MB</div>
			<div class="div_1_2_1">单价：</div><div class="div_2_2_1"><s:text name="unitprice"/></div>
			<div class="div_1_1_1">租用时间类型：</div><div class="div_2_1_1"><s:text name="type_called" /></div>
			<div class="div_1_2_1">租用月份：</div><div class="div_2_2_1"><s:text name="months" /></div>
			<div class="div_1_1_1">租用开始时间：</div><div class="div_2_1_1"><s:text name="rendtype_starttime" /></div>
			<div class="div_1_2_1">租用到期时间：</div><div class="div_2_2_1"><s:text name="rendtype_endtime" /></div>
			<div class="div_1_1_1">租用折扣：</div><div class="div_2_1_1"><s:text name="rendtype_agio"/></div>
			<div class="div_1_2_1">总费用：</div><div class="div_2_2_1"><s:text name="rendtype_totalprice"/></div>
			</s:iterator>
			</div>
  	</div>
</div>
</div>
</body>
</html>
