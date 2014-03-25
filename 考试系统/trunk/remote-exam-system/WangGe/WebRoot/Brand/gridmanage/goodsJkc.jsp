<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
<script src="${pageContext.request.contextPath}/Brand/js/jquery-1.6.4.min.js" type="text/javascript"></script>
<link href="${pageContext.request.contextPath}/Brand/css/dialog.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/Brand/js/jquery-latest.pack.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/Brand/js/dialog.js" type="text/javascript"></script>
<link href="${pageContext.request.contextPath}/Brand/css/dangqianshangjia.css" rel="stylesheet" type="text/css" />
<style type="text/css">
#fengye td{
	height: 10px;
}
</style>
</head>

<body>
<table cellspacing="0">
  <tr>
    <td class="td2">商品编号</td>
    <td class="td2">名称</td>
    <td class="td2">当前/市场/折扣</td>
    <td class="td2">原本-剩余=售出（单位）</td>
    <td class="td2">状态</td>
    <td class="td2">上架时间</td>
    <td class="td2">下架时间</td>
    <td class="td2">操作</td>
  </tr>
    <s:iterator value="brandgridGoods_l" status="st">
  <tr>
    <td class="td3"><s:property value="brandgridGridOwner.brandgridGrid.addgoods_no"/>-<s:property value="goods_no"/></td>
    <td class="td3"><s:property value="goods_name"/></td>
     <td class="td3"><s:property value="goods_price"/>￥/<s:property value="market_price"/>￥/
     <s:if test="goods_ZK==10.0">
     	不打折
     </s:if>
     <s:elseif test="goods_ZK==0.0">
    	 免费
     </s:elseif>
     <s:else>
     <s:property value="goods_ZK"/>
     </s:else>
     </td>
    <td class="td3"><s:property value="goods_hasamount"/> - <s:property value="residual_mount"/> = <s:property value="goods_hasamount-residual_mount"/>（<s:property value="unit"/>）</td>
    <td class="td3">
    	旧库存
    </td>
    <td class="td3"><s:property value="put_time.toLocaleString()"/></td>
    <td class="td4"><s:property value="undercarriage_time.toLocaleString()"/></td>
     <td class="td6">
    	<p>
    	<a href="#" onclick='dialog("上传图片","iframe:<s:text name="mylocalhosturl" />${pageContext.request.contextPath}/Brand/gridmanage/dialog_uploadph.jsp?goodsid=<s:property value="brandgrid_goods_id" />&page=<s:property value="page"/>&statu_choice=<s:property value="statu_choice"/>&statu=<s:property value="statu"/>","720px","400px;","iframe"); '>转到下架中</a>
    	</p>
    </td>
  </tr>
    </s:iterator>
  
    <tr>
    <td class="td5">&nbsp;</td>
    <td class="td5">&nbsp;</td>
    <td class="td5">&nbsp;</td>
    <td class="td5">&nbsp;</td>
    <td class="td5">&nbsp;</td>
    <td class="td5">&nbsp;</td>
    <td class="td5">&nbsp;</td>
    <td class="td5">&nbsp;</td>
    <td class="td5">&nbsp;</td>
  </tr>
</table>
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
			var statu_choice = $("#statu_choice").val();
			var statu = $("#statu").val();
	  		$("#iframe",parent.document.body).attr("src","show_All_Goods_gridOwner.do?page="+select.value+"&statu_choice="+statu_choice+"&statu="+statu);
	  	}
	  	
	</script>
<input type="hidden" value="<s:property value="statu"/>" id="statu"/>
<input type="hidden" value="<s:property value="statu_choice"/>" id="statu_choice"/>
<table id="fengye" width="100%" border="0" >
			<tr>
			<td align="center"><span id="page2"><s:property value="page"/></span>/<s:property value="hasPages"/></td>
			<td align="center">
				<s:url id="url" action="show_All_Goods_gridOwner">
				<s:param name="page">1</s:param>
				<s:param name="statu_choice"><s:property value="statu_choice"/></s:param>
				<s:param name="statu">7</s:param>
			    </s:url>
				<s:a href="%{url}" onclick="return justNextPage();">第一页</s:a>
			</td>
			<td align="center">
				<s:url id="url" action="show_All_Goods_gridOwner">
				<s:param name="page"><s:property value="page-1"/></s:param>
				<s:param name="statu_choice"><s:property value="statu_choice"/></s:param>
				<s:param name="statu">7</s:param>
			   </s:url>
				<s:a href="%{url}" onclick="return justNextPage();">上一页</s:a>
			</td>
			<td align="center">
				<s:url id="url" action="show_All_Goods_gridOwner">
				<s:param name="page"><s:property value="page+1"/></s:param>
				<s:param name="statu_choice"><s:property value="statu_choice"/></s:param>
				<s:param name="statu">7</s:param>
				</s:url>
				<s:a href="%{url}" onclick="return justUpPage();">下一页</s:a>
			</td>
			<td align="center">
				<s:url id="url" action="show_All_Goods_gridOwner">
				<s:param name="page"><s:property value="hasPages"/></s:param>
				<s:param name="statu_choice"><s:property value="statu_choice"/></s:param>
				<s:param name="statu">7</s:param>
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
