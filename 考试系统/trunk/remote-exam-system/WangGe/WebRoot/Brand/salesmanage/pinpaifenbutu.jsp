<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
<script src="${pageContext.request.contextPath}/Brand/js/jquery-1.6.4.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/Brand/js/lazyload.js" type="text/javascript"></script>
<script type="text/javascript">
$(function() { 
$("img").lazyload({ 
effect : "fadeIn" 
}); 
});
</script>
<link href="${pageContext.request.contextPath}/Brand/css/pinpaifenbutu.css" rel="stylesheet" type="text/css" />
</head>

<body>
<s:iterator value="brandgridGrid_l" status="st">
<div class="box">
<div class="top" onmouseover="this.style.border='1px solid #c81500'" onmouseout="this.style.border='0px'">
<s:if test="brandgrid_grid_owner_id==brand_id">

</s:if>
<s:else>
<a href="" title="进入格子">
<img src="${pageContext.request.contextPath}<s:text name="gridLogo" />/<s:property value="brandgrid_grid_owner_id"/>/<s:property value="brandgrid_grid_owner_id"/>.jpg" />
</a>
</s:else>
</div>
	<div class="bottom">
	<div class="ms"><span>编号：</span><span><s:property value="brandgrid_grid_number"/></span></div>
	<div class="ms"><span>名称：</span><span>
	<s:property value="grid_name"/>
	</span></div>
	</div>
</div>
</s:iterator>
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
	  		$("#siframe",parent.document.body).attr("src","showAllGrid_by_page_owner.do?page="+select.value+"&owner_status=1");
	  	}
	  	
	</script>
	                     <br/>
	                     <table width="100%" border="0" cellspacing="10" cellpadding="10">
							<tr>
							<td align="center"><span id="page2"><s:property value="page"/></span>/<s:property value="hasPages"/></td>
							<td align="center">
								<s:url id="url" action="showAllGrid_by_page_owner">
								<s:param name="owner_status">1</s:param>
								<s:param name="page">1</s:param>
							    </s:url>
								<s:a href="%{url}" onclick="return justNextPage();">第一页</s:a>
							</td>
							<td align="center">
								<s:url id="url" action="showAllGrid_by_page_owner">
								<s:param name="page"><s:property value="page-1"/></s:param>
								<s:param name="owner_status">1</s:param>
							   </s:url>
								<s:a href="%{url}" onclick="return justNextPage();">上一页</s:a>
							</td>
							<td align="center">
								<s:url id="url" action="showAllGrid_by_page_owner">
								<s:param name="page"><s:property value="page+1"/></s:param>
								<s:param name="owner_status">1</s:param>
								</s:url>
								<s:a href="%{url}" onclick="return justUpPage();">下一页</s:a>
							</td>
							<td align="center">
								<s:url id="url" action="showAllGrid_by_page_owner">
								<s:param name="page"><s:property value="hasPages"/></s:param>
								<s:param name="owner_status">1</s:param>
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
