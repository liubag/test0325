<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
<script src="${pageContext.request.contextPath}/Brand/js/jquery-1.6.4.min.js" type="text/javascript"></script>
<script type="text/javascript">
   function refreshSize() {
		var owner_status = $("#owner_status").val(); 
		if(owner_status == '1'){
		$("#dangqian").attr("class","yes");
		$("#yishenpi").attr("class","no");
		}else{
		$("#dangqian").attr("class","no");
		$("#yishenpi").attr("class","yes");
		}
	} 
	function btn(){
		var soutxt = $("#soutxt").val();
		if(soutxt=='请输入格子编号'){
			alert("请输入格子编号！");
			return false;
		}else{
			var statu_choice = $("#statu_choice").val();
			var owner_status = $("#owner_status").val();
			$("#siframe",parent.document.body).attr("src","show_All_Goods_brandOwner.do?page=1&brandgrid_Gridnum="+soutxt+"&statu_choice="+statu_choice+"&owner_status="+owner_status+"&issalesmanage=yes");
		}
	}
	var before_txt = "";
	function ku(){
		var soutxt = $("#soutxt").val();
		if(soutxt.length <= 10){
			before_txt = soutxt;
		}else{
			$("#soutxt").attr("value",before_txt);
		}
	}
</script>
<link href="${pageContext.request.contextPath}/Brand/css/shenpixiajia.css" rel="stylesheet" type="text/css" />
<style type="text/css">
#fengye td{
	height: 10px;
}
</style>
</head>

<body onload="refreshSize()">
<input type="hidden" id="statu_choice" value="<s:property value="statu_choice"/>"/>
<input type="hidden" id="owner_status" value="<s:property value="owner_status"/>"/>
<input type="hidden" id="st" value="<s:property value="brandgrid_Gridnum"/>"/>
<div id="top">
         <span id="dangqian">
         <s:url id="url" action="show_All_Goods_brandOwner">
				<s:param name="page">1</s:param>
				<s:param name="owner_status">1</s:param>
				<s:param name="issalesmanage">yes</s:param>
				<s:param name="statu_choice"><s:property value="statu_choice"/></s:param>
				<s:param name="brandgrid_Gridnum"><s:property value="brandgrid_Gridnum"/></s:param>
			    </s:url>
				<s:a href="%{url}" >当前需要审批</s:a>
         </span>
		 <span id="yishenpi">
		  <s:url id="url" action="show_All_Goods_brandOwner">
				<s:param name="page">1</s:param>
				<s:param name="owner_status">2</s:param>
				<s:param name="issalesmanage">yes</s:param>
				<s:param name="statu_choice"><s:property value="statu_choice"/></s:param>
				<s:param name="brandgrid_Gridnum"><s:property value="brandgrid_Gridnum"/></s:param>
			    </s:url>
				<s:a href="%{url}" >今天审批记录</s:a>
		 </span>
		 <span id="sousuo">格子编号：<s:property value="brandgrid_Gridnum"/></br><input id="soutxt" type="text" class="sou"  value="请输入格子编号" onfocus="if(this.value=='请输入格子编号'){this.value=''};" onblur="if(this.value==''){this.value='请输入格子编号'};" onkeyup="ku();" /><input type="button" value="搜" onclick="return btn();"/></span>
</div>
<table cellspacing="0">
  <tr>
    <td class="td2">商品编号</td>
    <td class="td2">商品图片</td>
    <td class="td2">名称</td>
    <s:if test="statu_choice==1">
	    <td class="td2">当前/市场/折扣/数量</td>
    </s:if>
    <s:else>
    	<td class="td2">原本-剩余=售出（单位）</td>
    </s:else>
   	<td class="td2">申请时间</td>
    <s:if test="owner_status==1">
    	<td class="td2">过期时间</td>
    </s:if>
    <s:else>
    	<td class="td2">操作时间</td>
    </s:else>
    <td class="td2">状态</td>
    <td class="td2">操作</td>
  </tr>
  <s:iterator value="brandgridGoods_l" status="st">
  <tr>
    <td class="td3"><s:property value="brandgridGridOwner.brandgridGrid.addgoods_no"/>-<s:property value="goods_no"/></td>
    <td class="td3"><img src="${pageContext.request.contextPath}<s:text name="brandimgPath" />/<s:property value="brandgrid.brandgrid_id"/>/<s:property value="brandgridGridOwner.brandgrid_gridowner_id"/>/<s:property value="brandgrid_goods_id"/>/<s:property value="goods_photoname1"/>" alt="" /></td>
    <td class="td3"><s:property value="goods_name"/></td>
    <s:if test="statu_choice==1">
    <td class="td3"><s:property value="goods_price"/>￥/<s:property value="market_price"/>￥/<s:property value="goods_ZK"/>/<s:property value="residual_mount"/>（<s:property value="goodsType.type_name"/>/<s:property value="unit"/>）</td>
    </s:if>
    <s:else>
    <td class="td3"><s:property value="goods_hasamount"/> - <s:property value="residual_mount"/> = <s:property value="goods_hasamount-residual_mount"/>（<s:property value="goodsType.type_name"/>/<s:property value="unit"/>）</td>
    </s:else>
    
    <td class="td3"><s:property value="upload_time.toLocaleString()"/></td>
    <s:if test="owner_status==1">
    	<td class="td4"><s:property value="overdue_time.toLocaleString()"/></td>
    </s:if>
    <s:elseif test="status==5">
    	<td class="td4"><s:property value="put_time.toLocaleString()"/></td>
    </s:elseif>
    <s:elseif test="status==6">
    	<td class="td4"><s:property value="undercarriage_time.toLocaleString()"/></td>
    </s:elseif>
    <s:elseif test="status==8 || status==9">
    	<td class="td4"><s:property value="makesure_time.toLocaleString()"/></td>
    </s:elseif>
    <td class="td3">
    	<s:if test="status==1">
    		申请上架
    	</s:if>
    	<s:elseif test="status==5">
    		已上架
    	</s:elseif>
    	<s:elseif test="status==8">
    		申上失败
    	</s:elseif>
    	<s:elseif test="status==6">
    		已下架
    	</s:elseif>
    	<s:elseif test="status==2">
    		申请下架
    	</s:elseif>
    	<s:elseif test="status==9">
    		申下失败
    	</s:elseif>
    </td>
    <td class="td6">
    	<s:if test="owner_status==2">
    	<p>
    	<s:url id="url" action="goodsHuiGun_salesman">
    		<s:param name="gi"><s:property value="brandgrid_goods_id"/></s:param>
			<s:param name="page"><s:property value="page"/></s:param>
			<s:param name="statu_choice"><s:property value="statu_choice"/></s:param>
			<s:param name="issalesmanage">yes</s:param>
			<s:param name="owner_status"><s:property value="owner_status"/></s:param>
			<s:param name="brandgrid_Gridnum"><s:property value="brandgrid_Gridnum"/></s:param>
		</s:url>
		<s:a href="%{url}">回滚</s:a>
    	</p>
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
    	</s:if>
    	<s:else>
    	<p>
    	<s:url id="url" action="goodsTG_salesman">
    		<s:param name="gi"><s:property value="brandgrid_goods_id"/></s:param>
			<s:param name="page"><s:property value="page"/></s:param>
			<s:param name="statu_choice"><s:property value="statu_choice"/></s:param>
			<s:param name="issalesmanage">yes</s:param>
			<s:param name="owner_status"><s:property value="owner_status"/></s:param>
			<s:param name="brandgrid_Gridnum"><s:property value="brandgrid_Gridnum"/></s:param>
		</s:url>
		<s:a href="%{url}">确认通过</s:a>
    	</p>
    	<p>
    	<s:url id="url" action="goodsBuTG_salesman">
    		<s:param name="gi"><s:property value="brandgrid_goods_id"/></s:param>
			<s:param name="page"><s:property value="page"/></s:param>
			<s:param name="statu_choice"><s:property value="statu_choice"/></s:param>
			<s:param name="issalesmanage">yes</s:param>
			<s:param name="owner_status"><s:property value="owner_status"/></s:param>
			<s:param name="brandgrid_Gridnum"><s:property value="brandgrid_Gridnum"/></s:param>
		</s:url>
		<s:a href="%{url}">申请不通过</s:a>
    	</p>
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
    	</s:else>
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
			var statu_choice = $("#statu_choice").val();
			var owner_status = $("#owner_status").val();
			var brandgrid_Gridnum = &("#brandgrid_Gridnum").val();
	  		$("#siframe",parent.document.body).attr("src","show_All_Goods_brandOwner.do?page="+select.value+"&statu_choice="+statu_choice+"&owner_status="+owner_status+"&brandgrid_Gridnum="+brandgrid_Gridnum);
	  	}
	  	
	</script>

<table id="fengye" width="100%" border="0">
			<tr>
			<td align="center"><span id="page2"><s:property value="page"/></span>/<s:property value="hasPages"/></td>
			<td align="center">
				<s:url id="url" action="show_All_Goods_brandOwner">
				<s:param name="page">1</s:param>
				<s:param name="issalesmanage">yes</s:param>
				<s:param name="owner_status"><s:property value="owner_status"/></s:param>
				<s:param name="statu_choice"><s:property value="statu_choice"/></s:param>
				<s:param name="brandgrid_Gridnum"><s:property value="brandgrid_Gridnum"/></s:param>
			    </s:url>
				<s:a href="%{url}" onclick="return justNextPage();">第一页</s:a>
			</td>
			<td align="center">
				<s:url id="url" action="show_All_Goods_brandOwner">
				<s:param name="page"><s:property value="page-1"/></s:param>
				<s:param name="issalesmanage">yes</s:param>
				<s:param name="owner_status"><s:property value="owner_status"/></s:param>
				<s:param name="statu_choice"><s:property value="statu_choice"/></s:param>
				<s:param name="brandgrid_Gridnum"><s:property value="brandgrid_Gridnum"/></s:param>
			   </s:url>
				<s:a href="%{url}" onclick="return justNextPage();">上一页</s:a>
			</td>
			<td align="center">
				<s:url id="url" action="show_All_Goods_brandOwner">
				<s:param name="page"><s:property value="page+1"/></s:param>
				<s:param name="issalesmanage">yes</s:param>
				<s:param name="owner_status"><s:property value="owner_status"/></s:param>
				<s:param name="statu_choice"><s:property value="statu_choice"/></s:param>
				<s:param name="brandgrid_Gridnum"><s:property value="brandgrid_Gridnum"/></s:param>
				</s:url>
				<s:a href="%{url}" onclick="return justUpPage();">下一页</s:a>
			</td>
			<td align="center">
				<s:url id="url" action="show_All_Goods_brandOwner">
				<s:param name="page"><s:property value="hasPages"/></s:param>
				<s:param name="issalesmanage">yes</s:param>
				<s:param name="owner_status"><s:property value="owner_status"/></s:param>
				<s:param name="statu_choice"><s:property value="statu_choice"/></s:param>
				<s:param name="brandgrid_Gridnum"><s:property value="brandgrid_Gridnum"/></s:param>
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
