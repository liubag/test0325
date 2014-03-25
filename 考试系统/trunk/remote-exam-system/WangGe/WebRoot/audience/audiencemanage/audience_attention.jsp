<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <title>无标题文档</title>
	<link href="${pageContext.request.contextPath}/audience/css/audience_attention.css" rel="stylesheet" type="text/css" />
	<script src="${pageContext.request.contextPath}/audience/js/jquery-1.6.4.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/audience/js/audience_attention.js" type="text/javascript"></script>
	<style type="text/css">
	#fengye td{
		height: 10px;
	}
	</style>
    </head>
    <body>   
      <%
		Integer page01 = (Integer)request.getAttribute("page");
		Integer hasPages = (Integer)request.getAttribute("hasPages");
		Integer type = (Integer)request.getAttribute("type");
		Long hasAttention = (Long) request.getAttribute("hasAttention");
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
			window.top.location = "myAttention.do?page="+select.value+"&type="+<%=type%> ;
	  	}
	  	
	</script>
 
 
 
 <div id="top">
 		<input type="hidden" id="type" value="<%=type %>"/>
         <span id="myGrid">
         <s:url id="url" action="myAttention">
				<s:param name="page">1</s:param>
				<s:param name="type">0</s:param>				
			    </s:url>
				<s:a href="%{url}" >我关注的格子</s:a>
         </span>
		 <span id="myGoods">
		  <s:url id="url" action="myAttention">
				<s:param name="page">1</s:param>
				<s:param name="type">1</s:param>
			    </s:url>
				<s:a href="%{url}" >我关注的商品</s:a>
		 </span>
		
</div>
<table cellspacing="0">
	 <s:if test="type==0">
	 <p align="center">品牌格子</p>
	 <table cellspacing="0">
	 	<tr>
    		<td class="td2">格子名称</td>
    		<td class="td2">最新优惠信息</td>    		
  		</tr>
  		<s:iterator value="myAttention1_l" status="st"> 
  			<tr>   		 
    		  <td class="td3"><s:property value="brandgridGrid.grid_name"/></td>    		  
    		  <td class="td3"><s:property value="brandgridPreferential.brandgrid_preferential"/></td>
    		</tr>	
    	</s:iterator>   
	 </table>
	 <br>
	 <p align="center">散租格子</p>
	 <table cellspacing="0">
	 	<tr>
    		<td class="td2">格子名称</td>
    		<td class="td2">最新优惠信息</td>    		
  		</tr>
  		<s:iterator value="myAttention2_l" status="st"> 
  			<tr>   		 
    		  <td class="td3"><s:property value="scatteredGrid.grid_name"/></td>    		  
    		  <td class="td3"><s:property value="scatteredGridPreferential.preferential_text"/></td>
    		</tr>	
    	</s:iterator>   
	 </table>	
	 </s:if>
   	 <s:elseif test="type==1">
   	 	 <p align="center">品牌商品</p>
		 <table cellspacing="0">
	 		<tr>
    			<td class="td2">图片</td>
    			<td class="td2">名称</td> 
    			<td class="td2">价钱</td> 
    			<td class="td2">折扣</td>    		
  			</tr>
  			<s:iterator value="myAttention1_l" status="st"> 
  			<tr>   		 
    		   <td class="td3"><img alt="" src="${pageContext.request.contextPath}<s:text name="brandimgPath" />/<s:property value="brandgrid.brandgrid_id"/>/<s:property value="brandgridGridOwner.brandgrid_gridowner_id"/>/<s:property value="brandgrid_goods_id"/>/<s:property value="goods_photoname1"/>"></td>
    		   <td class="td3"><s:property value="goods_name"/></td>
    		   <td class="td3"><s:property value="goods_price"/></td>   		 		
    		   <td class="td3"><s:property value="goods_ZK"/></td>
    		</tr>	
    		</s:iterator>   
	 	</table>
		 <br>
   	 	<p align="center">散租商品</p>
		 <table cellspacing="0">
	 		<tr>
    			<td class="td2">图片</td>
    			<td class="td2">名称</td> 
    			<td class="td2">价钱</td> 
    			<td class="td2">折扣</td>    		
  			</tr>
  			<s:iterator value="myAttention2_l" status="st"> 
  			<tr>   		 
    		   <td class="td3"><img alt="" src="${pageContext.request.contextPath}<s:text name="imgPath" />/<s:property value="gridid"/>/<s:property value="goods_id"/>/<s:property value="scatteredGridGoods.goods_photoname1"/>"></td>
    		   <td class="td3"><s:property value="goods_name"/></td>
    		   <td class="td3"><s:property value="goods_price"/></td>   		 		
    		   <td class="td3">没有折扣</td>
    		</tr>	
    		</s:iterator>   
	 	</table>
   	 </s:elseif>
	<br>



	<table id="fengye" width="100%" border="0">
			<tr>
			<td align="center"><span id="page2"><s:property value="page"/></span>/<s:property value="hasPages"/></td>
			<td align="center">
				<s:url id="url" action="myAttention">
				<s:param name="page">1</s:param>
				<s:param name="type"><%=type%></s:param>
			    </s:url>
				<s:a href="%{url}" onclick="return justNextPage();">第一页</s:a>
			</td>
			<td align="center">
				<s:url id="url" action="myAttention">
				<s:param name="page"><s:property value="page-1"/></s:param>
				<s:param name="type"><%=type%></s:param>
			   </s:url>
				<s:a href="%{url}" onclick="return justNextPage();">上一页</s:a>
			</td>
			<td align="center">
				<s:url id="url" action="myAttention">
				<s:param name="page"><s:property value="page+1"/></s:param>
				<s:param name="type"><%=type%></s:param>
				</s:url>
				<s:a href="%{url}" onclick="return justUpPage();">下一页</s:a>
			</td>
			<td align="center">
				<s:url id="url" action="myAttention">
				<s:param name="page"><s:property value="hasPages"/></s:param>
				<s:param name="type"><%=type%></s:param>
				</s:url>
				<s:a href="%{url}" onclick="return justUpPage();">最后一页</s:a>
			</td>
			<td align="center">
			跳转<s:select list="page_l" name="page" onchange="test(this);"/>
			</td>
			<td align="center">
			共有<%=hasAttention%>条记录
			</td>
			</tr>
		</table>
    </body>
</html>