<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@taglib prefix="sx" uri="/struts-dojo-tags" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
	<script src="${pageContext.request.contextPath}/admin/js/jquery-1.5.1.min.js" type="text/javascript"></script>
	<link href="${pageContext.request.contextPath}/admin/css/dialog.css" rel="stylesheet" type="text/css" />
	<script src="${pageContext.request.contextPath}/admin/js/jquery-latest.pack.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/admin/js/dialog.js" type="text/javascript"></script>
	<link href="${pageContext.request.contextPath}/admin/css/table.css" type="text/css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/admin/css/table_tr.css" type="text/css" rel="stylesheet" />
	<script src="${pageContext.request.contextPath}/admin/js/table_tr.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/admin/js/showPrefspage.js" type="text/javascript"></script>
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
<body>
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
		
	</script>
	
	<div>
		<div style="width:100% ">
		<span style="font-size:15px;">
			<s:if test="gridname!=null&&gridname.length()>0 || time!=null&&time.length()>0">
				<s:url id="url" action="showDoGoodsNote_by_page_admin">
					<s:param name="page">1</s:param>
					<s:param name="time"></s:param>
					<s:param name="gridname"></s:param>
					<s:param name="time"></s:param>
					<s:param name="findforother"></s:param>
				</s:url>
				<s:a href="%{url}" method="post"> 显示全部 </s:a>	
				
				|
				<s:if test="tip!=null&&tip.length()>0">
					<s:property value="tip"/>
				</s:if>
				<s:else>
					当前位置：<s:property value="gridname"/>(<s:property value="time"/>) 
				</s:else>	
			</s:if>
			</span>
		</div> 
		<div style=" margin-right:50px;"><input type="text" name="gridname" value="输入格子名称" onFocus="if (value =='输入格子名称'){value =''}" onBlur="if (value ==''){value='输入格子名称'}" maxlength="15" id="gn"/></div><div style="float: left;"><input style=" width: 162px;" type="text" value="" id="rangeB" name="time" readonly="readonly" value="" onFocus="if (value =='点击选择筛选时间'){value =''}" onBlur="if (value ==''){value='点击选择筛选时间'}"/></div><div style="float: left;"><s:submit value="筛选" id="sx"/><input type="hidden" value="findforother" name="findforother"/></div> 
		<input type="hidden" value="<s:property value="gridname"/>" id="gridname"/>
	</div>
	<div style="float: right;">
<table id="table2">

	<thead>
		<tr>
			<th></th>
			<th style="width: 150px;text-align: center;">操作时间</th>
			<th style="width: 200px; text-align: center;">所属格子</th>
			<th style="width: 200px; text-align: center;">商品名称</th>
			<th style="width: 150px; text-align: center;">操作数量</th>
			<th style="width: 150px; text-align: center;">操作类型</th>
			<th style="width: 150px; text-align: center;">操作时单价</th>
			<th style="width: 150px; text-align: center;">实际单价</th>
			<th style="width: 200px; text-align: center;">详情</th>
		</tr>
	</thead>
	<tbody>
		<s:iterator value="scatteredGridDoGoodsNote_l" status="st">
		  		<tr>
		  		<td>
				  	
		  		</td>
		  		<td style="text-align: center;"><s:property value="do_time.toLocaleString()"/></td>
		  		<td style="text-align: center;"><s:property value="scatteredGrid.grid_name"/></td>
		  		<td style="text-align: center;">
		  		<a href="#" onclick='dialog("显示图片","iframe:<s:text name="mylocalhosturl" />${pageContext.request.contextPath}/findGoods_admin.do?goods_id=<s:property value="scatteredGridGoods.goods_id"/>","850px","600px","iframe"); '><s:property value="scatteredGridGoods.goods_name"/></a>
		  		</td>
		  		<td style="text-align: center;"><s:property value="do_amount"/></td>
		  		<td style="text-align: center;">
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
				<s:url id="url" action="showDoGoodsNote_by_page_admin">
			        <s:param name="page">1</s:param>
			        <s:param name="time"><s:property value="time"/></s:param>
				</s:url>
				<s:a href="%{url}" onclick="return justNextPage();">第一页</s:a>
			</td>
			<td align="center">
				<s:url id="url" action="showDoGoodsNote_by_page_admin">
			        <s:param name="page"><s:property value="page-1"/></s:param>
			        <s:param name="time"><s:property value="time"/></s:param>
				</s:url>
				<s:a href="%{url}" onclick="return justNextPage();">上一页</s:a>
			</td>
			<td align="center">
				<s:url id="url" action="showDoGoodsNote_by_page_admin">
			        <s:param name="page"><s:property value="page+1"/></s:param>
			        <s:param name="time"><s:property value="time"/></s:param>
				</s:url>
				<s:a href="%{url}" onclick="return justUpPage();">下一页</s:a>
			</td>
			<td align="center">
				<s:url id="url" action="showDoGoodsNote_by_page_admin">
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