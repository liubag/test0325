<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
<script src="${pageContext.request.contextPath}/Brand/js/jquery-1.6.4.min.js" type="text/javascript"></script>
<link href="${pageContext.request.contextPath}/Brand/css/gezhuxinxi.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
$(function(){
       $("tr:even").addClass("even");
       $('#zl').click(function(){
       		$("#table_info").hide();
			$("#myDialog").show();
			$.ajax({
				type: "POST",
				url: "/WangGe/cleanPhotoFolder_gridowner.do",
				dataType: 'text',
				error:function(data){
								
				},
				success: function(data){
					if(data!="fail"){
						$("#hs").html(data);
					}
				},
				complete:function(){
					$("#myDialog").hide();
					$("#table_info").show();
				}
			});
			return false;
       });
})
</script>
<link href="${pageContext.request.contextPath}/Brand/css/zhanghuxinxi.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div id="top">账户信息</div>
<table cellspacing="0" id="table_info">
  <tr>
    <td class="td5">法人&nbsp;：</td>
    <td class="td6"><s:property value="brandgridGridOwner.brandgrid_gridowner_name"/>(登录名：<s:property value="brandgridGridOwner.brandgrd_gridowner_username"/>)</td>
  </tr>
  <tr>
    <td class="td5">联系号码&nbsp;：</td>
    <td class="td6"><s:property value="brandgridGridOwner.brandgrid_gridowner_phone"/></td>
  </tr>
  <tr>
    <td class="td5">联系QQ&nbsp;：</td>
    <td class="td6"><s:property value="brandgridGridOwner.brandgrid_gridowner_qq"/></td>
  </tr>
  <tr>
    <td class="td5">联系Email&nbsp;：</td>
    <td class="td6"><s:property value="brandgridGridOwner.brandgrid_gridowner_email"/>
    </td>
  </tr>
  <tr>
    <td class="td5">所属品牌&nbsp;：</td>
    <td class="td6">
    <s:property value="brandgridGridOwner.brandgrid.brandgrid_name"/>
    </td>
  </tr>
  <tr>
    <td class="td5">品牌客服&nbsp;：</td>
    <td class="td6"><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=<s:property value="brandgridGridOwner.brandgrid.brandgrid_qq"/>&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:<s:property value="brandgrid.brandgrid_qq"/>:41" alt="点击这里给我发消息" title="点击这里给我发消息" /></a><s:property value="brandgridGridOwner.brandgrid.brandgrid_qq"/>	
  </tr>
  <tr>
    <td class="td5">格子编号&nbsp;：</td>
    <td class="td6"><s:property value="brandgridGridOwner.brandgridGrid.brandgrid_grid_number"/></td>
  </tr>
  <tr>
    <td class="td5">格子名称&nbsp;：</td>
    <td class="td6">
    <s:property value="brandgridGridOwner.grid_name"/>
    </td>
  </tr>
    <tr>
    <td class="td5">可容纳商品数量&nbsp;：</td>
    <td class="td6"><s:property value="brandgridGridOwner.brandgrid.brandgridGridtype.can_show_goods"/>个/格子</td>	
  </tr>
  <tr>
    <td class="td5">全部商品数&nbsp;：</td>
    <td class="td6"><s:property value="brandgridGridOwner.brandgrid_grid_hasgoods"/></td>	
  </tr>
   <tr>
    <td class="td5">上架商品数量&nbsp;：</td>
    <td class="td6"><s:property value="brandgridGridOwner.u_hasgoods"/></td>	
  </tr>
    <tr>
    <td class="td5">每天可置顶商品机会&nbsp;：</td>
    <td class="td6"><s:property value="brandgridGridOwner.LZ_note"/>次/格子</td>	
  </tr>
  <tr>
    <td class="td5">每天可置顶优惠机会&nbsp;：</td>
    <td class="td6"><s:property value="brandgridGridOwner.LZ_preferential"/>次/格子</td>	
  </tr>
    <tr>
    <td class="td5">入驻时间&nbsp;：</td>
    <td class="td6"><s:property value="brandgridGridOwner.brandgrid_gridowner_newtime.toLocaleString()"/></td>	
  </tr>
    <tr>
    <td class="td5">空间（已用/可用）&nbsp;：</td>
    <td class="td6"><span id="hs" style="text-align: left; margin-left: 0px;"><s:property value="brandgridGridOwner.brandgrid_hasused_space"/></span>/<s:property value="brandgridGridOwner.brandgrid.brandgridGridtype.hard_disk_space"/>MB
    <a href="" id="zl">[整理空间]</a>
    </td>	
  </tr>
</table>

	<div id="myDialog" title="My Dialog" style="display:none;text-align:center; padding-top: 100px;">  
			<div style="margin-bottom: 30px;" id="waiting">整理空间需要一定时间，请等待...</div>
			<div>  
				<img alt="" src="../pic/empty_180_180.gif"/> 
			</div>   
	</div>  
</body>
</html>
