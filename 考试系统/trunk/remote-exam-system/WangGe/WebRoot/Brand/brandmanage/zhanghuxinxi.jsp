<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
<script src="${pageContext.request.contextPath}/Brand/js/jquery-1.6.4.min.js" type="text/javascript"></script>
<link href="${pageContext.request.contextPath}/Brand/css/gezhuxinxi.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/Brand/css/dialog.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/Brand/js/jquery-latest.pack.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/Brand/js/dialog.js" type="text/javascript"></script>
<script type="text/javascript">
$(function(){
       $("tr:even").addClass("even");
})
</script>
<link href="${pageContext.request.contextPath}/Brand/css/zhanghuxinxi.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div id="top">账户信息</div>
<table cellspacing="0">
  <tr>
    <td class="td5">品牌名称&nbsp;：</td>
    <td class="td6"><s:property value="brandgrid.brandgrid_name"/></td>
  </tr>
  <tr>
    <td class="td5">法人&nbsp;：</td>
    <td class="td6"><s:property value="brandgrid.brandgridOwner.brandgrid_owner_name"/>(登录用户名：<s:property value="brandgrid.brandgridOwner.brandgrid_owner_username"/>)</td>
  </tr>
  <tr>
    <td class="td5">品牌店地址&nbsp;：</td>
    <td class="td6"><s:property value="brandgrid.brandgrid_address"/></td>
  </tr>
  <tr>
    <td class="td5">品牌店QQ客服&nbsp;：</td>
    <td class="td6"><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=<s:property value="scatteredGridUser.qq_number"/>&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:<s:property value="brandgrid.brandgrid_qq"/>:41" alt="点击这里给我发消息" title="点击这里给我发消息" /></a><s:property value="brandgrid.brandgrid_qq"/>
    <a href="#" onclick='dialog("修改客服QQ","iframe:<s:text name="mylocalhosturl" />${pageContext.request.contextPath}/Brand/brandmanage/dialog_kefu.jsp?qq=<s:property value="brandgrid.brandgrid_qq"/>","470px","200px","iframe"); '>[修改]</a>
    </td>
  </tr>
  <tr>
    <td class="td5">绑定售货员登录ip&nbsp;：</td>
    <td class="td6">
    <s:if test="brandgrid.brandgrid_ip==null">
    	未绑定，售货员将无法正常登录系统，
    	<s:url id="url" action="bangdingIP_brandowner">
		</s:url>
		<s:a href="%{url}">立即绑定</s:a>
    </s:if>
    <s:else >
    	<s:if test="isIp=='yes'">
    	当前ip正是绑定的ip
    	</s:if>
    	<s:else>
    	当前ip不是绑定的ip，
    	<s:url id="url" action="bangdingIP_brandowner">
		</s:url>
		<s:a href="%{url}">设当前为绑定ip</s:a>
    	</s:else>
    </s:else>
    
    </td>
  </tr>
  <tr>
    <td class="td5">品牌店拥有格子数量&nbsp;：</td>
    <td class="td6"><s:property value="brandgrid.brandgrid_hasgrids"/>个格子</td>	
  </tr>
  <tr>
    <td class="td5">格子类型&nbsp;：</td>
    <td class="td6"><s:property value="brandgrid.brandgridGridtype.brandgrid_gridtype_name"/></td>
  </tr>
  <tr>
    <td class="td5">单价&nbsp;：</td>
    <td class="td6"><s:property value="brandgrid.brandgridGridtype.unitprice"/>元整/格子/月</td>
  </tr>
  <tr>
    <td class="td5">格子空间大小&nbsp;：</td>
    <td class="td6"><s:property value="brandgrid.brandgridGridtype.hard_disk_space"/>MB/格子</td>	
  </tr>
    <tr>
    <td class="td5">格子客容纳商品数量&nbsp;：</td>
    <td class="td6"><s:property value="brandgrid.brandgridGridtype.can_show_goods"/>个/格子</td>	
  </tr>
    <tr>
    <td class="td5">每天可置顶商品机会&nbsp;：</td>
    <td class="td6"><s:property value="brandgrid.brandgridGridtype.LZ_note"/>次/格子</td>	
  </tr>
  <tr>
    <td class="td5">每天可置顶优惠机会&nbsp;：</td>
    <td class="td6">2次/格子</td>	
  </tr>
    <tr>
    <td class="td5">入驻时间&nbsp;：</td>
    <td class="td6"><s:property value="brandgrid.brandgrid_newtime.toLocaleString()"/></td>	
  </tr>
   <tr>
    <td class="td5">最近激活时间&nbsp;：</td>
    <td class="td6"><s:property value="brandgrid.brandgrid_starttime.toLocaleString()"/></td>	
  </tr>
   <tr>
    <td class="td5">最近租用时间&nbsp;：</td>
    <td class="td6"><s:property value="brandgrid.hireTime"/>个月</td>	
  </tr>
    <tr>
    <td class="td5">结束时间&nbsp;：</td>
    <td class="td6"><s:property value="brandgrid.brandgrid_endtime.toLocaleString()"/></td>	
  </tr>
</table>
</body>
</html>
