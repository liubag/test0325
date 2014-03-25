<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>在架商品</title>
	<link href="${pageContext.request.contextPath}/ScatteredGrid/css/dialog.css" rel="stylesheet" type="text/css" />
	<script src="${pageContext.request.contextPath}/ScatteredGrid/js/jquery-latest.pack.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/ScatteredGrid/js/dialog.js" type="text/javascript"></script>
	<link href="${pageContext.request.contextPath}/ScatteredGrid/css/gezi_div.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/ScatteredGrid/js/lazyload.js" type="text/javascript"></script>
<script type="text/javascript">
	  	$(document).ready(function(){
	  		$("img").lazyload({ 
			effect : "fadeIn" 
			}); 
	  		var marker = $("#marker").attr("value");
	  		if(marker!=""){
	  			alert("出售操作失败！");
	  		}
	  		var height = $("body").height();
			$("#rightIframe",parent.document.body).height(height + 50);
	  	})
	  	
</script>

</head>




<body>
	<div>今天还有<span id="lz_note" style="color:#FF0000;"><s:property value="lz"/></span>次置顶机会</div>
	<input type="hidden" value="<s:property value="marker"/>" id="marker"/>
  <%
  	int showNo = 0;
  	int divisor = 4;
   %>
	<table>
		<tr>
		<s:iterator value="scatteredGridGoods_l" status="st">
		<%
			
			if(showNo%divisor == 0){
		%>
			<tr/><tr>
				<td>
				<div id="box1">
				<s:if test="goods_price!=null">
					<s:url id="url" action="findGoods">
				  	<s:param name="goods_id"><s:property value="goods_id"/></s:param>
					</s:url>
					<s:a href="%{url}" method="post">
					<div id="img">
						<img class="pic" src="<s:text name="imgPath" />/<s:property value="scatteredGrid.gridid" />/<s:property value="goods_id" />/<s:property value="goods_photoname1" />"/>
					</div>
					<div id="text02">
						<s:property value="goods_name"/>
					</div>
					<div id="text03">数量：<s:property value="residual_mount"/></div>
					<div id="text04" style="font-size: 14px;">
					市场价：<s:property value="market_price"/>现价：<s:property value="goods_price"/>
					</div>
					</s:a>
				  		<s:url id="url" action="undercarriage">
					        <s:param name="goods_id"><s:property value="goods_id" /></s:param>
							<s:param name="marker2">yes</s:param>
						</s:url>
				  		<s:a href="%{url}">下架</s:a>
				  		<a href="#" onclick='dialog("商品售出","iframe:<s:text name="mylocalhosturl" />${pageContext.request.contextPath}/ScatteredGrid/manage/showtosell2.jsp?goodsid=<s:property value="goods_id" />&goodsname=<s:property value="goods_name"/>&goods_hasamount=<s:property value="residual_mount"/>&goods_price=<s:property value="goods_price"/>&goodstatu=<s:property value="goodstatu"/>&page=<s:property value="page"/>","350px","auto","iframe"); '>售出</a>
				 		<s:if test="LZ_datetime==null || lz>0 && (LZ_datetime.toLocaleString()).split(' ')[0] != lz_u_time">
				 		<s:url id="url" action="zhidingSGoods_user">
					        <s:param name="goods_id"><s:property value="goods_id" /></s:param>
						</s:url>
				  		<s:a href="%{url}">置顶</s:a>
				  		</s:if>
				 </s:if>
				<s:else>
					<div id="img">
						<img class="pic" src="${pageContext.request.contextPath}/ScatteredGrid/goodsphotos/goodsnull.jpg"/>
					</div>
				</s:else>
				</div>
				</td>
		<%
			}else{
			
			%>
			<td>
				<div id="box1">
				<s:if test="goods_price!=null">
					<s:url id="url" action="findGoods">
				  	<s:param name="goods_id"><s:property value="goods_id"/></s:param>
					</s:url>
					<s:a href="%{url}" method="post">
					<div id="img">
						<img class="pic" src="<s:text name="imgPath" />/<s:property value="scatteredGrid.gridid" />/<s:property value="goods_id" />/<s:property value="goods_photoname1" />"/>
					</div>
					<div id="text02">
						<s:property value="goods_name"/>	
					</div>
					<div id="text03"><span style="color:black;">数量：<s:property value="residual_mount"/></span></div>
					<div id="text04" style="font-size: 14px;">
					市场价：<s:property value="market_price"/>现价：<s:property value="goods_price"/>
					</div>
					</s:a>
				  		<s:url id="url" action="undercarriage">
					        <s:param name="goods_id"><s:property value="goods_id" /></s:param>
							<s:param name="marker2">yes</s:param>
						</s:url>
				  		<s:a href="%{url}">下架</s:a>
				  		<a href="#" onclick='dialog("商品售出","iframe:<s:text name="mylocalhosturl" />${pageContext.request.contextPath}/ScatteredGrid/manage/showtosell2.jsp?goodsid=<s:property value="goods_id" />&goodsname=<s:property value="goods_name"/>&goods_hasamount=<s:property value="residual_mount"/>&goods_price=<s:property value="goods_price"/>","300px","auto","iframe"); '>售出</a>
						<s:if test="lz>0 && (LZ_datetime.toLocaleString()).split(' ')[0] != lz_u_time">
				 		<s:url id="url" action="zhidingSGoods_user">
					        <s:param name="goods_id"><s:property value="goods_id" /></s:param>
						</s:url>
				  		<s:a href="%{url}">置顶</s:a>
				  		</s:if>
				</s:if>
				<s:else>
					<div id="img">
						<img class="pic" src="${pageContext.request.contextPath}/ScatteredGrid/goodsphotos/goodsnull.jpg"/>	
					</div>
				</s:else>
				</div>
				</td>
			<%
			}
			showNo++;
		 %>	
			
		</s:iterator>
		</tr>
	</table>
</body>
</html>