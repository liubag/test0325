<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@taglib uri="/struts-tags" prefix="s"%>

<html>
<head>
	<title></title>
	<script src="${pageContext.request.contextPath}/admin/js/jquery-1.5.1.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/admin/js/table_tr.js" type="text/javascript"></script>
	<link href="${pageContext.request.contextPath}/admin/css/table_tr.css" type="text/css" rel="stylesheet" />
<style type="text/css">
.text_red{
	color: red;
}
</style>
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
		function doDele(){
			if(!confirm('是否确定删除操作？')){return false;}
		      	return true;
		}
		function test(select){
	  		$("#rightIframe",parent.document.body).attr("src","showKeyWord_by_page.do?page="+select.value );
	  	}
	  	
	</script>
		<table>
			
		</table>
		<br/>
		<s:property value="tip"/>
		<table id="table2">
			<thead>
				<tr>
				<th width="5%;">排位</th>
				<th width="12%;">类型</th>
				<th width="30%;">关键字</th>
				<th width="10%;">约宝贝数</th>
				<th width="15%;">以往点击率/每天</th>
				<th width="7%;">今天点击量</th>
				<th width="7%;">删除</th>
				<th width="7%;">置上</th>
				<th width="7%;">置下</th>
				</tr>
			</thead>
			<tbody>
		  	<s:iterator value="keyWord_l" status="st">
		  		<tr>
		  		<td><s:property value="#st.index+1"/></td>
		  		<s:if test="keyword_status==0">
		  		<td>
		  		普通关键字
		  		</td>
		  		<td><s:property value="keyword_content"/></td>
		  		<td><s:property value="keyword_has_goods"/></td>
		  		<td><s:property value="keyword_before_click"/></td>
		  		<td><s:property value="keyword_today_click"/></td>
		  		<td>
		  		<s:url id="url" action="deleKeyWord">
		  			<s:param name="keyword_id"><s:property value="keyword_id"/></s:param>
			        <s:param name="page"><s:property value="page"/></s:param>
				</s:url>
				<s:a href="%{url}" onclick="return doDele();">删除</s:a>
		  		</td>
		  		<td>
		  		置上
		  		</td>
		  		<td>
		  		置下
		  		</td>
		  		</s:if>
		  		<s:else>
		  		<td class="text_red">
		  		系统关键字
		  		</td>
		  		<td class="text_red"><s:property value="keyword_content"/></td>
		  		<td><s:property value="keyword_has_goods"/></td>
		  		<td>----</td>
		  		<td>----</td>
		  		<td>----</td>
		  		<td>----</td>
		  		<td>----</td>
		  		</s:else>
		  		</tr>	
		  	</s:iterator>
		</tbody>
		</table>
		
		<table width="680" border="0" cellspacing="10" cellpadding="10">
			<tr>
			<td align="center"><s:property value="page"/>/<s:property value="hasPages"/></td>
			<td align="center">
				<s:url id="url" action="showKeyWord_by_page">
			        <s:param name="page">1</s:param>
				</s:url>
				<s:a href="%{url}" onclick="return justNextPage();">第一页</s:a>
			</td>
			<td align="center">
				<s:url id="url" action="showKeyWord_by_page">
			        <s:param name="page"><s:property value="page-1"/></s:param>
				</s:url>
				<s:a href="%{url}" onclick="return justNextPage();">上一页</s:a>
			</td>
			<td align="center">
				<s:url id="url" action="showKeyWord_by_page">
			        <s:param name="page"><s:property value="page+1"/></s:param>
				</s:url>
				<s:a href="%{url}" onclick="return justUpPage();">下一页</s:a>
			</td>
			<td align="center">
				<s:url id="url" action="showKeyWord_by_page">
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
</body>
</html>
