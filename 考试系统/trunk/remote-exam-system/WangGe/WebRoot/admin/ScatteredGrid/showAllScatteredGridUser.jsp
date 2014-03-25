<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@taglib uri="/struts-tags" prefix="s"%>

<html>
<head>
	<title></title>
	<script src="${pageContext.request.contextPath}/admin/js/jquery-1.5.1.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/admin/js/table_tr.js" type="text/javascript"></script>
	<link href="${pageContext.request.contextPath}/admin/css/table_tr.css" type="text/css" rel="stylesheet" />
</head>

<body>
<div >
  <div id="zhuanghu" align="center">
  	<%
		Integer page01 = (Integer)request.getAttribute("page");
		Integer hasPages = (Integer)request.getAttribute("hasPages");
	 %>
	<script type="text/javascript">
	
		$(function(){
	
			var height = $("body").height();
			$("#rightIframe",parent.document.body).height(height + 50);
		
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
	  		$("#rightIframe",parent.document.body).attr("src","showAudience_by_page.do?page="+select.value );
	  	}
	  	
	</script>
		<table>
			
		</table>
		<br/>
		<s:property value="tip"/>
		<table id="table2">
			<thead>
				<tr><th>用户名</th><th>真实姓名</th><th>身份证</th><th>性别</th><th>联系电话</th><th>住址</th><th>账户状态</th><th>查看账户信息</th></tr>
			</thead>
			<tbody>
		  	<s:iterator value="user_l" status="st">
		  		<tr>
		  		<td><s:property value="username"/></td>
		  		<td><s:property value="truename"/></td>
		  		<td><s:property value="idcard"/></td>
		  		<td><s:property value="sex"/></td>
		  		<td><s:property value="phone"/></td>
		  		<td><s:property value="address"/></td>
		  		<td>
		  		<s:if test="status==1 || status ==2">
			  		正常
			  	</s:if>
			  	<s:else>
			  		已注销
			  	</s:else>
			  	</td>
		  		<td>
		  		<s:url id="url" action="find_accounts">
				    <s:param name="owner_id"><s:property value="id"/></s:param>
				</s:url>
			  	<s:a href="%{url}" method="post">查看账户信息</s:a><br/>
			  	</td>
		  		</tr>	
		  	</s:iterator>
		</tbody>
		</table>
		
		<table width="680" border="0" cellspacing="10" cellpadding="10">
			<tr>
			<td align="center"><s:property value="page"/>/<s:property value="hasPages"/></td>
			<td align="center">
				<s:url id="url" action="showAudience_by_page">
			        <s:param name="page">1</s:param>
				</s:url>
				<s:a href="%{url}" onclick="return justNextPage();">第一页</s:a>
			</td>
			<td align="center">
				<s:url id="url" action="showAudience_by_page">
			        <s:param name="page"><s:property value="page-1"/></s:param>
				</s:url>
				<s:a href="%{url}" onclick="return justNextPage();">上一页</s:a>
			</td>
			<td align="center">
				<s:url id="url" action="showAudience_by_page">
			        <s:param name="page"><s:property value="page+1"/></s:param>
				</s:url>
				<s:a href="%{url}" onclick="return justUpPage();">下一页</s:a>
			</td>
			<td align="center">
				<s:url id="url" action="showAudience_by_page">
			        <s:param name="page"><s:property value="hasPages"/></s:param>
				</s:url>
				<s:a href="%{url}" onclick="return justUpPage();">最后一页</s:a>
			</td>
			<td align="center">
			跳转<s:select list="page_l" name="page" onchange="test(this);"/>
			</td>
			<td align="center">
			共有<s:property value="hasAudiences"/>条记录
			</td>
			</tr>
		</table>
		</div>
</div>
</body>
</html>
