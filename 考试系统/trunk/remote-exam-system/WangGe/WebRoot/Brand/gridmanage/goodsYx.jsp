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
if(owner_status == '6'){
$("#yishangjia").attr("class","yes");
$("#xiaguoqi").attr("class","no");
$("#xiashibai").attr("class","no");
$("#shenxia").attr("class","no");
}else if(owner_status == '3'){
$("#yishangjia").attr("class","no");
$("#xiaguoqi").attr("class","yes");
$("#xiashibai").attr("class","no");
$("#shenxia").attr("class","no");
}else if(owner_status == '8'){
$("#yishangjia").attr("class","no");
$("#xiaguoqi").attr("class","no");
$("#xiashibai").attr("class","yes");
$("#shenxia").attr("class","no");
}else if(owner_status == '1'){
$("#yishangjia").attr("class","no");
$("#xiaguoqi").attr("class","no");
$("#xiashibai").attr("class","no");
$("#shenxia").attr("class","yes");
}

} 

function turnToThe(){
	if(!confirm('商品转移都旧库存的同时会清除该商品图片，是否确定删除操作？')){return false;}
		  $("#table2").hide();
		  $("#myDialog").show();
		  return true; 
	}
</script>
<link href="${pageContext.request.contextPath}/Brand/css/dangqianshangjia.css" rel="stylesheet" type="text/css" />
<style type="text/css">
#fengye td{
	height: 10px;
}
</style>
</head>

<body onload="refreshSize()">
<div id="table2">
<input type="hidden" id="owner_status" value="<s:property value="statu"/>"/>
<div id="top">
		<span id="yishangjia">
          <s:url id="url" action="show_All_Goods_gridOwner">
			<s:param name="page">1</s:param>
			<s:param name="statu_choice"><s:property value="statu_choice"/></s:param>
			<s:param name="statu">6</s:param>
			</s:url>
		<s:a href="%{url}" target="giframe" cssClass="childmenu">已下架</s:a>
         </span>
         <span id="shenxia"><s:url id="url" action="show_All_Goods_gridOwner">
			<s:param name="page">1</s:param>
			<s:param name="statu_choice"><s:property value="statu_choice"/></s:param>
			<s:param name="statu">1</s:param>
			</s:url>
		<s:a href="%{url}" target="giframe" cssClass="childmenu">申请上架</s:a>
		</span>
		 <span id="xiaguoqi"><s:url id="url" action="show_All_Goods_gridOwner">
			<s:param name="page">1</s:param>
			<s:param name="statu_choice"><s:property value="statu_choice"/></s:param>
			<s:param name="statu">3</s:param>
			</s:url>
		<s:a href="%{url}" target="giframe" cssClass="childmenu">申请上架过期</s:a>
		</span>
		<span id="xiashibai"><s:url id="url" action="show_All_Goods_gridOwner">
			<s:param name="page">1</s:param>
			<s:param name="statu_choice"><s:property value="statu_choice"/></s:param>
			<s:param name="statu">8</s:param>
			</s:url>
		<s:a href="%{url}" target="giframe" cssClass="childmenu">申请上架失败</s:a>
		</span>
</div>
<table cellspacing="0">
  <tr>
    <td class="td2">商品编号</td>
    <td class="td2">商品图片</td>
    <td class="td2">名称</td>
    <td class="td2">当前/市场/折扣</td>
    <td class="td2">原本-剩余=售出（单位）</td>
    <td class="td2">状态</td>
    <td class="td2">下架时间</td>
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
    <td class="td3"><s:property value="goods_hasamount"/> - <s:property value="residual_mount"/> = <s:property value="goods_hasamount-residual_mount"/>（<s:property value="unit"/>）</td>
    <td class="td3">
    	<s:if test="status==1">
    	申请上架
    	</s:if>
    	<s:elseif test="status==3">
    	申上过期
    	</s:elseif>
    	<s:elseif test="status==8">
    	申上失败
    	</s:elseif>
    	<s:elseif test="status==6">
    	已下架
    	</s:elseif>
    </td>
    <td class="td3"><s:property value="undercarriage_time.toLocaleString()"/></td>
     <td class="td6">
     <s:if test="status==1">
    	<p>
    	<s:url id="url" action="quexiao_gridowner">
    		<s:param name="brandgrid_goods_id"><s:property value="brandgrid_goods_id"/></s:param>
			<s:param name="page"><s:property value="page"/></s:param>
			<s:param name="statu_choice"><s:property value="statu_choice"/></s:param>
			<s:param name="statu"><s:property value="statu"/></s:param>
		</s:url>
		<s:a href="%{url}">取消申请</s:a>
    	</p>
    	</s:if>
    	<s:elseif test="status==3">
    	<p>
    	<s:url id="url" action="doGoodsStatu_gridowner">
    		<s:param name="brandgrid_goods_id"><s:property value="brandgrid_goods_id"/></s:param>
			<s:param name="page"><s:property value="page"/></s:param>
			<s:param name="statu_choice"><s:property value="statu_choice"/></s:param>
			<s:param name="statu"><s:property value="statu"/></s:param>
		</s:url>
		<s:a href="%{url}">重新申请</s:a>
    	</p>
    	<p>
    	<s:url id="url" action="turnToTheOldGoods_gridowner">
    		<s:param name="brandgrid_goods_id"><s:property value="brandgrid_goods_id"/></s:param>
			<s:param name="page"><s:property value="page"/></s:param>
			<s:param name="statu_choice"><s:property value="statu_choice"/></s:param>
			<s:param name="statu"><s:property value="statu"/></s:param>
		</s:url>
		<s:a href="%{url}" onclick="return turnToThe();">转到旧库存</s:a>
    	</p>
    	</s:elseif>
    	<s:elseif test="status==8">
    	<p>
    	<s:url id="url" action="doGoodsStatu_gridowner">
    		<s:param name="brandgrid_goods_id"><s:property value="brandgrid_goods_id"/></s:param>
			<s:param name="page"><s:property value="page"/></s:param>
			<s:param name="statu_choice"><s:property value="statu_choice"/></s:param>
			<s:param name="statu"><s:property value="statu"/></s:param>
		</s:url>
		<s:a href="%{url}">重新申请</s:a>
    	</p>
    	<p>
    	<s:url id="url" action="turnToTheOldGoods_gridowner">
    		<s:param name="brandgrid_goods_id"><s:property value="brandgrid_goods_id"/></s:param>
			<s:param name="page"><s:property value="page"/></s:param>
			<s:param name="statu_choice"><s:property value="statu_choice"/></s:param>
			<s:param name="statu"><s:property value="statu"/></s:param>
		</s:url>
		<s:a href="%{url}" onclick="return turnToThe();">转到旧库存</s:a>
    	</p>
    	</s:elseif>
    	<s:elseif test="status==6">
    	<p>
    	<s:url id="url" action="doGoodsStatu_gridowner">
    		<s:param name="brandgrid_goods_id"><s:property value="brandgrid_goods_id"/></s:param>
			<s:param name="page"><s:property value="page"/></s:param>
			<s:param name="statu_choice"><s:property value="status"/></s:param>
			<s:param name="statu"><s:property value="status"/></s:param>
		</s:url>
		<s:a href="%{url}">申请上架</s:a>
    	</p>
    	<p>
    	<s:url id="url" action="findGI_user">
    		<s:param name="gi"><s:property value="brandgrid_goods_id"/></s:param>
			<s:param name="isbrandgrid_grid">yes</s:param>
		</s:url>
		<s:a href="%{url}">修改</s:a>
		</p>
		<p>
		<s:url id="url" action="turnToTheOldGoods_gridowner">
    		<s:param name="brandgrid_goods_id"><s:property value="brandgrid_goods_id"/></s:param>
			<s:param name="page"><s:property value="page"/></s:param>
			<s:param name="statu_choice"><s:property value="statu_choice"/></s:param>
			<s:param name="statu"><s:property value="statu"/></s:param>
		</s:url>
		<s:a href="%{url}" onclick="return turnToThe();">转到旧库存</s:a>
		</p>
    	</s:elseif>
    	
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
				<s:param name="statu"><s:property value="statu"/></s:param>
				<s:param name="statu_choice"><s:property value="statu_choice"/></s:param>
			    </s:url>
				<s:a href="%{url}" onclick="return justNextPage();">第一页</s:a>
			</td>
			<td align="center">
				<s:url id="url" action="show_All_Goods_gridOwner">
				<s:param name="page"><s:property value="page-1"/></s:param>
				<s:param name="statu"><s:property value="statu"/></s:param>
				<s:param name="statu_choice"><s:property value="statu_choice"/></s:param>
			   </s:url>
				<s:a href="%{url}" onclick="return justNextPage();">上一页</s:a>
			</td>
			<td align="center">
				<s:url id="url" action="show_All_Goods_gridOwner">
				<s:param name="page"><s:property value="page+1"/></s:param>
				<s:param name="statu"><s:property value="statu"/></s:param>
				<s:param name="statu_choice"><s:property value="statu_choice"/></s:param>
				</s:url>
				<s:a href="%{url}" onclick="return justUpPage();">下一页</s:a>
			</td>
			<td align="center">
				<s:url id="url" action="show_All_Goods_gridOwner">
				<s:param name="page"><s:property value="hasPages"/></s:param>
				<s:param name="statu"><s:property value="statu"/></s:param>
				<s:param name="statu_choice"><s:property value="statu_choice"/></s:param>
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
</div>
<div id="myDialog" title="My Dialog" style="display:none;text-align:center; padding-top: 100px;">  
			<div style="margin-bottom: 30px;" id="waiting">处理当中，请稍等...</div>
			<div>  
				<img alt="" src="../pic/empty_180_180.gif"/> 
			</div>   
	</div> 
</body>
</html>
