<%@ page language="java" import="java.util.*,com.OnlineGridShop.scattered.Entity.GridType" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title></title>
	<script src="${pageContext.request.contextPath}/admin/js/jquery-1.5.1.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/admin/js/table_tr.js" type="text/javascript"></script>
	<link href="${pageContext.request.contextPath}/admin/css/table_tr.css" type="text/css" rel="stylesheet" />
	<script src="${pageContext.request.contextPath}/ScatteredGrid/js/onloadIframe.js" type="text/javascript"></script>
</head>

<body>
<div id="box" >
  <div id="zhuanghu" align="center">
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
		function test(select){
	  		$("#rightIframe",parent.document.body).attr("src","showAllGrid_by_page_user.do?page="+select.value );
	  	}
	  	
	  	$(document).ready(function () {
		//提交，最终验证。
		 $("#sub").click(function(){
		 		
		 		 var str1= "";
				 $('[name=grid_type_id]:radio:checked').each(function(){
						str1+=$(this).val();
				 })
				 
				 if(str1==""){
					 alert("未选中格子类型");
					 return false;
				 }
				 var str2 = "";
				 $('[name=statu]:radio:checked').each(function(){
						str2+=$(this).val();
				 })
				 if(str2==""){
					 alert("未选中状态");
					 return false;
				 }
				 return true;
		 });
    });
	function refreshSize() {
	    if (top.location != self.location) {
	        var a = window.parent.document.getElementsByName('rightIframe');
	        for (var i = 0; i < a.length; i++) {
	            if (a[i].name == self.name) {
	                a[i].height = this.document.body.offsetHeight + 50; 
	                return;
	            }
	        }
	    }
	}
	  	
	</script>
		<s:form method="post" action="showAllGrid_by_page_user">
		<div style="width:100%">
			<div style="float:left; width:150px;">选择格子类型：</div>
			<div style="float:left;width:150px;text-align: left"">
			<input type="hidden" name="page" value="1" />
			<s:action name="showAllGridType" executeResult="false"></s:action>
			<%
		  		List<GridType> gridtype_l = (List<GridType>)request.getAttribute("gridtype_l");
		  		for(GridType gt : gridtype_l){
		  			%>
		  			<input type="radio"  class="grid_type_id" name="grid_type_id" value= "<%=gt.getGridtype_id() %>" /> <%=gt.getGridtypename()%><br/> 
		  			<%
		  		}
		  	 %>
			</div>
			<div style="float:left; width:100px;">选择状态：</div>
			<div style="float:left;width:200px; text-align: left">
				<input type="radio"  class="statu" name="statu" value= "12" /> 正常使用<br/>
				<input type="radio"  class="statu" name="statu" value= "0" /> 已注销<br/>
			</div>
			<div style="float:left; width:100px;"><input type="submit" value="筛选" id="sub"/></div>
		</div>
		</s:form>
		<br/>
		<br/>
		<br/>
		<br/>
		<table id="table2">
			<thead>
				<tr><th style="width: 150px;">格子名称</th><th style="width: 50px;">评分</th><th>状态</th><th style="width: 120px;">最近登录时间</th><th>可置顶商品次数</th><th>可置顶优惠次数</th><th style="width: 120px;">当前合同租用类型</th><th style="width: 120px;">当前合同租用类型</th><th style="text-align: center">操作</th></tr>
			</thead>
			<tbody>
			<s:iterator value="scatteredGrid_l" status="st">
				<tr>
				<td><s:property value="grid_name"/></td>
				<td><s:property value="rendtype_evaluation"/></td>
				<td>
				<s:if test="status=0">
					已注销
				</s:if>
				<s:else>
					正常使用
				</s:else>
				</td>
				<td><s:property value="LZ_time.toLocaleString()"/></td>
				<td><s:property value="LZ_note"/></td>
				<td><s:property value="LZ_preferential"/></td>
				<td><s:property value="scatteredGridAgreement.gridType.gridtypename"/></td>
				<td><s:property value="scatteredGridAgreement.type_called"/></td>
				<td style="text-align: center">
		  			<s:url id="url" action="find_accounts">
						<s:param name="owner_id"><s:property value="owner_id"/></s:param>
					</s:url>
					<s:a href="%{url}" method="post"> 查看账户详情 </s:a>	<br/>
					<s:url id="url" action="showAllGoods_by_page_admin_gridid">
						<s:param name="gridid"><s:property value="gridid"/></s:param>
						<s:param name="gridname"><s:property value="grid_name"/></s:param>
						<s:param name="goodstatu">1</s:param>
					</s:url>
					<s:a href="%{url}" method="post"> 查看格子商品 </s:a>	
		  		</td>
				</tr>
		  	</s:iterator>
			</tbody>
		</table>
		
		<table width="100%" border="0" cellspacing="10" cellpadding="10">
			<tr>
			<td align="center"><s:property value="page"/>/<s:property value="hasPages"/></td>
			<td align="center">
				<s:url id="url" action="showAllGrid_by_page_user">
			        <s:param name="page">1</s:param>
				</s:url>
				<s:a href="%{url}" onclick="return justNextPage();">第一页</s:a>
			</td>
			<td align="center">
				<s:url id="url" action="showAllGrid_by_page_user">
			        <s:param name="page"><s:property value="page-1"/></s:param>
				</s:url>
				<s:a href="%{url}" onclick="return justNextPage();">上一页</s:a>
			</td>
			<td align="center">
				<s:url id="url" action="showAllGrid_by_page_user">
			        <s:param name="page"><s:property value="page+1"/></s:param>
				</s:url>
				<s:a href="%{url}" onclick="return justUpPage();">下一页</s:a>
			</td>
			<td align="center">
				<s:url id="url" action="showAllGrid_by_page_user">
			        <s:param name="page"><s:property value="hasPages"/></s:param>
				</s:url>
				<s:a href="%{url}" onclick="return justUpPage();">最后一页</s:a>
			</td>
			<td align="center">
			跳转<s:select list="page_l" name="page" onchange="test(this);"/>
			</td>
			<td align="center">
			共有<s:property value="hasGrids"/>条记录
			</td>
			</tr>
		</table>
		</div>
</div>
</body>
</html>