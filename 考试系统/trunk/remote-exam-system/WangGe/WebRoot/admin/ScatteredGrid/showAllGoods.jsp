<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@taglib uri="/struts-tags" prefix="s"%>
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
	<script src="${pageContext.request.contextPath}/admin/js/showgoodspage.js" type="text/javascript"></script>
	
	<script language="JavaScript">
			$(document).ready(function(){
		  		var tip2 = $("#tip2").attr("value");
		  		if(tip2.length > 1){
		  			alert(tip2);
		  		}
		  		var height = $("body").height();
				$("#rightIframe",parent.document.body).height(800);
		  	})
		</script>
</head>

<body onload="refreshSize();">
<div id="box" >
  <div id="zhuanghu" style="margin-left: 15px">
  	
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
		    if(!confirm('此设为“违禁物品”操作将删除该商品的图片，是否确定？')){return false;}
		    return true;
		}
		
		function forcedo2(){
		    if(!confirm('是否确定恢复该物品使用？')){return false;}
		    return true;
		}
		
		function test(select){
	  		$("#rightIframe",parent.document.body).attr("src","showAllGoods_by_page_admin.do?page="+select.value );
	  	}
	  	
	</script>
	<div>
		<input type="hidden" value="<s:property value="tip2"/>" id="tip2"/>
		<div style=" float:left; width:350px ">
		<div style="float:left;" id="status3">
		<s:if test="gridname!=null&&gridname.length()>0">
			<s:url id="url" action="showAllGoods_by_page_admin">
				<s:param name="page">1</s:param>
				<s:param name="goodstatu">1</s:param>
				<s:param name="gridname"></s:param>
			</s:url>
			<s:a href="%{url}" method="post"> 显示全部 </s:a>	
			
			|
			<s:if test="tip!=null&&tip.length()>0">
				<s:property value="tip"/>
			</s:if>
			<s:else>
				当前位置：<s:property value="gridname"/>
			</s:else>	
		</s:if>
		</div>
		</div> 
		<div style=" text-align:right; margin-right:50px;"><s:form method="post" action="showAllGoods_by_page_admin" autocomplete="off">格子名称：<s:textfield name="gridname" value="" maxlength="15" id="gn"/> <s:submit value="筛选" onclick="return check();"/></s:form>  </div> 
		<input type="hidden" value="<s:property value="gridname"/>" id="gridname"/>
	</div>
  	<div>
	<input type="hidden" value="<s:property value="goodstatu"/>" id="goodstatu"/>
		<div style="float:left;" id="status1">
			<s:url id="url" action="showAllGoods_by_page_admin">
				<s:param name="page">1</s:param>
				<s:param name="goodstatu">1</s:param>
			</s:url>
			<s:a href="%{url}" method="post"> 已在架 </s:a>	
		</div>
		<div style="float:left;">&nbsp;&nbsp;|&nbsp;&nbsp;</div>
		<div style="float:left;" id="status0">
			<s:url id="url" action="showAllGoods_by_page_admin">
				<s:param name="page">1</s:param>
				<s:param name="goodstatu">0</s:param>
			</s:url>
			<s:a href="%{url}" method="post">  未上架 </s:a>	
		</div>
		<div style="float:left;">&nbsp;&nbsp;|&nbsp;&nbsp;</div>
		<div style="float:left;" id="status2">
			<s:url id="url" action="showAllGoods_by_page_admin">
				<s:param name="page">1</s:param>
				<s:param name="goodstatu">2</s:param>
			</s:url>
			<s:a href="%{url}" method="post">  旧存库 </s:a>
		</div>
		<div style="float:left;">&nbsp;&nbsp;|&nbsp;&nbsp;</div>
		<div style="float:left;" id="status11">
			<s:url id="url" action="showAllGoods_by_page_admin">
				<s:param name="page">1</s:param>
				<s:param name="goodstatu">-11</s:param>
			</s:url>
			<s:a href="%{url}" method="post">  违禁物品 </s:a>	
		</div>
	</div>
	<br />
	
<table id="table2">
	<thead>
		<tr>
			<th></th>
			<th style="width: 110px;">所属格子</th>
			<th>置顶时间</th>
			<th>上传时间</th>
			<th>最近上架</th>
			<th style="width: 110px;">最近下架</th>
			<th style="width: 110px;">商品名称</th>
			<th>类型</th>
			<th>当前</th>
			<th>市场</th>
			<th>数量</th>
			<th>剩余</th>
			<th>已售出</th>
			<th>状态</th>
			<th width="150px" valign="middle">操作</th>
		</tr>
	</thead>
	<tbody>
		<s:iterator value="scatteredGridGoods_l" status="st">
		  		<tr>
		  		<td>
			  		
			  		<s:if test="Status==1 || Status==0">
			  			<a href="#" onclick='dialog("显示图片","iframe:<s:text name="mylocalhosturl" />${pageContext.request.contextPath}/findGoods_admin.do?goods_id=<s:property value="goods_id"/>","850px","600px","iframe"); '>
				  		<div style="width:70px; height:70px;background: #977DFF;">
				  		<img src="<s:text name="imgPath" />/<s:property value="scatteredGrid.gridid"/>/<s:property value="goods_id"/>/<s:property value="goods_photoname1"/>" style="width:70px; height:70px;"/>
				  		</div>
				  		</a>
				  	</s:if>
				  	
		  		</td>
		  		<td><s:property value="scatteredGrid.grid_name"/></td>
		  		<td><s:property value="LZ_datetime.toLocaleString()"/></td>
		  		<td><s:property value="upload_time"/></td>
		  		<td><s:property value="put_time"/></td>
		  		<td><s:property value="undercarriage_time"/></td>
		  		<td>
		  		<s:url id="url" action="findGoods">
			  			<s:param name="goods_id"><s:property value="goods_id"/></s:param>
					</s:url>
					<s:a href="%{url}" method="post">
					<s:property value="goods_name"/>
				  	</s:a>
		  		
		  		</td>
		  		<td><s:property value="goods_type_name"/></td>
		  		<td>￥<s:property value="goods_price"/></td>
		  		<td>￥<s:property value="market_price"/></td>
		  		<td><s:property value="goods_hasamount"/></td>
		  		<td><s:property value="residual_mount"/></td>
		  		<td><s:property value="goods_hasamount - residual_mount"/></td>
		  		
		  		<s:if test="Status==1">
			  		<td>在<s:property value="bunkid"/>号架</td>
			  		<td>
			  		<s:url id="url" action="contraband_admin">
					    <s:param name="goods_id"><s:property value="goods_id" /></s:param>
					    <s:param name="page"><s:property value="page"/></s:param>
					    <s:param name="goodstatu"><s:property value="goodstatu"/></s:param>
					</s:url>
				  	<s:a href="%{url}" onclick="return forcedo();">违禁物品</s:a>
				  	
			  		</td>
			  	</s:if>
			  	<s:elseif test="Status==0">
			  		<td>未上架	</td>
			  		<td>
			  		<s:url id="url" action="contraband_admin">
					    <s:param name="goods_id"><s:property value="goods_id" /></s:param>
					    <s:param name="page"><s:property value="page"/></s:param>
					    <s:param name="goodstatu"><s:property value="goodstatu"/></s:param>
					</s:url>
				  	<s:a href="%{url}" onclick="return forcedo();">违禁物品</s:a>
			  		</td>
			  	</s:elseif>
			  	<s:elseif test="Status==2">
			  		<td>旧商品</td>
			  		<td>
			  		<s:url id="url" action="contraband_admin">
					    <s:param name="goods_id"><s:property value="goods_id" /></s:param>
					    <s:param name="page"><s:property value="page"/></s:param>
					    <s:param name="goodstatu"><s:property value="goodstatu"/></s:param>
					</s:url>
				  	<s:a href="%{url}" onclick="return forcedo();">违禁物品</s:a>
				  	
			  		</td>
			  	</s:elseif>
			  	<s:else>
			  		<td>违禁物品</td>
			  		<td>
			  		
			  		<s:url id="url" action="resume_admin">
					    <s:param name="goods_id"><s:property value="goods_id" /></s:param>
					    <s:param name="page"><s:property value="page"/></s:param>
					    <s:param name="goodstatu"><s:property value="goodstatu"/></s:param>
					</s:url>
				  	<s:a href="%{url}" onclick="return forcedo2();">恢复使用</s:a>
			  		</td>
			  	</s:else>
		  		</tr>	
		  	</s:iterator>
	</tbody>
</table>

<table width="100%" border="0" cellspacing="10" cellpadding="10">
			<tr>
			
			<td align="center"><span id="page2"><s:property value="page"/></span>/<s:property value="hasPages"/></td>
			<td align="center">
				<s:url id="url" action="showAllGoods_by_page_admin">
			        <s:param name="page">1</s:param>
			        <s:param name="goodstatu"><s:property value="goodstatu"/></s:param>
				</s:url>
				<s:a href="%{url}" onclick="return justNextPage();">第一页</s:a>
			</td>
			<td align="center">
				<s:url id="url" action="showAllGoods_by_page_admin">
			        <s:param name="page"><s:property value="page-1"/></s:param>
			        <s:param name="goodstatu"><s:property value="goodstatu"/></s:param>
				</s:url>
				<s:a href="%{url}" onclick="return justNextPage();">上一页</s:a>
			</td>
			<td align="center">
				<s:url id="url" action="showAllGoods_by_page_admin">
			        <s:param name="page"><s:property value="page+1"/></s:param>
			        <s:param name="goodstatu"><s:property value="goodstatu"/></s:param>
				</s:url>
				<s:a href="%{url}" onclick="return justUpPage();">下一页</s:a>
			</td>
			<td align="center">
				<s:url id="url" action="showAllGoods_by_page_admin">
			        <s:param name="page"><s:property value="hasPages"/></s:param>
			        <s:param name="goodstatu"><s:property value="goodstatu"/></s:param>
				</s:url>
				<s:a href="%{url}" onclick="return justUpPage();">最后一页</s:a>
			</td>
			<td align="center">
			跳转<s:select list="page_l" name="page" onchange="test(this);"/>
			</td>
			<td align="center">
			共有<s:property value="hasGoods"/>条记录
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