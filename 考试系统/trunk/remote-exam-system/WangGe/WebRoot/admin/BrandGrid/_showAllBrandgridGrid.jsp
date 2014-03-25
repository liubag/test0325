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
	<div style="margin-left:50px; width: 500px;margin-bottom: 10px;">
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
		<s:if test="owner_status==2">
			-->全部格子
		</s:if>
		<s:elseif test="owner_status==1">
			-->已分配格子
		</s:elseif>
		<s:elseif test="owner_status==0">
			-->未分配格子
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
			var owner_status = $("#owner_status").val(); 
			if(owner_status == -1){
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
	  		$("#_Iframe",parent.document.body).attr("src","showAllGrid_by_page.do?page="+select.value );
	  	}
	  	
	  	function refreshSize() {
		var owner_status = $("#owner_status").val(); 
		
		if(owner_status == '2'){
			$("#status0").attr("class","nuselect");
			$("#status1").attr("class","select");
			$("#status2").attr("class","nuselect");
		}else if(owner_status == '0'){
			$("#status0").attr("class","select");
			$("#status1").attr("class","nuselect");
			$("#status2").attr("class","nuselect");
		}else{
			$("#status0").attr("class","nuselect");
			$("#status1").attr("class","nuselect");
			$("#status2").attr("class","select");
		}
	}	
	  	
	</script>
	
	<div id="other">
		<div style="float:left;margin-left: 50px;" id="status1">
			<s:url id="url" action="showAllGrid_by_page">
				<s:param name="page">1</s:param>
				<s:param name="owner_status">2</s:param>
			</s:url>
			<s:a href="%{url}" method="post">全部格子 </s:a>	
		</div>
		<div style="float:left;">&nbsp;&nbsp;|&nbsp;&nbsp;</div>
		<div style="float:left;" id="status0">
			<s:url id="url" action="showAllGrid_by_page">
				<s:param name="page">1</s:param>
				<s:param name="owner_status">0</s:param>
			</s:url>
			<s:a href="%{url}" method="post"> 未分配 </s:a>	
		</div>
		<div style="float:left;">&nbsp;&nbsp;|&nbsp;&nbsp;</div>
		<div style="float:left;" id="status2">
			<s:url id="url" action="showAllGrid_by_page">
				<s:param name="page">1</s:param>
				<s:param name="owner_status">1</s:param>
			</s:url>
			<s:a href="%{url}" method="post"> 已分配 </s:a>
		</div>
		</div>
		<br/>
		<input type="hidden" id="tip" value="<s:property value="tip"/>"/>
		<table id="table2">
			<thead>
				<tr><th style="text-align: center;">格子编号</th><th style="text-align: center;">格主编号</th><th style="text-align: center;">格子类型</th><th style="width: 100px;text-align: center;">所属品牌店</th><th style="text-align: center;">状态</th></tr>
			</thead>
			<tbody>
		  	<s:iterator value="brandgridGrid_l" status="st">
		  		<tr>
		  		<td><s:property value="brandgrid_grid_number"/></td>
		  		<td style="text-align: center;">
		  		<s:if test="brandgrid_grid_owner_id==brandgrid_id">
		  			未分配
		  		</s:if>
		  		<s:else>
		  			<a href="#" onclick='dialog("<s:property value="brandgrid_grid_number"/>：<s:property value="brandgrid_grid_name"/>","iframe:<s:text name="mylocalhosturl" />${pageContext.request.contextPath}/find_id_toShowDialog.do?owner_id=<s:property value="brandgrid_grid_owner_id"/>","470px","400px","iframe"); '>查看格主</a>
		  		</s:else>
		  		</td> 
		  		<td style="text-align: center;">
		  		<a href="#" onclick='dialog("格子类型","iframe:<s:text name="mylocalhosturl" />${pageContext.request.contextPath}/admin/BrandGrid/dialog_gridType.jsp?gn=<s:property value="brandgrid.brandgridGridtype.brandgrid_gridtype_name"/>&csg=<s:property value="brandgrid.brandgridGridtype.can_show_goods"/>&u=<s:property value="brandgrid.brandgridGridtype.unitprice"/>&hds=<s:property value="brandgrid.brandgridGridtype.hard_disk_space"/>&lz=<s:property value="brandgrid.brandgridGridtype.LZ_note"/>","450px","200px","iframe"); '><s:property value="brandgrid.brandgridGridtype.brandgrid_gridtype_name"/></a>
		  		</td>
		  		<td><s:property value="brandgrid.brandgrid_name"/></td>
		  		<td>
		  			<s:if test="brandgrid_grid_owner_id==brandgrid.brandgrid_id">
				  		未分配
				  	</s:if>
				  	<s:else>
				  		已分配
				  	</s:else>
		  		</td>
		  		</tr>
		  	</s:iterator>
		</tbody>
		</table>
		<div id="other01">
		<table width="680" border="0" cellspacing="10" cellpadding="10">
			<tr>
			<td align="center"><s:property value="page"/>/<s:property value="hasPages"/></td>
			<td align="center">
				<s:url id="url" action="showAllGrid_by_page">
			        <s:param name="page">1</s:param>
				</s:url>
				<s:a href="%{url}" onclick="return justNextPage();">第一页</s:a>
			</td>
			<td align="center">
				<s:url id="url" action="showAllGrid_by_page">
			        <s:param name="page"><s:property value="page-1"/></s:param>
				</s:url>
				<s:a href="%{url}" onclick="return justNextPage();">上一页</s:a>
			</td>
			<td align="center">
				<s:url id="url" action="showAllGrid_by_page">
			        <s:param name="page"><s:property value="page+1"/></s:param>
				</s:url>
				<s:a href="%{url}" onclick="return justUpPage();">下一页</s:a>
			</td>
			<td align="center">
				<s:url id="url" action="showAllGrid_by_page">
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
