<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@taglib prefix="sx" uri="/struts-dojo-tags" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<script src="${pageContext.request.contextPath}/ScatteredGrid/js/jquery-1.5.1.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/ScatteredGrid/js/showDoNotepage.js" type="text/javascript"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/Daterangepicker/js/jquery-ui-1.7.1.custom.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/Daterangepicker/js/daterangepicker.jQuery.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/Daterangepicker/css/ui.daterangepicker.css" type="text/css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/Daterangepicker/css/redmond/jquery-ui-1.7.1.custom.css" type="text/css" title="ui-theme" />	
		<style type="text/css">
			body { font-size: 62.5%; }
			/*input {width: 196px; height: 1.1em; display:block;}*/
			input{float:left;}
		</style>
	<style type="text/css">
	table		{ border:0;border-collapse:collapse;}
	td	{ font:normal 12px/17px Arial;padding:2px;}
	th			{ font:bold 12px/17px Arial;text-align:left;padding:4px;border-bottom:1px	solid #333;}
	.even		{ background:#FFF38F;}  /* 偶数行样式*/
	.odd		{ background:#FFFFEE;} /* 奇数行样式*/
	.selected	{ background:#FF6500;color:#fff;}
	
	.select
    {	
    	background: #FF8388;
    	} 
    .unselect
    {	
    	} 
	</style>
	
<script type="text/javascript">
	  	
	  	function test(select){
	  		var time = $("#time2").attr("value");
	  		$("#rightIframe",parent.document.body).attr("src","showDoGoodsNote_by_page.do?page="+select.value+"&time="+time);
	  	}
</script>
</head>
<body onload="refreshSize();">
  <div id="zhuanghu">
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
		
		function justDele(){
			var choice=document.getElementsByName("choice"); 
		    for(var i=0;i<choice.length;i++){
		        if(choice[i].checked){
		        	if(!confirm('删除商品，同时会删除相关记录信息！是否确定删除操作？')){return false;}
		        	return true;
		       }
		    }
		    alert("未选中商品"); 
		    return false;
		}
	</script>
	
	
	<div><span style="font-size:15px;">当前位置：<s:property value="time"/></span><input type="hidden" value="<s:property value="time"/>" id="time2"/></div>
	<div>
		<div style=" float:left; margin-left:10px;"><input style=" width: 162px;" type="text" value="" id="rangeB" name="time" readonly="readonly" value="" onFocus="if (value =='点击选择筛选时间'){value =''}" onBlur="if (value ==''){value='点击选择筛选时间'}"/></div><div style="float:left;"><input type="submit" id="sx" value="筛选"/></div>
	
	</div>
	<div style="float: right;">
	<table id="table2">

	<thead>
		<tr>
			<th></th>
			<th style="width: 150px;text-align: center;">操作时间</th>
			<th style="width: 150px; text-align: center;">商品名称</th>
			<th style="width: 150px; text-align: center;">操作数量</th>
			<th style="width: 150px; text-align: center;">操作类型</th>
			<th style="width: 150px; text-align: center;">操作时单价</th>
			<th style="width: 150px; text-align: center;">实际单价</th>
			<th style="width: 150px; text-align: center;">详情</th>
			<th style="width: 100px; text-align: center;" valign="middle">操作</th>
		</tr>
	</thead>
	<tbody>
		<s:iterator value="scatteredGridDoGoodsNote_l" status="st">
		  		<tr>
		  		<td>
				  	
		  		</td>
		  		<td><s:property value="do_time.toLocaleString()"/></td>
		  		<td><s:property value="scatteredGridGoods.goods_name"/></td>
		  		<td><s:property value="do_amount"/></td>
		  		<td>
		  			<s:if test="do_type==1">
			  			上架
				  	</s:if>
				  	<s:elseif test="do_type==2">
				  		下架
				  	</s:elseif>
				  	<s:else>
				  		出售
				  	</s:else>
		  		</td>
		  		<td>
		  		<s:property value="do_privce"/>
		  		</td>
		  		<td>
		  		<s:property value="do_truePrivce"/>
		  		</td>
		  		<td><s:property value="do_truePrivce"/> * <s:property value="do_amount"/>(<s:property value="scatteredGridGoods.unit"/>) = <s:property value="total_price"/></td>
		  		<td>
		  			<s:if test="do_type==1">
			  			删除
				  	</s:if>
				  	<s:elseif test="do_type==2">
				  		删除
				  	</s:elseif>
				  	<s:elseif test="scatteredGridGoods.Status!=-11">
					  	<s:url id="url" action="rollback">
					  		<s:param name="doid"><s:property value="doid"/></s:param>
						</s:url>
						<s:a href="%{url}" method="post">回滚</s:a>
				  	</s:elseif>
		  		</td>
		  		</tr>	
		  	</s:iterator>
	</tbody>
</table>

<table width="680" border="0" cellspacing="10" cellpadding="10">
			<tr>
			<td align="center">
				
			</td>
			<td align="center">
				
			</td>
			<td align="center"><span id="page2"><s:property value="page"/></span>/<s:property value="hasPages"/></td>
			<td align="center">
				<s:url id="url" action="showDoGoodsNote_by_page">
			        <s:param name="page">1</s:param>
			        <s:param name="time"><s:property value="time"/></s:param>
				</s:url>
				<s:a href="%{url}" onclick="return justNextPage();">第一页</s:a>
			</td>
			<td align="center">
				<s:url id="url" action="showDoGoodsNote_by_page">
			        <s:param name="page"><s:property value="page-1"/></s:param>
			        <s:param name="time"><s:property value="time"/></s:param>
				</s:url>
				<s:a href="%{url}" onclick="return justNextPage();">上一页</s:a>
			</td>
			<td align="center">
				<s:url id="url" action="showDoGoodsNote_by_page">
			        <s:param name="page"><s:property value="page+1"/></s:param>
			        <s:param name="time"><s:property value="time"/></s:param>
				</s:url>
				<s:a href="%{url}" onclick="return justUpPage();">下一页</s:a>
			</td>
			<td align="center">
				<s:url id="url" action="showDoGoodsNote_by_page">
			        <s:param name="page"><s:property value="hasPages"/></s:param>
			        <s:param name="time"><s:property value="time"/></s:param>
				</s:url>
				<s:a href="%{url}" onclick="return justUpPage();">最后一页</s:a>
			</td>
			<td align="center">
			跳转<s:select list="page_l" name="page" onchange="test(this);"/>
			</td>
			<td align="center">
			共有<s:property value="hasNotes"/>条记录
			</td>
			</tr>
		</table>
	</div>
 
 <div id="myDialog" title="My Dialog" style="display:none;background-color: blue;">  
		<div id="dialogContent" style="overflow-y: auto; height: 100%;">  
			<span class="blue13">waiting..</span>  
		</div>   
</div>  
 
</div>
</body>
</html>