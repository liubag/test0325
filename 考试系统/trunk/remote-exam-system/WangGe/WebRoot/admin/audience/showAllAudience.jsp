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
	
	<script type="text/javascript">
		$(function(){
			function audienceCancel(){
				var id=$(this).attr("id");
				if(!confirm('是否确定注销操作？')){
					return;
				}else{
					$.ajax({
						type: "POST",
								url: "/WangGe/audienceCancel.do?audience.id=" + id,
								dataType: 'text',
								contentType:"text/html;charset=utf-8",
								async:false,
								error:function(){
								},
								success: function(data){
									if(data=="success"){
										$("#"+id+"_audience_status").html("已注销");
										$("#"+id+"_audience_operation").html("<a href='#' class='audienceActive' id='"+id+"' >激活</a>");
										$("#"+id).bind("click",audienceActive);
										alert("注销会员成功");
									}else{
									alert("注销会员失败！");
										return;
									}	
								}
					});
				}
			}
			
			function audienceActive(){
				var id=$(this).attr("id");
				if(!confirm('是否确定激活操作？')){
					return;
				}else{
					$.ajax({
						type: "POST",
								url: "/WangGe/audienceActive.do?audience.id=" + id,
								dataType: 'text',
								contentType:"text/html;charset=utf-8",
								async:false,
								error:function(){
								},
								success: function(data){
									if(data=="success"){
										$("#"+id+"_audience_status").html("正常");
										$("#"+id+"_audience_operation").html("<a href='#' class='audienceCancel' id='"+id+"' >注销</a>"); 
										$("#"+id).bind("click",audienceCancel);
										alert("激活会员成功！");
									}else{
										alert("激活会员失败！");
										return;
									}	
								}
					});
				}
			}
			
			$(".audienceCancel").bind("click",audienceCancel);
			$(".audienceActive").bind("click",audienceActive);
		});
	</script>
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
			
			
			
		});
	
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
	  		$("#rightIframe",parent.document.body).attr("src","showAllAudience.do?page="+select.value );
	  	}	  	
	  	
	</script>
		<table>
			
		</table>
		<br/>
		<input type="hidden" id="tip" value="<s:property value="tip"/>"/>
		<table id="table2">
			<thead>
				<tr>
					<th style="text-align: center;">会员名</th>
					<th style="width: 100px;text-align: center;">登录密码</th>
					<th style="text-align: center;">真实姓名</th>
					<th style="text-align: center; ">会员状态</th>
					<th style="text-align: center; ">会员积分</th>
					<th style="text-align: center;">性别</th>
					<th style="text-align: center;">身份证</th>
					<th style="text-align: center;">联系电话</th>
					<th style="text-align: center;">住址</th>
					<th style="text-align: center; width: 150px;">操作</th>
				</tr>
			</thead>
			<tbody>
		  	<s:iterator value="audience_l" status="st">
		  		<tr>
		  		<td><s:property value="audience_nickname"/></td>
		  		<td><s:property value="audience_pw"/></td>
		  		<td style="text-align: center;"><s:property value="audience_truename"/></td>
		  		<td style="text-align: center;" id="${id}_audience_status">
		  			<s:if test="audience_status==1">
				  		正常
				  	</s:if>
				  	<s:else>
				  		已注销
				  	</s:else>
				</td>
		  		<td style="text-align: center;"><s:property value="audience_point"/></td>
		  		<td style="text-align: center;"><s:property value="sex"/></td>
		  		<td style="text-align: center;"><s:property value="audience_idcard"/></td>
		  		<td style="text-align: center;"><s:property value="phone"/></td>
		  		<td style="text-align: center;"><s:property value="address"/></td>
		  		<td style="text-align: center;" >
		  			<span id="${id}_audience_operation">
						<s:if test="audience_status==1">
							<a href="#" class="audienceCancel" id="${id}"  >注销</a>
					  	</s:if>
					  	<s:else>
					  		<a href="#" class="audienceActive" id="${id}">激活</a>
					  	</s:else>
				  	</span>
				  	|<a href="/WangGe/showAudienceInfoById.do?audience.id=${id}">修改</a>
			  	</td>
		  		</tr>
		  	</s:iterator>
		</tbody>
		</table>
		
		<table width="680" border="0" cellspacing="10" cellpadding="10">
			<tr>
			<td align="center"><s:property value="page"/>/<s:property value="hasPages"/></td>
			<td align="center">
				<s:url id="url" action="showAllAudience">
			        <s:param name="page">1</s:param>
				</s:url>
				<s:a href="%{url}" onclick="return justNextPage();">第一页</s:a>
			</td>
			<td align="center">
				<s:url id="url" action="showAllAudience">
			        <s:param name="page"><s:property value="page-1"/></s:param>
				</s:url>
				<s:a href="%{url}" onclick="return justNextPage();">上一页</s:a>
			</td>
			<td align="center">
				<s:url id="url" action="showAllAudience">
			        <s:param name="page"><s:property value="page+1"/></s:param>
				</s:url>
				<s:a href="%{url}" onclick="return justUpPage();">下一页</s:a>
			</td>
			<td align="center">
				<s:url id="url" action="showAllAudience">
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
