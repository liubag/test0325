<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
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
	<link href="${pageContext.request.contextPath}/ScatteredGrid/css/dialog.css" rel="stylesheet" type="text/css" />
	<script src="${pageContext.request.contextPath}/ScatteredGrid/js/jquery-latest.pack.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/ScatteredGrid/js/dialog.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/ScatteredGrid/js/jquery-1.5.1.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/ScatteredGrid/js/showgoodspage.js" type="text/javascript"></script>
<script type="text/javascript">
	  	$(document).ready(function(){
	  		var marker = $("#marker").attr("value");
	  		if(marker!=""){
	  			if(marker == "turnold_fail"){
	  				alert("操作失败！");
	  			}else{
	  				alert("出售操作失败！");
	  			}
	  		}
	  		var height = $("body").height();
			$("#rightIframe",parent.document.body).height(height + 50);
	  	})
	  	
</script>
</head>
<body onload="refreshSize();">
<div id="box">
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
		
		function turnToThe(){
			if(!confirm('商品转移都旧库存的同时会清除该商品图片，是否确定删除操作？')){return false;}
		        $("#table2").hide();
		        $("#myDialog").show();
		        return true; 
		}
		
		function test(select){
	  		$("#rightIframe",parent.document.body).attr("src","showAllGoods_by_page_user.do?page="+select.value);
	  	}
	  	
	</script>
	
	<div>
	<input type="hidden" value="<s:property value="marker"/>" id="marker"/>
	<input type="hidden" value="<s:property value="goodstatu"/>" id="goodstatu"/>
		<div style="float:left;" id="status1">
			
			<s:url id="url" action="showAllGoods_by_page_user">
				<s:param name="page">1</s:param>
				<s:param name="goodstatu">1</s:param>
			</s:url>
			<s:a href="%{url}" method="post"> 已在架 </s:a>	
		</div>
		<div style="float:left;">&nbsp;&nbsp;|&nbsp;&nbsp;</div>
		<div style="float:left;" id="status0">
			<s:url id="url" action="showAllGoods_by_page_user">
				<s:param name="page">1</s:param>
				<s:param name="goodstatu">0</s:param>
			</s:url>
			<s:a href="%{url}" method="post">  未上架 </s:a>	
		</div>
		<div style="float:left;">&nbsp;&nbsp;|&nbsp;&nbsp;</div>
		<div style="float:left;" id="status2">
			<s:url id="url" action="showAllGoods_by_page_user">
				<s:param name="page">1</s:param>
				<s:param name="goodstatu">2</s:param>
			</s:url>
			<s:a href="%{url}" method="post">  旧存库 </s:a>
		</div>
		<div style="float:left;">&nbsp;&nbsp;|&nbsp;&nbsp;</div>
		<div style="float:left;" id="status11">
			<s:url id="url" action="showAllGoods_by_page_user">
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
			<th></th>
			<th style="width: 50px; text-align: center;">置顶时间</th>
			<th style="width: 50px; text-align: center;">上传时间</th>
			<th style="width: 50px; text-align: center;">最近上架</th>
			<th style="width: 50px; text-align: center;">最近下架</th>
			<th style="width: 120px; text-align: center;">商品名称</th>
			<th>类型</th>
			<th>当前</th>
			<th>剩余</th>
			<th>已售出</th>
			<th>状态</th>
			<th style="text-align: center; width:60px ;">操作</th>
		</tr>
	</thead>
	<tbody>
		<s:iterator value="scatteredGridGoods_l" status="st">
		  		<tr>
		  		
		  		<td>
			  		<s:if test="goodstatu==1 || goodstatu==-11">
				  		&nbsp;&nbsp;
				  	</s:if>
				  	<s:else>
				  		<input type="checkbox" name="choice" value="<s:property value="goods_id"/>"/>
				  	</s:else>
		  		</td>
		  		<td>
			  		<s:if test="Status==1 || Status==0">
			  			<s:url id="url" action="findGoods">
			  			<s:param name="goods_id"><s:property value="goods_id"/></s:param>
					</s:url>
					<div style="width:70px; height:70px;background: #977DFF;">
					<s:a href="%{url}" method="post">
				  		<img src="<s:text name="imgPath" />/<s:property value="scatteredGrid.gridid"/>/<s:property value="goods_id"/>/<s:property value="goods_photoname1"/>" style="width:70px; height:70px;"/>
				  	</s:a>
				  	</div>
				  	</s:if>
		  		</td>
		  		<td><s:property value="LZ_datetime.toLocaleString()"/></td>
		  		<td><s:property value="upload_time"/></td>
		  		<td><s:property value="put_time"/></td>
		  		<td style="text-align: center;"><s:property value="undercarriage_time"/></td>
		  		<td style="text-align: center;">
			  		<s:url id="url" action="findGoods">
			  			<s:param name="goods_id"><s:property value="goods_id"/></s:param>
					</s:url>
					<s:a href="%{url}" method="post">
					<s:property value="goods_name"/>
				  	</s:a>
		  		 
		  		</td>
		  		<td style="text-align: center;"><s:property value="goods_type_name"/></td>
		  		<td>￥<s:property value="goods_price"/></td>
		  		<td><s:property value="residual_mount"/></td>
		  		<td><s:property value="goods_hasamount - residual_mount"/></td>
		  		
		  		<s:if test="Status==1">
			  		<td><s:property value="bunkid"/>号架</td>
			  		<td style="text-align: center;">
			  		<s:url id="url" action="undercarriage">
					    <s:param name="goods_id"><s:property value="goods_id" /></s:param>
					    <s:param name="page"><s:property value="page"/></s:param>
					    <s:param name="goodstatu"><s:property value="goodstatu"/></s:param>
					</s:url>
				  	<s:a href="%{url}">下架</s:a>
				  	<br/>
				  	<s:if test="residual_mount==0">
			  			---
			  		</s:if>
			  		<s:else>
			  			<a href="#" onclick='dialog("商品售出","iframe:<s:text name="mylocalhosturl" />${pageContext.request.contextPath}/ScatteredGrid/manage/showtosell.jsp?goodsid=<s:property value="goods_id" />&goodsname=<s:property value="goods_name"/>&goods_hasamount=<s:property value="residual_mount"/>&goods_price=<s:property value="goods_price"/>&goodstatu=<s:property value="goodstatu"/>&page=<s:property value="page"/>","350px","auto","iframe"); '>售出</a>
			  		</s:else>  	
			  		</td>	
			  	</s:if>
			  	<s:elseif test="Status==0">
			  		<td>未上架</td>
			  		<td style="text-align: center;">
			  		<s:url id="url" action="keepCanShowGoodsList">
				        <s:param name="goods_id"><s:property value="goods_id"/></s:param>
						<s:param name="page"><s:property value="page"/></s:param>
						<s:param name="goodstatu"><s:property value="goodstatu"/></s:param>
					</s:url>
			  		<s:a href="%{url}">上架</s:a>
			  		<br/>
			  		<s:url id="url" action="turnToTheOldGoods">
				        <s:param name="goods_id"><s:property value="goods_id"/></s:param>
						<s:param name="page"><s:property value="page"/></s:param>
						<s:param name="goodstatu"><s:property value="goodstatu"/></s:param>
					</s:url>
			  		<s:a href="%{url}" onclick="return turnToThe();">转旧存库</s:a>
			  		</td>
			  	</s:elseif>
			  	<s:elseif test="Status==2">
			  		<td>旧商品</td>
			  		<td style="text-align: center;">
			  		<a href="#" onclick='dialog("上传图片","iframe:<s:text name="mylocalhosturl" />${pageContext.request.contextPath}/ScatteredGrid/manage/showuploadphoto.jsp?goodsid=<s:property value="goods_id" />&page=<s:property value="page"/>&marker2=yes","720px","400px;","iframe"); '>转到下架中</a>
			  		</td>
			  	</s:elseif>
			  	<s:else>
			  		<td>被禁用</td>
			  		<td>
			  		----
			  		</td>
			  	</s:else>
		  		</tr>	
		  	</s:iterator>
	</tbody>
</table>

<table width="680" border="0" cellspacing="10" cellpadding="10">
			<tr>
			
				<s:if test="goodstatu==1 || goodstatu==-11">
					<td align="center">
				  	&nbsp;&nbsp;
				  	</td>
				  	<td align="center">
				  		&nbsp;&nbsp;
				  	</td>
				</s:if>
				<s:else>
					<td align="center">
				  	<input type="checkbox" id="CheckedAll" />全选/全不选<br/>
				  	</td>
				  	<td align="center">
				  	<a href="#" id="dele">删除</a>
				  	</td>
				</s:else>	
			<td align="center"><span id="page2"><s:property value="page"/></span>/<s:property value="hasPages"/></td>
			<td align="center">
				<s:url id="url" action="showAllGoods_by_page_user">
			        <s:param name="page">1</s:param>
			        <s:param name="goodstatu"><s:property value="goodstatu"/></s:param>
				</s:url>
				<s:a href="%{url}" onclick="return justNextPage();">第一页</s:a>
			</td>
			<td align="center">
				<s:url id="url" action="showAllGoods_by_page_user">
			        <s:param name="page"><s:property value="page-1"/></s:param>
			        <s:param name="goodstatu"><s:property value="goodstatu"/></s:param>
				</s:url>
				<s:a href="%{url}" onclick="return justNextPage();">上一页</s:a>
			</td>
			<td align="center">
				<s:url id="url" action="showAllGoods_by_page_user">
			        <s:param name="page"><s:property value="page+1"/></s:param>
			        <s:param name="goodstatu"><s:property value="goodstatu"/></s:param>
				</s:url>
				<s:a href="%{url}" onclick="return justUpPage();">下一页</s:a>
			</td>
			<td align="center">
				<s:url id="url" action="showAllGoods_by_page_user">
			        <s:param name="page"><s:property value="hasPages"/></s:param>
			        <s:param name="goodstatu"><s:property value="goodstatu"/></s:param>
				</s:url>
				<s:a href="%{url}" onclick="return justUpPage();">最后一页</s:a>
			</td>
			<td align="center">
			<s:url id="url" action="showAllGoods_by_page_user">
				<s:param name="goodstatu"><s:property value="goodstatu"/></s:param>
			</s:url>
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