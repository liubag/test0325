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
		<table id="table2">
			<thead>
				<tr><th>格子名称</th><th>评分</th><th>状态</th><th>当前合同租用类型</th><th>当前合同租用时间类型</th><th style="text-align: center">操作</th></tr>
			</thead>
			<tbody>
				<tr>
				<td><s:property value="scatteredGrid.grid_name"/></td>
				<td><s:property value="scatteredGrid.rendtype_evaluation"/></td>
				<td>
				<s:if test="scatteredGrid.status=0">
					已注销
				</s:if>
				<s:else>
					正常使用
				</s:else>
				</td>
				<td><s:property value="scatteredGrid.scatteredGridAgreement.gridType.gridtypename"/></td>
				<td><s:property value="scatteredGrid.scatteredGridAgreement.type_called"/></td>
				<td style="text-align: center">
		  			<s:url id="url" action="find_accounts">
						<s:param name="owner_id"><s:property value="scatteredGrid.owner_id"/></s:param>
					</s:url>
					<s:a href="%{url}" method="post"> 查看账户详情 </s:a>	<br/>
					<s:url id="url" action="showAllGoods_by_page_admin_gridid">
						<s:param name="gridid"><s:property value="scatteredGrid.gridid"/></s:param>
						<s:param name="gridname"><s:property value="scatteredGrid.grid_name"/></s:param>
						<s:param name="goodstatu">1</s:param>
					</s:url>
					<s:a href="%{url}" method="post"> 查看格子商品 </s:a>	
		  		</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
</body>
</html>