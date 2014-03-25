<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title></title>
	<script src="${pageContext.request.contextPath}/admin/js/jquery-1.5.1.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/admin/js/table_tr.js" type="text/javascript"></script>
	<link href="${pageContext.request.contextPath}/admin/css/table_tr.css" type="text/css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/admin/css/table.css" type="text/css" rel="stylesheet" />
	<script src="${pageContext.request.contextPath}/admin/js/addgridtypepage.js" type="text/javascript"></script>

</head>

<body>
<div id="box" >
  <div id="zhuanghu" align="center">
  	<s:form method="post" action="saveGridType">
  	<table style="border: 0;">
  		<tr>
  		<td class="table_td_11">格子类型名称(10个字以内)：</td><td class="table_td_12"><s:textfield name="gridType.gridtypename" maxlength="10" id="gtn" value=""/></td>
  		</tr>
  		<tr>
  		<td class="table_td_11">可容纳商品数：</td><td class="table_td_12"><s:textfield name="gridType.canshowgoods" id="gtcsg" onkeyup="this.value=this.value.replace(/\D/g,'')" ondragenter="return false" style="ime-mode:Disabled" size="5" value=""/>个商品</td>
  		</tr>
  		<tr>
  		<td class="table_td_11">单价（整数）：</td><td class="table_td_12"><s:textfield name="gridType.unitprice" id="gtup" onkeyup="this.value=this.value.replace(/\D/g,'')" ondragenter="return false" style="ime-mode:Disabled" size="5" value=""/>元整</td>
  		</tr>
  		<tr>
  		<td class="table_td_11">可用硬盘空间：</td><td class="table_td_12"><s:textfield name="gridType.hard_disk_space" id="gthds" size="5" onkeyup="this.value=this.value.replace(/\D/g,'')" ondragenter="return false" style="ime-mode:Disabled" value=""/>MB</td>
  		</tr>
  		<tr>
  		<td class="table_td_11">每天可置顶次数：</td><td class="table_td_12"><s:textfield name="gridType.LZ_note" id="gtlz" size="5" onkeyup="this.value=this.value.replace(/\D/g,'')" ondragenter="return false" style="ime-mode:Disabled" value=""/>次</td>
  		</tr>
  		<tr>
  		<td class="table_td_11"><s:submit value="添加" onclick="return check();"/></td><td class="table_td_12" ><s:reset value="重置" /></td>
  		</tr>
  	</table>
	</s:form>
		<br/>
		<br/>
		<s:property value="tip"/>
		
		<table id="table2">
			<thead>
				<tr><th>编号</th><th>类型</th><th>可容纳商品</th><th>可使用空间大小</th><th>每天可置顶次数</th><th>单价</th><th>目前格子数</th><th>操作</th></tr>
			</thead>
			<tbody>
			
			<s:action name="showAllGridType" executeResult="false"></s:action>
		  	<s:iterator value="#request.gridtype_l" status="st">
		  		<tr>
		  		<td><s:property value="gridtype_id"/></td>
		  		<td><s:property value="gridtypename"/></td>
		  		<td><s:property value="canshowgoods"/></td>
		  		<td><s:property value="hard_disk_space"/>MB</td>
		  		<td><s:property value="LZ_note"/></td>
		  		<td><s:property value="unitprice"/></td>
			  	<td><s:property value="amount"/></td>
			  	<td>
			  	<a href="${pageContext.request.contextPath}/admin/ScatteredGrid/updateScatteredGridType.jsp?gridtypeid=<s:property value="gridtype_id"/>&gridtypename=<s:property value="gridtypename"/>&canshowgoods=<s:property value="canshowgoods"/>&unitprice=<s:property value="unitprice"/>&hard_disk_space=<s:property value="hard_disk_space"/>&lz_note=<s:property value="LZ_note"/>">修改</a> 
			  	|
			  	<s:if test="amount<=0">
			  	
			  		<s:url id="url" action="deleGridType">
				        <s:param name="gridtypeid"><s:property value="gridtype_id"/></s:param>
					</s:url>
			  		<s:a href="%{url}" method="post" onclick="return forcedo2();">删除</s:a>
			  	</s:if>
			  	<s:else>
			  		 ----
			  	</s:else>
			  	</td>
		  		</tr>	
		  	</s:iterator>
			</tbody>	
		</table>
  </div>
</div>
</body>
</html>