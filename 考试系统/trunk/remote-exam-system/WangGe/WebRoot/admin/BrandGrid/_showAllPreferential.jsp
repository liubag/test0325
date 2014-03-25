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
</head>

<body onload="refreshSize();">
<div >
	<hr/>
	<input type="hidden" id="owner_status" value="<s:property value="owner_status"/>">
	<input type="hidden" id="time_status" value="<s:property value="time_status"/>">
	<div style="margin-left:50px; width: 500px;margin-bottom: 10px;">
		当前位置：
		<s:if test="brandgrid_id!=null && brandgrid_id.length()>1">
			--><s:property value="brandgrid_name"/>
		</s:if>
		<s:if test="time_status==2">
			-->全部
		</s:if>
		<s:elseif test="time_status.length()==0">
			-->全部-->已下架
		</s:elseif>
		<s:elseif test="time_status==1">
			-->今天
		</s:elseif>
		<s:elseif test="time_status==0">
			-->昨天、以前
		</s:elseif>
		<s:if test="owner_status==7">
			-->已上架
		</s:if>
		<s:elseif test="owner_status==8">
			-->已下架
		</s:elseif>
	</div>
	<hr/>
  <div id="zhuanghu" align="center">
  	<%
		Integer page01 = (Integer)request.getAttribute("page");
		Integer hasPages = (Integer)request.getAttribute("hasPages");
	 %>
	<script type="text/javascript">
	
		$(function(){
	
			var height = $("body").height();
			$("#rightIframe",parent.parent.document.body).height(height +200);
			$("#_Iframe",parent.document.body).height(height + 50);
			var tip = $("#tip").val();
			if(tip != "" || tip .length > 0){
				alert(tip);
			}
			var time_status = $("#time_status").val(); 
			if(time_status == ""){
				$("#other").hide();
				$("#other01").hide();
			}
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
	  		$("#_Iframe",parent.document.body).attr("src","showAllBP_by_page.do?page="+select.value );
	  	}
	  	
	  	function refreshSize() {
		var owner_status = $("#owner_status").val(); 
		var time_status = $("#time_status").val(); 
		if(owner_status == '7'){
			$("#status0").attr("class","nuselect");
			$("#status1").attr("class","select");
		}else{
			$("#status0").attr("class","select");
			$("#status1").attr("class","nuselect");
		}
		
		if(time_status == '2'){
			$("#status00").attr("class","nuselect");
			$("#status01").attr("class","nuselect");
			$("#status02").attr("class","select");
		}else if(time_status == '1'){
			$("#status00").attr("class","nuselect");
			$("#status01").attr("class","select");
			$("#status02").attr("class","nuselect");
		}else{
			$("#status00").attr("class","select");
			$("#status01").attr("class","nuselect");
			$("#status02").attr("class","nuselect");
		}
	}	
	  	
	</script>
	
	<div id="other01">
		<div style="float:left;margin-left: 50px;" id="status02">
			<s:url id="url" action="showAllBP_by_page">
				<s:param name="page">1</s:param>
				<s:param name="time_status">2</s:param>
			</s:url>
			<s:a href="%{url}" method="post">全部 </s:a>	
		</div>
		<div style="float:left;">&nbsp;&nbsp;|&nbsp;&nbsp;</div>
		<div style="float:left;" id="status01">
			<s:url id="url" action="showAllBP_by_page">
				<s:param name="page">1</s:param>
				<s:param name="time_status">1</s:param>
			</s:url>
			<s:a href="%{url}" method="post"> 今天 </s:a>	
		</div>
		<div style="float:left;">&nbsp;&nbsp;|&nbsp;&nbsp;</div>
		<div style="float:left;" id="status00">
			<s:url id="url" action="showAllBP_by_page">
				<s:param name="page">1</s:param>
				<s:param name="time_status">0</s:param>
			</s:url>
			<s:a href="%{url}" method="post"> 昨天、以前</s:a>	
		</div>
		</div>
		<br/>
		<div id="other">
		<div style="float:left;margin-left: 50px;" id="status1">
			<s:url id="url" action="showAllBP_by_page">
				<s:param name="page">1</s:param>
				<s:param name="owner_status">7</s:param>
			</s:url>
			<s:a href="%{url}" method="post">已上架 </s:a>	
		</div>
		<div style="float:left;">&nbsp;&nbsp;|&nbsp;&nbsp;</div>
		<div style="float:left;" id="status0">
			<s:url id="url" action="showAllBP_by_page">
				<s:param name="page">1</s:param>
				<s:param name="owner_status">8</s:param>
			</s:url>
			<s:a href="%{url}" method="post"> 已下架 </s:a>	
		</div>
		</div>
		<br/>
		<input type="hidden" id="tip" value="<s:property value="tip"/>"/>
		<table id="table2">
			<thead>
				<tr><th style="text-align: center;">内容</th><th style="text-align: center;">所属格子</th><th style="text-align: center;">所属品牌</th><th style="text-align: center;">上架时间</th><th style="text-align: center;">下架时间</th><th style="text-align: center;">状态</th></tr>
			</thead>
			<tbody>
		  	<s:iterator value="brandgridPreferential_l" status="st">
		  		<tr>
		  		<td>
		  		<s:property value="brandgrid_preferential"/>
			     <s:if test="brandgrid_qcStatus==1">
			    {{全场优惠：<s:property value="brandgrid_qcZK"/> 折扣}}
			     </s:if>
			     <s:elseif test="brandgrid_zhekou.length() > 0 && brandgrid_qcStatus==0">
			     	{{折扣优惠：<s:property value="brandgrid_zhekou" escape="false"/> }}
			     </s:elseif>
		  		</td>
		  		<td><s:property value="brandgridGridOwner.brandgridGrid.brandgrid_grid_name"/></td>
		  		<td><s:property value="brandgrid.brandgrid_name"/></td>
		  		<td><s:property value="brandgrid_preferential_uptime"/></td>
		  		<td><s:property value="brandgrid_preferential_downtime"/></td>
		  		<td>
		  		<s:if test="brandgrid_preferential_status==7">
		  			已上架
		  		</s:if>
		  		<s:elseif test="brandgrid_preferential_status==8">
		  			已下架
		  		</s:elseif>
		  		</td>
		  		</tr>
		  	</s:iterator>
		</tbody>
		</table>
		<div id="other02">
		<table width="680" border="0" cellspacing="10" cellpadding="10">
			<tr>
			<td align="center"><s:property value="page"/>/<s:property value="hasPages"/></td>
			<td align="center">
				<s:url id="url" action="showAllBP_by_page">
			        <s:param name="page">1</s:param>
				</s:url>
				<s:a href="%{url}" onclick="return justNextPage();">第一页</s:a>
			</td>
			<td align="center">
				<s:url id="url" action="showAllBP_by_page">
			        <s:param name="page"><s:property value="page-1"/></s:param>
				</s:url>
				<s:a href="%{url}" onclick="return justNextPage();">上一页</s:a>
			</td>
			<td align="center">
				<s:url id="url" action="showAllBP_by_page">
			        <s:param name="page"><s:property value="page+1"/></s:param>
				</s:url>
				<s:a href="%{url}" onclick="return justUpPage();">下一页</s:a>
			</td>
			<td align="center">
				<s:url id="url" action="showAllBP_by_page">
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
