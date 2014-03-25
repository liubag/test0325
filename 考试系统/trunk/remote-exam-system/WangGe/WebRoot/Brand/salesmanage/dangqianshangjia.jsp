<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
<script src="${pageContext.request.contextPath}/Brand/js/jquery-1.6.4.min.js" type="text/javascript"></script>
<script type="text/javascript">

</script>
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
    <td class="td2">商品图片</td>
    <td class="td2">名称</td>
    <td class="td2">当前/市场/折扣</td>
    <td class="td2">原本-剩余=售出（单位）</td>
    <td class="td2">状态</td>
    <td class="td2">操作(过期)时间</td>
    <td class="td2">操作</td>
  </tr>
    <s:iterator value="brandgridGoods_l" status="st">
  <tr>
    <td class="td3"><s:property value="brandgridGridOwner.brandgridGrid.addgoods_no"/>-<s:property value="goods_no"/></td>
    <td class="td3"><img src="${pageContext.request.contextPath}<s:text name="brandimgPath" />/<s:property value="brandgrid.brandgrid_id"/>/<s:property value="brandgridGridOwner.brandgrid_gridowner_id"/>/<s:property value="brandgrid_goods_id"/>/<s:property value="goods_photoname1"/>" alt="" /></td>
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
    <td class="td3"><s:property value="goods_hasamount"/> - <s:property value="residual_mount"/> = <s:property value="goods_hasamount-residual_mount"/>（<s:property value="goodsType.type_name"/>/<s:property value="unit"/>）</td>
     <td class="td3">
    	<s:if test="status==2">
    	申请下架
    	</s:if>
    	<s:elseif test="status==4">
    	申下过期
    	</s:elseif>
    	<s:elseif test="status==9">
    	申下失败
    	</s:elseif>
    	<s:elseif test="status==5">
    	已上架
    	</s:elseif>
    </td>
     <td class="td3">
    	<s:if test="status==2">
    	<s:property value="overdue_time.toLocaleString()"/>
    	</s:if>
    	<s:elseif test="status==4">
    	<s:property value="overdue_time.toLocaleString()"/>
    	</s:elseif>
    	<s:elseif test="status==9">
    	<s:property value="makesure_time.toLocaleString()"/>
    	</s:elseif>
    	<s:elseif test="status==5">
    	<s:property value="put_time.toLocaleString()"/>
    	</s:elseif>
    </td>
    <td class="td3">
    <p>
    	<s:url id="url" action="findGI_user">
    		<s:param name="gi"><s:property value="brandgrid_goods_id"/></s:param>
			<s:param name="issalesmanage">yes</s:param>
			<s:param name="page"><s:property value="page"/></s:param>
			<s:param name="statu_choice"><s:property value="statu_choice"/></s:param>
			<s:param name="owner_status"><s:property value="owner_status"/></s:param>
			<s:param name="brandgrid_Gridnum"><s:property value="brandgrid_Gridnum"/></s:param>
		</s:url>
		<s:a href="%{url}">修改</s:a>
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
	  		$("#siframe",parent.document.body).attr("src","show_All_Goods_brandOwner.do?page="+select.value+"&statu_choice=5&issalesmanage=yes&owner_status=&brandgrid_Gridnum=");
	  	}
	  	
	</script>

<table id="fengye" width="100%" border="0" >
			<tr>
			<td align="center"><span id="page2"><s:property value="page"/></span>/<s:property value="hasPages"/></td>
			<td align="center">
				<s:url id="url" action="show_All_Goods_brandOwner">
				<s:param name="issalesmanage">yes</s:param>
				<s:param name="page">1</s:param>
				<s:param name="statu_choice">5</s:param>
				<s:param name="owner_status"></s:param>
				<s:param name="brandgrid_Gridnum"></s:param>
			    </s:url>
				<s:a href="%{url}" onclick="return justNextPage();">第一页</s:a>
			</td>
			<td align="center">
				<s:url id="url" action="show_All_Goods_brandOwner">
				<s:param name="page"><s:property value="page-1"/></s:param>
				<s:param name="issalesmanage">yes</s:param>
				<s:param name="statu_choice">5</s:param>
				<s:param name="owner_status"></s:param>
				<s:param name="brandgrid_Gridnum"></s:param>
			   </s:url>
				<s:a href="%{url}" onclick="return justNextPage();">上一页</s:a>
			</td>
			<td align="center">
				<s:url id="url" action="show_All_Goods_brandOwner">
				<s:param name="page"><s:property value="page+1"/></s:param>
				<s:param name="issalesmanage">yes</s:param>
				<s:param name="statu_choice">5</s:param>
				<s:param name="owner_status"></s:param>
				<s:param name="brandgrid_Gridnum"></s:param>
				</s:url>
				<s:a href="%{url}" onclick="return justUpPage();">下一页</s:a>
			</td>
			<td align="center">
				<s:url id="url" action="show_All_Goods_brandOwner">
				<s:param name="page"><s:property value="hasPages"/></s:param>
				<s:param name="issalesmanage">yes</s:param>
				<s:param name="statu_choice">5</s:param>
				<s:param name="owner_status"></s:param>
				<s:param name="brandgrid_Gridnum"></s:param>
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
