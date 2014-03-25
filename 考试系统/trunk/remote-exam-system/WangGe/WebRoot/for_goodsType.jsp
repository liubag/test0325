<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title></title>

	</head>

	<body>
	<div align="center">
	<p>品牌商品</p>
	<s:if test="brandGoods_l.size()==0">
	没有相关商品
	</s:if>
	<s:else>
	<s:iterator value="brandGoods_l">
	<s:property value="brandgrid_goods_id"/> ----- <s:property value="goods_name"/><br/>
	</s:iterator>
	</s:else>
	
	<p>散租商品</p>
	<s:if test="scatteredGoods_l.size()==0">
	没有相关商品
	</s:if>
	<s:else>
	<s:iterator value="scatteredGoods_l">
	<s:property value="goods_id"/> ----- <s:property value="goods_name"/><br/>
	</s:iterator>
	</s:else>
	</div>
	
	<%
		Integer page01 = (Integer)request.getAttribute("page");
		Integer hasPages = (Integer)request.getAttribute("hasPages");
	 %>
	<script type="text/javascript"><!--
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
	  	//	$("#jilu",parent.document.body).attr("src","show_All_Notes_brandOwner.do?page="+select.value+"&time=&sales_id=&brandgrid_Grid_id=&owner_status=1");	
	  	}
	  	
	</script>
<input type="hidden" value="<s:property value="filter_type"/>" id="filter_type"/>
<input type="hidden" value="<s:property value="type_id"/>" id="type_id"/>
<input type="hidden" value="<s:property value="show_type"/>" id="show_type"/>
<table id="fengye" width="100%" border="0" >
			<tr>
			<td align="center"><s:property value="page"/>/<s:property value="hasPages"/></td>
			<td align="center">
				<s:url id="url" action="showAllGoods_aa">
				<s:param name="page">1</s:param>
				<s:param name="filter_type"><s:property value="filter_type"/></s:param>
				<s:param name="type_id"><s:property value="type_id"/></s:param>
				<s:param name="show_type"><s:property value="show_type"/></s:param>
			    </s:url>
				<s:a href="%{url}" onclick="return justNextPage();">第一页</s:a>
			</td>
			<td align="center">
				<s:url id="url" action="showAllGoods_aa">
				<s:param name="page"><s:property value="page-1"/></s:param>
				<s:param name="filter_type"><s:property value="filter_type"/></s:param>
				<s:param name="type_id"><s:property value="type_id"/></s:param>
				<s:param name="show_type"><s:property value="show_type"/></s:param>
			   </s:url>
				<s:a href="%{url}" onclick="return justNextPage();">上一页</s:a>
			</td>
			<td align="center">
				<s:url id="url" action="showAllGoods_aa">
				<s:param name="page"><s:property value="page+1"/></s:param>
				<s:param name="filter_type"><s:property value="filter_type"/></s:param>
				<s:param name="type_id"><s:property value="type_id"/></s:param>
				<s:param name="show_type"><s:property value="show_type"/></s:param>
				</s:url>
				<s:a href="%{url}" onclick="return justUpPage();">下一页</s:a>
			</td>
			<td align="center">
				<s:url id="url" action="showAllGoods_aa">
				<s:param name="page"><s:property value="hasPages"/></s:param>
				<s:param name="filter_type"><s:property value="filter_type"/></s:param>
				<s:param name="type_id"><s:property value="type_id"/></s:param>
				<s:param name="show_type"><s:property value="show_type"/></s:param>
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
