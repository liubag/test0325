<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>优惠信息</title>

	<script src="${pageContext.request.contextPath}/admin/js/jquery-1.5.1.min.js" type="text/javascript"></script>
	<link href="${pageContext.request.contextPath}/admin/css/table.css" type="text/css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/admin/css/table_tr.css" type="text/css" rel="stylesheet" />
	<script src="${pageContext.request.contextPath}/admin/js/table_tr.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/admin/js/showPrefspage.js" type="text/javascript"></script>
	<script language="JavaScript">
			$(document).ready(function(){
		  		var tip = $("#tip").attr("value");
		  		if(tip.length > 1){
		  			alert(tip);
		  		}
		  		
				var height = $("body").height();
				$("#rightIframe",parent.document.body).height(height + 50);
		  	})
		</script>
</head>

<body onload="refreshSize();">
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
		
		function forcedo(){
		    if(!confirm('是否确定强制下架？')){return false;}
		    return true;
		}

		
		function forcedo2(){
		    if(!confirm('是否确定恢复该优惠信息的使用？')){return false;}
		    return true;
		}
	  	
	</script>
	<div>
	<input type="hidden" value="<s:property value="PStatus"/>" id="PStatus"/>
	<input type="hidden" value="<s:property value="tip2"/>" id="tip"/>
		<div style="float:left;" id="status1">
			<s:url id="url" action="showAllPreferential_admin">
				<s:param name="page">1</s:param>
				<s:param name="PStatus">1</s:param>
			</s:url>
			<s:a href="%{url}" method="post"> 已上架 </s:a>	
		</div>
		<div style="float:left;">&nbsp;&nbsp;|&nbsp;&nbsp;</div>
		<div style="float:left;" id="status0">
			<s:url id="url" action="showAllPreferential_admin">
				<s:param name="page">1</s:param>
				<s:param name="PStatus">0</s:param>
			</s:url>
			<s:a href="%{url}" method="post">  未上架 </s:a>	
		</div>
		<div style="float:left;">&nbsp;&nbsp;|&nbsp;&nbsp;</div>
		<div style="float:left;" id="status11">
			<s:url id="url" action="showAllPreferential_admin">
				<s:param name="page">1</s:param>
				<s:param name="PStatus">-11</s:param>
			</s:url>
			<s:a href="%{url}" method="post">  强制废弃 </s:a>	
		</div>
	</div>
	<br />
	<table id="table2">
		<thead>
			<tr><th>所属格子</th><th>置顶时间</th><th>发布时间</th><th>优惠信息</th><th>最近使用时间</th><th>最近下架时间</th><th>状态</th><th>操作</th></tr>
		</thead>
		<tbody>
			
		  	<s:iterator value="scatteredGridPreferential_l" status="st">
		  		<tr>
		  		<td><s:property value="scatteredGrid.grid_name"/></td>
		  		<td><s:property value="LZ_datetime.toLocaleString()"/></td>
		  		<td><s:property value="do_time"/></td>
		  		<td><s:property value="preferential_text"/></td>
		  		<td><s:property value="used_time"/></td>
		  		<td><s:property value="down_time"/></td>
		  		<td>
		  		<s:if test="status==1">
			  		当前优惠信息
			  	</s:if>
			  	<s:else>
			  		未上架	
			  	</s:else>
			  	</td>
		  		<td>
		  		<s:if test="status==-11">
				  	-------- | 
				  	<s:url id="url" action="resumePreferential_admin">
					    <s:param name="id"><s:property value="id" /></s:param>
					    <s:param name="PStatus"><s:property value="PStatus"/></s:param>
					</s:url>
				  	<s:a href="%{url}" onclick="return forcedo2();">恢复使用</s:a>
			  	</s:if>
			  	<s:else>
			  		<s:url id="url" action="undercarriagePreferential_admin">
					    <s:param name="id"><s:property value="id" /></s:param>
					    <s:param name="PStatus"><s:property value="PStatus"/></s:param>
					    <s:param name="grid_id"><s:property value="scatteredGrid.gridid" /></s:param>
					</s:url>
				  	<s:a href="%{url}" onclick="return forcedo();">强制废弃</s:a>
				  	| --------
			  	</s:else>
			  	</td>
		  		</tr>	
		  	</s:iterator>
			</tbody>	
		</table>
		
		<table width="100%" border="0" cellspacing="10" cellpadding="10">
			<tr>
			<td align="center"><s:property value="page"/>/<s:property value="hasPages"/></td>
			<td align="center">
				<s:url id="url" action="showAllPreferential_admin">
			        <s:param name="page">1</s:param>
				</s:url>
				<s:a href="%{url}" onclick="return justNextPage();">第一页</s:a>
			</td>
			<td align="center">
				<s:url id="url" action="showAllPreferential_admin">
			        <s:param name="page"><s:property value="page-1"/></s:param>
				</s:url>
				<s:a href="%{url}" onclick="return justNextPage();">上一页</s:a>
			</td>
			<td align="center">
				<s:url id="url" action="showAllPreferential_admin">
			        <s:param name="page"><s:property value="page+1"/></s:param>
				</s:url>
				<s:a href="%{url}" onclick="return justUpPage();">下一页</s:a>
			</td>
			<td align="center">
				<s:url id="url" action="showAllPreferential_admin">
			        <s:param name="page"><s:property value="hasPages"/></s:param>
				</s:url>
				<s:a href="%{url}" onclick="return justUpPage();">最后一页</s:a>
			</td>
			<td align="center">
			跳转<s:select list="page_l" name="page" onchange="test(this);"/>
			</td>
			<td align="center">
			共有<s:property value="hasPreferentials"/>条记录
			</td>
			</tr>
		</table>
		
</body>
</html>