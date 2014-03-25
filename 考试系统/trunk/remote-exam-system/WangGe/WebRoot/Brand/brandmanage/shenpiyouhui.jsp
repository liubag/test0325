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
				var sc = $("#sc").val();
				var owner_status = $("#owner_status").val();
		  		$("#iframe",parent.document.body).attr("src","show_All_Prefere_brandOwner.do?page=1&&brandgrid_Gridnum="+s+"&statu_choice="+sc+"&owner_status="+owner_status);
			}
   		})
	})
        function refreshSize() {
        	var owner_status = $("#owner_status").val(); 
        	if(owner_status == '1'){
                  $("#dangqian").attr("class","yes");
                  $("#yishenpi").attr("class","no");
            }else{
                  $("#dangqian").attr("class","no");
                  $("#yishenpi").attr("class","yes");
            }
        } 
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
<link href="${pageContext.request.contextPath}/Brand/css/shenpiyouhui.css" rel="stylesheet" type="text/css" />
<style type="text/css">
#fengye td{
	height: 10px;
}
</style>
</head>

<body onload="refreshSize()">
<input type="hidden" id="sc" value="<s:property value="statu_choice"/>"/>
<input type="hidden" id="st" value="<s:property value="brandgrid_Gridnum"/>"/>
<input type="hidden" id="owner_status" value="<s:property value="owner_status"/>"/>
<div id="top">
         <span id="dangqian">
         <s:url id="url" action="show_All_Prefere_brandOwner">
			<s:param name="page">1</s:param>
			<s:param name="statu_choice"><s:property value="statu_choice"/></s:param>
			<s:param name="owner_status">1</s:param>
			<s:param name="brandgrid_Gridnum"><s:property value="brandgrid_Gridnum"/></s:param>
		</s:url>
		<s:a href="%{url}">当前需要审批</s:a>
         </span>
		 <span id="yishenpi">
		  <s:url id="url" action="show_All_Prefere_brandOwner">
			<s:param name="page">1</s:param>
			<s:param name="statu_choice"><s:property value="statu_choice"/></s:param>
			<s:param name="owner_status">2</s:param>
			<s:param name="brandgrid_Gridnum"><s:property value="brandgrid_Gridnum"/></s:param>
		</s:url>
		<s:a href="%{url}"> 今天审批记录</s:a>
		</span>
		 <span>格子编号：<s:property value="brandgrid_Gridnum"/></br><input id="sou" type="text" class="sou"  value="请输入格子编号" onfocus="if(this.value=='请输入格子编号'){this.value=''};" onblur="if(this.value==''){this.value='请输入格子编号'};" onkeyup="ku();" /><input id="sousou" type="button" value="搜"/></span>
</div>
<table cellspacing="0">
  <tr>
    <td width="10%" class="td2">所属格子</td>
    <s:if test="owner_status==1">
    <td width="10%" class="td2">申请时间</td>
    <td width="10%" class="td2">过期时间</td>
    </s:if>
    <s:elseif test="owner_status==2">
    <td width="10%" class="td2">申请时间</td>
    <td width="10%" class="td2">操作时间</td>
    </s:elseif>
    <td width="62%" class="td2">优惠信息</td>
    <td width="8%" class="td2">状态</td>
  </tr>
    <s:iterator value="brandgridPreferential_l" status="st">
    <tr>
    <td class="td3"><s:property value="brandgridGridOwner.brandgridGrid.brandgrid_grid_number"/></td>
  	<td class="td3"><s:property value="brandgrid_preferential_sqtime.toLocaleString()"/></td>
   <s:if test="owner_status==1">
     <td class="td3"><s:property value="brandgrid_preferential_dotime.toLocaleString()"/></td>
    </s:if>
    <s:elseif test="owner_status==2">
     <td class="td3">
     <s:if test="brandgrid_preferential_status==5">
     <s:property value="brandgrid_preferential_maksuretime.toLocaleString()"/>
     </s:if>
     <s:elseif test="brandgrid_preferential_status==6">
     <s:property value="brandgrid_preferential_maksuretime.toLocaleString()"/>
     </s:elseif>
     <s:elseif test="brandgrid_preferential_status==7">
     <s:property value="brandgrid_preferential_uptime.toLocaleString()"/>
     </s:elseif>
     <s:elseif test="brandgrid_preferential_status==8">
     <s:property value="brandgrid_preferential_downtime.toLocaleString()"/>
     </s:elseif>
     </td>
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
	<s:if test="brandgrid_preferential_status==1">
		申请下架
	</s:if>
	<s:elseif test="brandgrid_preferential_status==2">
		申请上架
	</s:elseif>
	<s:elseif test="brandgrid_preferential_status==5">
		申上失败
	</s:elseif>
	<s:elseif test="brandgrid_preferential_status==6">
		申下失败
	</s:elseif>
	<s:elseif test="brandgrid_preferential_status==7">
		已上架
	</s:elseif>
	<s:elseif test="brandgrid_preferential_status==8">
		已下架
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
		
		
		function zhuxiao(){
			
		}
		
		function test(select){
			var s = $("#st").val();
			var sc = $("#sc").val();
			var owner_status = $("#owner_status").val();
	  		$("#iframe",parent.document.body).attr("src","show_All_Prefere_brandOwner.do?page="+select.value+"&&brandgrid_Gridnum="+s+"&statu_choice="+sc+"&owner_status="+owner_status);
	  	}
	  	
	</script>

<table id="fengye" width="100%" border="0" >
			<tr>
			<td align="center"><s:property value="page"/>/<s:property value="hasPages"/></td>
			<td align="center">
				<s:url id="url" action="show_All_Prefere_brandOwner">
				<s:param name="page">1</s:param>
				<s:param name="owner_status"><s:property value="owner_status"/></s:param>
				<s:param name="statu_choice"><s:property value="statu_choice"/></s:param>
				<s:param name="brandgrid_Gridnum"><s:property value="brandgrid_Gridnum"/></s:param>
			    </s:url>
				<s:a href="%{url}" onclick="return justNextPage();">第一页</s:a>
			</td>
			<td align="center">
				<s:url id="url" action="show_All_Prefere_brandOwner">
				<s:param name="page"><s:property value="page-1"/></s:param>
				<s:param name="owner_status"><s:property value="owner_status"/></s:param>
				<s:param name="statu_choice"><s:property value="statu_choice"/></s:param>
				<s:param name="brandgrid_Gridnum"><s:property value="brandgrid_Gridnum"/></s:param>
			   </s:url>
				<s:a href="%{url}" onclick="return justNextPage();">上一页</s:a>
			</td>
			<td align="center">
				<s:url id="url" action="show_All_Prefere_brandOwner">
				<s:param name="page"><s:property value="page+1"/></s:param>
				<s:param name="owner_status"><s:property value="owner_status"/></s:param>
				<s:param name="statu_choice"><s:property value="statu_choice"/></s:param>
				<s:param name="brandgrid_Gridnum"><s:property value="brandgrid_Gridnum"/></s:param>
				</s:url>
				<s:a href="%{url}" onclick="return justUpPage();">下一页</s:a>
			</td>
			<td align="center">
				<s:url id="url" action="show_All_Prefere_brandOwner">
				<s:param name="page"><s:property value="hasPages"/></s:param>
				<s:param name="owner_status"><s:property value="owner_status"/></s:param>
				<s:param name="statu_choice"><s:property value="statu_choice"/></s:param>
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
