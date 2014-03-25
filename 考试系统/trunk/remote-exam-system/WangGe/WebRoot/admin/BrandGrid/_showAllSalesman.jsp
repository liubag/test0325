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
		<s:if test="brandgrid_salesman_name!=null && brandgrid_salesman_name.length()>0">
			-->售货员:<s:property value="brandgrid_salesman_name"/>
		</s:if>
		<input type="hidden" id="owner_status" value="<s:property value="owner_status"/>">
		<s:if test="owner_status==2">
			-->全部售货员
		</s:if>
		<s:elseif test="owner_status==1">
			-->正常
		</s:elseif>
		<s:elseif test="owner_status==0">
			-->已过期
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
			$("#rightIframe",parent.parent.document.body).height(height +250);
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
	  		$("#_Iframe",parent.document.body).attr("src","showAllSalse_by_page.do?page="+select.value );
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
			<s:url id="url" action="showAllSalse_by_page">
				<s:param name="page">1</s:param>
				<s:param name="owner_status">2</s:param>
			</s:url>
			<s:a href="%{url}" method="post">全部售货员 </s:a>	
		</div>
		<div style="float:left;">&nbsp;&nbsp;|&nbsp;&nbsp;</div>
		<div style="float:left;" id="status0">
			<s:url id="url" action="showAllSalse_by_page">
				<s:param name="page">1</s:param>
				<s:param name="owner_status">0</s:param>
			</s:url>
			<s:a href="%{url}" method="post"> 已过期 </s:a>	
		</div>
		<div style="float:left;">&nbsp;&nbsp;|&nbsp;&nbsp;</div>
		<div style="float:left;" id="status2">
			<s:url id="url" action="showAllSalse_by_page">
				<s:param name="page">1</s:param>
				<s:param name="owner_status">1</s:param>
			</s:url>
			<s:a href="%{url}" method="post"> 正常 </s:a>
		</div>
		</div>
		<br/>
		<input type="hidden" id="tip" value="<s:property value="tip"/>"/>
		<table id="table2">
			<thead>
				<tr><th style="text-align: center;">姓名</th><th style="text-align: center;">身份证</th><th style="width: 100px;text-align: center;">性别</th><th style="text-align: center;">创建时间</th><th style="text-align: center;">注销时间</th><th style="text-align: center;">联系号码</th><th style="text-align: center;">QQ</th><th style="text-align: center;">邮箱</th><th style="width: 100px;text-align: center;">所属品牌店</th><th style="text-align: center;">状态</th></tr>
			</thead>
			<tbody>
		  	<s:iterator value="brandgridSalesman_l" status="st">
		  		<tr>
		  		<td style="text-align: center;"><s:property value="brandgrid_salesman_name"/></td>
		  		<td style="text-align: center;"><s:property value="brandgrid_salesman_idcard"/></td>
		  		<td style="text-align: center;"><s:property value="brandgrid_salesman_sex"/></td>
		  		<td style="text-align: center;"><s:property value="brandgrid_salesman_newtime"/></td>
		  		<td style="text-align: center;"><s:property value="brandgrid_salesman_outtime"/></td>
		  		<td style="text-align: center;"><s:property value="brandgrid_salesman_phone"/></td>
		  		<td style="text-align: center;"><s:property value="brandgrid_salesman_qq"/></td>
		  		<td style="text-align: center;"><s:property value="brandgrid_salesman_email"/></td>
		  		<td style="text-align: center;"><s:property value="brandgrid.brandgrid_name"/></td>
		  		<td style="text-align: center;">
		  			<s:if test="brandgrid_salesman_status==0">
				  		已过期
				  	</s:if>
				  	<s:else>
				  		正常
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
				<s:url id="url" action="showAllSalse_by_page">
			        <s:param name="page">1</s:param>
				</s:url>
				<s:a href="%{url}" onclick="return justNextPage();">第一页</s:a>
			</td>
			<td align="center">
				<s:url id="url" action="showAllSalse_by_page">
			        <s:param name="page"><s:property value="page-1"/></s:param>
				</s:url>
				<s:a href="%{url}" onclick="return justNextPage();">上一页</s:a>
			</td>
			<td align="center">
				<s:url id="url" action="showAllSalse_by_page">
			        <s:param name="page"><s:property value="page+1"/></s:param>
				</s:url>
				<s:a href="%{url}" onclick="return justUpPage();">下一页</s:a>
			</td>
			<td align="center">
				<s:url id="url" action="showAllSalse_by_page">
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
