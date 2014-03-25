<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>其他优惠状态</title>
<script src="${pageContext.request.contextPath}/Brand/js/jquery-1.6.4.min.js" type="text/javascript"></script>

<style type="text/css">
#fengye td{
	height: 10px;
}
</style>
<link href="${pageContext.request.contextPath}/Brand/css/qitayouhuizhuangtai.css" rel="stylesheet" type="text/css" />
</head>

<body>

<table cellspacing="0">
  <tr>
   <td width="13%" class="td2">(上架)申请时间</td>
    <td width="13%" class="td2">(下架)过期时间</td>
    <td width="54%" class="td2">优惠信息</td>
    <td width="10%" class="td2">状态</td>
    <td width="10%" class="td2">操作</td>
  </tr>
  <s:iterator value="brandgridPreferential_l" status="st">
  <tr>
    <s:if test="brandgrid_preferential_status==8">
   		 <td class="td3"><s:property value="brandgrid_preferential_uptime.toLocaleString()"/></td>
   		 <td class="td3"><s:property value="brandgrid_preferential_downtime.toLocaleString()"/></td>
    </s:if>
    <s:elseif test="brandgrid_preferential_status==2 || brandgrid_preferential_status==3">
    	<td class="td3"><s:property value="brandgrid_preferential_sqtime.toLocaleString()"/></td>
    	 <td class="td3"><s:property value="brandgrid_preferential_outtime.toLocaleString()"/></td>
    </s:elseif>
    <s:elseif test="brandgrid_preferential_status==5">
    	<td class="td3"><s:property value="brandgrid_preferential_sqtime.toLocaleString()"/></td>
    	 <td class="td3"><s:property value="brandgrid_preferential_maksuretime.toLocaleString()"/></td>
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
    <s:elseif test="brandgrid_preferential_status==5">
    	申上失败
    </s:elseif>
    <s:elseif test="brandgrid_preferential_status==3">
    	申上过期
    </s:elseif>
    </td>
    <td class="td3">
    <s:if test="brandgrid_preferential_status==8">
    <p>
    	<s:url id="url" action="preSQSJ_gridowner">
    		 	<s:param name="brandgrid_preferential_id"><s:property value="brandgrid_preferential_id"/></s:param>
				<s:param name="page"><s:property value="page"/></s:param>
				<s:param name="owner_status"><s:property value="owner_status"/></s:param>
			</s:url>
			<s:a href="%{url}"  onclick="return dele();">申请上架</s:a>
    	</p>
    </s:if>
    <s:elseif test="brandgrid_preferential_status==2">
    <p>
    		<s:url id="url" action="quxiaoPre_girdOwner">
    		 	<s:param name="brandgrid_preferential_id"><s:property value="brandgrid_preferential_id"/></s:param>
				<s:param name="page"><s:property value="page"/></s:param>
				<s:param name="owner_status"><s:property value="owner_status"/></s:param>
			</s:url>
			<s:a href="%{url}"  onclick="return quxiao();">取消申请</s:a>
    		</p>
    </s:elseif>
    <s:elseif test="brandgrid_preferential_status==5 || brandgrid_preferential_status==3">
    	<s:url id="url" action="chongxinPre_girdOwner">
    		 	<s:param name="brandgrid_preferential_id"><s:property value="brandgrid_preferential_id"/></s:param>
				<s:param name="page"><s:property value="page"/></s:param>
				<s:param name="owner_status"><s:property value="owner_status"/></s:param>
			</s:url>
			<s:a href="%{url}" onclick="return chongxin();">重新申请</s:a>
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
<s:if test="owner_status!=null">


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
	  		$("#iframe",parent.document.body).attr("src","showAllPre_page_gridowner.do?page="+select.value+"&owner_status=5");
	  	}
	  	
	</script>

<table id="fengye" width="100%" border="0">
			<tr>
			<td align="center"><span id="page2"><s:property value="page"/></span>/<s:property value="hasPages"/></td>
			<td align="center">
				<s:url id="url" action="showAllPre_page_gridowner">
				<s:param name="page">1</s:param>
				<s:param name="owner_status">5</s:param>
			    </s:url>
				<s:a href="%{url}" onclick="return justNextPage();">第一页</s:a>
			</td>
			<td align="center">
				<s:url id="url" action="showAllPre_page_gridowner">
				<s:param name="page"><s:property value="page-1"/></s:param>
				<s:param name="owner_status">5</s:param>
			   </s:url>
				<s:a href="%{url}" onclick="return justNextPage();">上一页</s:a>
			</td>
			<td align="center">
				<s:url id="url" action="showAllPre_page_gridowner">
				<s:param name="page"><s:property value="page+1"/></s:param>
				<s:param name="owner_status">5</s:param>
				</s:url>
				<s:a href="%{url}" onclick="return justUpPage();">下一页</s:a>
			</td>
			<td align="center">
				<s:url id="url" action="showAllPre_page_gridowner">
				<s:param name="page"><s:property value="hasPages"/></s:param>
				<s:param name="owner_status">5</s:param>
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
		</s:if>
</body>
</html>
