<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*,com.OnlineGridShop.scattered.Entity.GridType,com.OnlineGridShop.scattered.Entity.ScatteredGridRendtypeMake" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<html >
<head>
	<title></title>
	<link href="${pageContext.request.contextPath}/admin/css/table.css" type="text/css" rel="stylesheet" />
	<script src="${pageContext.request.contextPath}/admin/js/jquery-1.5.1.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/admin/js/showscatteredaccountpage.js" type="text/javascript"></script>
<style type="text/css">
	.formtips{width: 200px;margin:2px;padding:2px;}
	.formtips2{width: 200px;margin:2px;padding:2px;}
	.onError{
	    background:#FFE0E9 url(${pageContext.request.contextPath}/ScatteredGrid/pic/reg3.gif) no-repeat 0 center;
		padding-left:25px;
	}
	.onError2{
	    background:#FFE0E9 url(${pageContext.request.contextPath}/ScatteredGrid/pic/reg3.gif) no-repeat 0 center;
		padding-left:25px;
	}
	.onSuccess{
	    background:#E9FBEB url(${pageContext.request.contextPath}/ScatteredGrid/pic/reg4.gif) no-repeat 0 center;
		padding-left:25px;
	}
	.high{
    	color:red;
	}
    #box
    {
        width:900px;
        height:auto;
        }
    #shang,#xia
    {
        width:740px;
        height:auto;
        margin:5px;
        float:left;
		
        }
       #shang1,#xia1,#shang2
    {
        width:740px;
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
		width:200px; 
		text-align:right;
		margin-left:30px;
		background:#FFF38F;
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
		width:200px; 
		text-align:right;
		margin-left:30px;
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
		margin-left:30px;
	    width:705px;
	    margin-top: 5px;
	}
	.div_title1{
		background:#669999; 
		text-align:center;
		margin-left:10px;
	    width:475px;
	    margin-top: 5px;
	}
	.div_title11{
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
<div id="account" style="text-align: center; ">
  <div style="text-align: left;">
  <%String ref = request.getHeader("REFERER");%>
	<a href="" onclick="javascript:window.location='<%=ref%>'" target="iframe">返回上一步</a>
  </div>
  <h3>学生网格账号</h3>
  <div id="box">
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
	
    <div id="xia" class="abc">
    <s:form method="post" action="update_userInfo_admin">
   	 	<div class="div_title" style="background: red;">修改用户信息</div>
   	 	<input type="hidden" name="scatteredGridUser.id" id="ownerid" value="<s:property value="scatteredGridAccounts.scatteredGridUser.id"/>"/>
    	
		<div class="div_1">用户名：</div><div class="div_2"><input type="text" id="username" class="required" name="scatteredGridUser.username" value="<s:property value="scatteredGridAccounts.scatteredGridUser.username"/>"/></div>
		<div class="div_1_2">真实姓名：</div><div class="div_2_2"><input type="text" class="required" id="truename" name="scatteredGridUser.truename" value="<s:property value="scatteredGridAccounts.scatteredGridUser.truename"/>"/></div>
		<div class="div_1">身份证：</div><div class="div_2"><input type="text" id="idcard" class="required" name="scatteredGridUser.idcard" value="<s:property value="scatteredGridAccounts.scatteredGridUser.idcard"/>"/></div>
		<div class="div_1_2">性别：</div><div class="div_2_2"><s:radio list="#{'男':'男','女':'女'}" name="scatteredGridUser.sex"/></div>
		<div class="div_1">联系电话：</div><div class="div_2"><input type="text" class="required" id="phone" name="scatteredGridUser.phone" value="<s:property value="scatteredGridAccounts.scatteredGridUser.phone"/>"/></div>
		<div class="div_1_2">住址：</div><div class="div_2_2"><input type="text" class="required" id="address" name="scatteredGridUser.address" value="<s:property value="scatteredGridAccounts.scatteredGridUser.address"/>"/></div>
		<div class="div_1">
			QQ客服：
		</div>
		<div class="div_2">
		<input type="text" class="required" id="qq_number" name="scatteredGridUser.qq_number" value="<s:property value="scatteredGridAccounts.scatteredGridUser.qq_number"/>"/>
		</div>
		<div style="margin-left:250px;"><s:submit value="提交用户信息" id="send"/> <s:reset id="res"/></div>
	</s:form>
	</div>
    <input id="btn" type="button" value="修改用户信息" />
    
</div>
<br/>

   <div id="box">
    <div id="shang1">
    <div class="div_title">格子信息</div>
	<div class="div_1">格子名称：</div><div class="div_2"><s:text name="scatteredGridAccounts.scatteredGrid.grid_name" /></div>
	<div class="div_1_2">格子类型：</div><div class="div_2_2"><s:text name="scatteredGridAccounts.scatteredGrid.scatteredGridAgreement.gridType.gridtypename"/></div>
	<div class="div_1">可容纳商品数：</div><div class="div_2"><s:text name="scatteredGridAccounts.scatteredGrid.scatteredGridAgreement.gridType.canshowgoods"/></div>
	<div class="div_1_2">可用硬盘空间：</div><div class="div_2_2"><s:text name="scatteredGridAccounts.scatteredGrid.scatteredGridAgreement.gridType.hard_disk_space"/>MB</div>
	<div class="div_1">单价：</div><div class="div_2"><s:text name="scatteredGridAccounts.scatteredGrid.scatteredGridAgreement.unitprice"/></div>
	<div class="div_1_2">提示信息：</div><div class="div_2_2"><s:text name="scatteredGridAccounts.scatteredGridUser.tipInfo"/></div>
	
	</div>
	
	 <div id="xia1" class="abc">
    	<s:form method="post" action="update_agreement_admin">
   	 	<div class="div_title" style="background: red;">
   	 	<s:if test="scatteredGridAccounts.scatteredGridUser.status==2">
    		修改合约信息
		</s:if>
		<s:elseif test="scatteredGridAccounts.scatteredGridUser.status==1">
			续约
		</s:elseif>
		<s:else>
			激活
		</s:else>
   	 	</div>
   	 	<input type="hidden" name="owner_id" id="ownerid" value="<s:property value="scatteredGridAccounts.scatteredGridUser.id"/>"/>
		<s:action name="showAllGridType" executeResult="false"></s:action>
		<input type="hidden" value="<s:property value="scatteredGridAccounts.scatteredGridUser.status"/>" name="status"/>
		<div class="div_1">选择格子类型：</div>
		<div class="div_2">
		<%
		  		List<GridType> gridtype_l = (List<GridType>)request.getAttribute("gridtype_l");
		  		for(GridType gt : gridtype_l){
		  			%>
		  			<input type="radio"  class="grid_type_id" name="grid_type_id" value= "<%=gt.getGridtype_id() %>" /> <%=gt.getGridtypename()%> <span id="<%="canshowgoods" + gt.getGridtype_id() %>">可容纳商品：<%=gt.getCanshowgoods() %> </span>个,单价：<span id="<%="unitprice" + gt.getGridtype_id() %>"><%=gt.getUnitprice() %></span>元整 ,可用硬盘空间：<%=gt.getHard_disk_space() %>MB<br/> 
		  			<%
		  		}
		  	 %>
		</div>
		<s:action name="showAllRendType" executeResult="false"></s:action>
		<div class="div_1_2">选择租用类型：</div>
		<div class="div_2_2">
		<%
		  		List<ScatteredGridRendtypeMake> rendTypeMake_l = (List<ScatteredGridRendtypeMake>)request.getAttribute("rendTypeMake_l");
		  		for(ScatteredGridRendtypeMake sgrm : rendTypeMake_l){
		  			%>
		  			<input  type="radio" class="rendtype_id" name="rendtype_id" value= "<%=sgrm.getRendtype_id() %>" /> <%=sgrm.getType_called()%>（<span id="<%="months" + sgrm.getRendtype_id()%>"><%=sgrm.getMonths()%></span> ）,折扣：<span id="<%="rendtype_agio" + sgrm.getRendtype_id()%>"><%=sgrm.getRendtype_agio() %></span>折 <br/> 
		  			<%
		  		}
		  	 %>
		</div>
		<div class="div_1">总价：</div>
		<div class="div_2">
		<s:textfield name="totalprice" value="" readonly="true" id="result"/>
		</div>
		<div style="margin-left:250px;"><s:submit value="提交合约信息" id="send2"/> <s:reset id="res2"/></div>
		</s:form>
	</div>
	<s:if test="scatteredGridAccounts.scatteredGridUser.status==2">
    	<input class="btn1" type="button" value="修改当前合约信息" />
	</s:if>
	<s:elseif test="scatteredGridAccounts.scatteredGridUser.status==1">
		<input class="btn1" type="button" value="续约" />
	</s:elseif>
	<s:else>
		<input class="btn1" type="button" value="激活" />
	</s:else>
	</div>
<br/>
   <div id="box">
    <div id="shang2">
    <div class="div_title">租用信息</div>
    <div class="div_1_2">租用开始时间：</div><div class="div_2_2"><s:text name="scatteredGridAccounts.rendtype_starttime" /></div>
	<div class="div_1">租用到期时间：</div><div class="div_2"><s:text name="scatteredGridAccounts.rendtype_endtime" /></div>
	<div class="div_1_2">已使用空间：</div><div class="div_2_2"><s:text name="scatteredGridAccounts.hasused_space" />MB</div>
	<div class="div_1_2">租用合约</div>
	<div class="div_2_2">
	<s:iterator value="scatteredGridAccounts.scatteredGridAgreement_l" status="st">
		
		<s:if test="account_status==1">
			<div class="div_title11">
			租用合约<s:text name="rendtype_starttime" />
			<span class="div_title1_1">(正在使用期)</span>
			<s:url id="url" action="zhuxiaoAgreement">
			    <s:param name="agreement_id"><s:property value="agreement_id"/></s:param>
			</s:url>
			<s:a href="%{url}" onclick="return forcedo1();" >违约</s:a>
			</div>
		</s:if>
		<s:elseif test="account_status==2">
			<div class="div_title11">
			租用合约<s:text name="rendtype_starttime" />
			<span class="div_title1_1">(可修改期)</span>
			<s:url id="url" action="zhuxiaoAgreement">
			    <s:param name="agreement_id"><s:property value="agreement_id"/></s:param>
			</s:url>
			<s:a href="%{url}" onclick="return forcedo2();">注销合同</s:a>
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