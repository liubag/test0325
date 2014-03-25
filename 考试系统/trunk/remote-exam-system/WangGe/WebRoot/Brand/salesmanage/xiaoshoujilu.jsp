<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
<script src="${pageContext.request.contextPath}/Brand/js/jquery-1.6.4.min.js" type="text/javascript"></script>
<link href="${pageContext.request.contextPath}/Brand/css/xiaoshoujilu.css" rel="stylesheet" type="text/css" />
<style type="text/css">
#fengye td{
	height: 10px;
}
</style>
<script type="text/javascript">
		function justHuigun(){
			if(!confirm('是否确定回滚操作？')){return false;}
		    return true; 
		}
		
	</script>
</head>

<body>
<table cellspacing="0">
  <tr>
  	<td width="5%" class="td2">操作</td>
 	<td width="10%" class="td2">类型</td>
    <td width="10%" class="td2">商品编号</td>
    <td width="22%" class="td2">商品名称</td>
    <td width="24%" class="td2">数量*单价*折扣</td>
    <td width="11%" class="td2">出售时间</td>
    <td width="11%" class="td2">回滚时间</td>
    <td width="7%" class="td2">回滚</td>
  </tr>
  <s:iterator value="brandgridSellnote_l" status="st">
  <tr>
  	 <td class="td3">
    	<s:if test="do_type==3">
    		售出
    	</s:if>
    	<s:elseif test="do_type==4">
    		回滚
    	</s:elseif>
    </td>
    <td class="td3"><s:property value="brandgridGoods.goodsType.type_name"/></td>
    <td class="td3"><s:property value="brandgridGridOwner.brandgridGrid.addgoods_no"/>-<s:property value="brandgridGoods.goods_no"/></td>
    <td class="td3"><s:property value="do_name"/></td>
    <td class="td3"><s:property value="do_amount"/> * <s:property value="do_privce"/> * <s:property value="discount"/>(<s:property value="brandgridGoods.unit"/>)= <s:property value="total_price"/></td>
    <td class="td3">
    	<s:property value="do_time.toLocaleString()"/>
    </td>
    <td class="td3">
    	 <s:property value="back_time.toLocaleString()"/>
    </td>
    <td class="td3">
   	 	<s:url id="url" action="huigun_sales">
				<s:param name="sellnote_id"><s:property value="brandgrid_do_id"/></s:param>
				<s:param name="page"><s:property value="page"/></s:param>
				<s:param name="time"><s:property value="time"/></s:param>
				<s:param name="sales_id"><s:property value="sales_id"/></s:param>
				<s:param name="brandgrid_Grid_id"><s:property value="brandgrid_Grid_id"/></s:param>
				<s:param name="owner_status"><s:property value="owner_status"/></s:param>
				<s:param name="issalesmanage">yes</s:param>
			   </s:url>
				<s:a href="%{url}" onclick="return justHuigun();">回滚</s:a>
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
			var s = $("#st").val();
	  		$("#jilu",parent.document.body).attr("src","show_All_Notes_brandOwner.do?page="+select.value+"&time=&sales_id=&brandgrid_Grid_id=&owner_status=1&issalesmanage=yes");	
	  	}
	  	
	</script>
<input type="hidden" value="<s:property value="owner_status"/>" id="owner_status"/>
<input type="hidden" value="<s:property value="sales_id"/>" id="sales_id"/>
<input type="hidden" value="<s:property value="time"/>" id="time"/>
<input type="hidden" value="<s:property value="brandgrid_Grid_id"/>" id="brandgrid_Grid_id"/>
<table id="fengye" width="100%" border="0" >
			<tr>
			<td align="center"><s:property value="page"/>/<s:property value="hasPages"/></td>
			<td align="center">
				<s:url id="url" action="show_All_Notes_brandOwner">
				<s:param name="page">1</s:param>
				<s:param name="issalesmanage">yes</s:param>
				<s:param name="sales_id"><s:property value="sales_id"/></s:param>
				<s:param name="owner_status"><s:property value="owner_status"/></s:param>
				<s:param name="time"><s:property value="time"/></s:param>
				<s:param name="brandgrid_Grid_id"><s:property value="brandgrid_Grid_id"/></s:param>
			    </s:url>
				<s:a href="%{url}" onclick="return justNextPage();">第一页</s:a>
			</td>
			<td align="center">
				<s:url id="url" action="show_All_Notes_brandOwner">
				<s:param name="page"><s:property value="page-1"/></s:param>
				<s:param name="issalesmanage">yes</s:param>
				<s:param name="sales_id"><s:property value="sales_id"/></s:param>
				<s:param name="owner_status"><s:property value="owner_status"/></s:param>
				<s:param name="time"><s:property value="time"/></s:param>
				<s:param name="brandgrid_Grid_id"><s:property value="brandgrid_Grid_id"/></s:param>
			   </s:url>
				<s:a href="%{url}" onclick="return justNextPage();">上一页</s:a>
			</td>
			<td align="center">
				<s:url id="url" action="show_All_Notes_brandOwner">
				<s:param name="page"><s:property value="page+1"/></s:param>
				<s:param name="issalesmanage">yes</s:param>
				<s:param name="sales_id"><s:property value="sales_id"/></s:param>
				<s:param name="owner_status"><s:property value="owner_status"/></s:param>
				<s:param name="time"><s:property value="time"/></s:param>
				<s:param name="brandgrid_Grid_id"><s:property value="brandgrid_Grid_id"/></s:param>
				</s:url>
				<s:a href="%{url}" onclick="return justUpPage();">下一页</s:a>
			</td>
			<td align="center">
				<s:url id="url" action="show_All_Notes_brandOwner">
				<s:param name="page"><s:property value="hasPages"/></s:param>
				<s:param name="issalesmanage">yes</s:param>
				<s:param name="sales_id"><s:property value="sales_id"/></s:param>
				<s:param name="owner_status"><s:property value="owner_status"/></s:param>
				<s:param name="time"><s:property value="time"/></s:param>
				<s:param name="brandgrid_Grid_id"><s:property value="brandgrid_Grid_id"/></s:param>
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
