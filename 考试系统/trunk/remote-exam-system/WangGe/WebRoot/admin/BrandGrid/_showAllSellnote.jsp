<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@taglib uri="/struts-tags" prefix="s"%>

<html>
<head>
	<title></title>
	<link href="${pageContext.request.contextPath}/admin/css/dialog.css" rel="stylesheet" type="text/css" />
	<script src="${pageContext.request.contextPath}/admin/js/jquery-latest.pack.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/admin/js/dialog.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/admin/js/jquery-1.5.1.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/admin/js/table_tr.js" type="text/javascript"></script>
	<link href="${pageContext.request.contextPath}/admin/css/table_tr.css" type="text/css" rel="stylesheet" />
		<script type="text/javascript" src="${pageContext.request.contextPath}/Daterangepicker/js/jquery-ui-1.7.1.custom.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/Daterangepicker/js/daterangepicker.jQuery.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/Daterangepicker/css/ui.daterangepicker.css" type="text/css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/Daterangepicker/css/redmond/jquery-ui-1.7.1.custom.css" type="text/css" title="ui-theme" />	
		<style type="text/css">
			body { font-size: 62.5%; }
			/*input {width: 196px; height: 1.1em; display:block;}*/
			input{float:left;}
		</style>
</head>

<body onload="refreshSize();">
<div >
	<hr/>
	<div style="margin-left:50px; width: 650px;margin-bottom: 10px; font-size: 16px;">
		当前位置：
		<s:if test="brandgrid_id!=null && brandgrid_id.length()>1">
			--><s:property value="brandgrid_name"/>
		</s:if>
		<s:if test="grid_num!=null && grid_num.length()>0">
			-->编号:<s:property value="grid_num"/>
		</s:if>
		<s:if test="grid_name!=null && grid_name.length()>0">
			-->格子:<s:property value="grid_name"/>
		</s:if>
		<input type="hidden" id="owner_status" value="<s:property value="owner_status"/>">
		<s:if test="owner_status.length()>0">
			-->全部
		</s:if>
		<s:else>
			--><s:property value="time"/>
		</s:else>
	</div>
	<hr/>
  <div id="zhuanghu" align="center">
  	<%
		Integer page01 = (Integer)request.getAttribute("page");
		Integer hasPages = (Integer)request.getAttribute("hasPages");
	 %>
	<script type="text/javascript">
	
		$(function(){
			$('#rangeB').daterangepicker({arrows:true});
			var height = $("body").height();
			$("#rightIframe",parent.parent.document.body).height(height +250);
			$("#_Iframe",parent.document.body).height(height + 50);
			
			 $('#sx').click(function(){
				var time = $("#rangeB").val();
				if(time!="点击选择筛选时间"){
					//筛选
					$("#_Iframe",parent.document.body).attr("src","showAllSellnote_by_page.do?page=1&owner_status=&time="+time );
				}
			 });
		})
	
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
	  		$("#_Iframe",parent.document.body).attr("src","showAllSellnote_by_page.do?page="+select.value );
	  	}
	  	
	  	function refreshSize() {
		var owner_status = $("#owner_status").val(); 
		
		if(owner_status == '0'){
			$("#status0").attr("class","select");
		}
	}	
	  	
	</script>
	
	<div id="other" style="width: 100%">
		<div style="float:left;margin-left: 50px;" id="status0">
			<s:url id="url" action="showAllSellnote_by_page">
				<s:param name="page">1</s:param>
				<s:param name="owner_status">0</s:param>
				<s:param name="time"></s:param>
			</s:url>
			<s:a href="%{url}" method="post"><SPAN style="font-size: 16px;">全部</SPAN> </s:a>	
		</div>
		<div style="float:left;">
			<div style="float:left; margin-left: 50px;" ><input style="height: 18px; width: 165px;" type="text" value="" id="rangeB" name="time_be" readonly="readonly" value="" onFocus="if (value =='点击选择筛选时间'){value =''}" onBlur="if (value ==''){value='点击选择筛选时间'}"/>  </div>
			<div style="float:right;"><input type="submit" value="筛选" id="sx"/></div>
		</div>
		</div>
		<br/>
		<table id="table2">
			<thead>
				<tr><th style="width: 100px;text-align: center;">操作类型</th><th style="text-align: center;">商品编号</th><th style="text-align: center;">所属品牌店</th><th style="text-align: center;">商品名称</th><th style="text-align: center;">市场价</th><th style="text-align: center;">数量*单价*折扣</th><th style="text-align: center;">出售时间</th><th style="width: 100px;text-align: center;">出售人员</th><th style="width: 100px;text-align: center;">回滚时间</th><th style="width: 100px;text-align: center;">出售人员</th></tr>
			</thead>
			<tbody>
		  	<s:iterator value="brandgridSalesman_l" status="st">
		  		<tr>
		  		<s:if test="do_type==3">
		  			<td style="text-align: center;">出售</td>
		  		</s:if>
		  		<s:elseif test="do_type==4">
		  			<td style="text-align: center;">已回滚</td>
		  		</s:elseif>
		  		<td><s:property value="brandgridGridOwner.brandgridGrid.addgoods_no"/>-<s:property value="goods_no"/></td>
		  		<td><s:property value="brandgrid.brandgrid_name"/></td>
		  		<td style="text-align: center;"><s:property value="do_name"/></td>
		  		<td style="text-align: center;"><s:property value="brandgridGoods.market_price"/></td>
		  		<td style="text-align: center;"><s:property value="do_amount"/> * <s:property value="do_privce"/> * <s:property value="discount"/>(<s:property value="brandgridGoods.unit"/>)= <s:property value="total_price"/></td>
		  		<td style="text-align: center;"><s:property value="do_time.toLocaleString()"/></td>
		  		<td><s:property value="brandgridSalesman.brandgrid_salesman_name"/></td>
		  		<s:if test="do_type==3">
		  			<td style="text-align: center;">---</td>
		  			<td style="text-align: center;">---</td>
		  		</s:if>
		  		<s:elseif test="do_type==4">
		  			
		  			<td style="text-align: center;"><s:property value="back_time.toLocaleString()"/></td>
		  			<td style="text-align: center;"><s:property value="back_salesman_name"/></td>
		  		</s:elseif>
		  		</tr>
		  	</s:iterator>
		</tbody>
		</table>
		<div id="other01">
		<table width="680" border="0" cellspacing="10" cellpadding="10">
			<tr>
			<td align="center"><s:property value="page"/>/<s:property value="hasPages"/></td>
			<td align="center">
				<s:url id="url" action="showAllSellnote_by_page">
			        <s:param name="page">1</s:param>
				</s:url>
				<s:a href="%{url}" onclick="return justNextPage();">第一页</s:a>
			</td>
			<td align="center">
				<s:url id="url" action="showAllSellnote_by_page">
			        <s:param name="page"><s:property value="page-1"/></s:param>
				</s:url>
				<s:a href="%{url}" onclick="return justNextPage();">上一页</s:a>
			</td>
			<td align="center">
				<s:url id="url" action="showAllSellnote_by_page">
			        <s:param name="page"><s:property value="page+1"/></s:param>
				</s:url>
				<s:a href="%{url}" onclick="return justUpPage();">下一页</s:a>
			</td>
			<td align="center">
				<s:url id="url" action="showAllSellnote_by_page">
			        <s:param name="page"><s:property value="hasPages"/></s:param>
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
		</div>
		</div>
</div>
</body>
</html>
