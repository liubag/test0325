<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
<script src="${pageContext.request.contextPath}/Brand/js/jquery-1.6.4.min.js" type="text/javascript"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $('#sousou').click(function(){
		     var s=$('#sou').val();
			 if( s =="请输入格子编号"){
					alert("请输入格子编号");
					return false;
					}else{
					    $("#iframe",parent.document.body).attr("src","show_All_Prefere_brandOwner.do?page=1&brandgrid_Gridnum="+s + "&statu_choice=8");
					}
    })
	})
	
	var before_txt = "";
	function ku(){
		var soutxt = $("#sou").val();
		if(soutxt.length <= 10){
			before_txt = soutxt;
		}else{
			$("#sou").attr("value",before_txt);
		}
	}
</script>
<link href="${pageContext.request.contextPath}/Brand/css/dangqianshangjiayouhui.css" rel="stylesheet" type="text/css" />
<style type="text/css">
#fengye td{
	height: 10px;
}
</style>
</head>

<body>
<input type="hidden" id="st" value="<s:property value="brandgrid_Gridnum"/>"/>
<div id="top">
		<div id="s1">格子编号：<s:property value="brandgrid_Gridnum"/></div>
<div id="s">&nbsp; </div>
<div id="s2"><input name="" type="text" id="sou" class="sou"  value="请输入格子编号" onfocus="if(this.value=='请输入格子编号'){this.value=''};" onblur="if(this.value==''){this.value='请输入格子编号'};"  onkeyup="ku();"/><input name="" id="sousou" type="button" value="搜"/></div>
</div>
<table cellspacing="0">
  <tr>
   <td width="13%" class="td2">所属格子</td>
    <td width="13%" class="td2">(上架)申请时间</td>
    <td width="13%" class="td2">(下架)过期时间</td>
    <td width="51%" class="td2">优惠信息</td>
    <td width="10%" class="td2">状态</td>
  </tr>
  <s:iterator value="brandgridPreferential_l" status="st">
   <tr>
    <td class="td3"><s:property value="brandgridGridOwner.brandgridGrid.brandgrid_grid_number"/></td>
    <s:if test="brandgrid_preferential_status==8">
   		 <td class="td3"><s:property value="brandgrid_preferential_uptime.toLocaleString()"/></td>
   		 <td class="td3"><s:property value="brandgrid_preferential_downtime.toLocaleString()"/></td>
    </s:if>
    <s:elseif test="brandgrid_preferential_status==2">
    	<td class="td3"><s:property value="brandgrid_preferential_sqtime.toLocaleString()"/></td>
    	 <td class="td3"><s:property value="brandgrid_preferential_outtime.toLocaleString()"/></td>
    </s:elseif>
     
    <td class="td4">
     &nbsp;&nbsp;&nbsp;&nbsp;<s:property value="brandgrid_preferential"/>
     <s:if test="brandgrid_qcStatus==1">
    {{全场优惠：<s:property value="brandgrid_qcZK"/> 折扣}}
     </s:if>
     <s:elseif test="brandgrid_zhekou.length() > 0 && brandgrid_qcStatus==0">
     	{{折扣优惠：<s:property value="brandgrid_zhekou" escape="false"/> }}
     </s:elseif>
    </td>
    <td class="td3">
     <s:if test="brandgrid_preferential_status==8">
   		已下架
    </s:if>
    <s:elseif test="brandgrid_preferential_status==2">
    	申请上架
    </s:elseif>
    </td>
  </tr>
  </s:iterator>
    <tr>
    <td class="td5">&nbsp;</td>
    <td class="td5">&nbsp;</td>
    <td class="td5">&nbsp;</td>
    <td class="td5">&nbsp;</td>
  </tr>
</table>
<%
		Integer page01 = (Integer)request.getAttribute("page");
		Integer hasPages = (Integer)request.getAttribute("hasPages");
	 %>
	<script type="text/javascript">
		var page = <%=page01 %>;
		var hasPages = <%=hasPages%>;
		
		function justUpPage(){
			if(page == hasPages){
				 alert("已经是最后一页了！");
				 return false;
			}	 
		}
		
		function justNextPage(){
			if(page == 0 || page == 1){
				 alert("已经是第一页了！");
				 return false;
			}	 
		}
		
		
		function test(select){
			var s = $("#st").val();
	  		$("#iframe",parent.document.body).attr("src","show_All_Prefere_brandOwner.do?page="+select.value+"&&brandgrid_Gridnum="+s+"&statu_choice=8");
	  	}
	  	
	</script>

<table id="fengye" width="100%" border="0" >
			<tr>
			<td align="center"><s:property value="page"/>/<s:property value="hasPages"/></td>
			<td align="center">
				<s:url id="url" action="show_All_Prefere_brandOwner">
				<s:param name="page">1</s:param>
				<s:param name="statu_choice">8</s:param>
				<s:param name="brandgrid_Gridnum"><s:property value="brandgrid_Gridnum"/></s:param>
			    </s:url>
				<s:a href="%{url}" onclick="return justNextPage();">第一页</s:a>
			</td>
			<td align="center">
				<s:url id="url" action="show_All_Prefere_brandOwner">
				<s:param name="page"><s:property value="page-1"/></s:param>
				<s:param name="statu_choice">8</s:param>
				<s:param name="brandgrid_Gridnum"><s:property value="brandgrid_Gridnum"/></s:param>
			   </s:url>
				<s:a href="%{url}" onclick="return justNextPage();">上一页</s:a>
			</td>
			<td align="center">
				<s:url id="url" action="show_All_Prefere_brandOwner">
				<s:param name="page"><s:property value="page+1"/></s:param>
				<s:param name="statu_choice">8</s:param>
				<s:param name="brandgrid_Gridnum"><s:property value="brandgrid_Gridnum"/></s:param>
				</s:url>
				<s:a href="%{url}" onclick="return justUpPage();">下一页</s:a>
			</td>
			<td align="center">
				<s:url id="url" action="show_All_Prefere_brandOwner">
				<s:param name="page"><s:property value="hasPages"/></s:param>
				<s:param name="statu_choice">8</s:param>
				<s:param name="brandgrid_Gridnum"><s:property value="brandgrid_Gridnum"/></s:param>
				</s:url>
				<s:a href="%{url}" onclick="return justUpPage();">最后一页</s:a>
			</td>
			<td align="center">
			跳转<s:select list="page_l" name="page" onchange="test(this);"/>
			</td>
			<td align="center">
			共有<s:property value="has"/>条记录
			</td>
			</tr>
		</table>
</body>
</html>
