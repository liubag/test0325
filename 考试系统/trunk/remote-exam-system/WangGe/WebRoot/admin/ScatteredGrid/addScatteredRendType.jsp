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
	<script src="${pageContext.request.contextPath}/admin/js/addrendtypepage.js" type="text/javascript"></script>
</head>

<body>
<div id="box" >
  <div id="zhuanghu" align="center">
  		<s:form method="post" action="saveRendType">
  		<table>
  		<tr>
  		<td class="table_td_11">出租类型名称(15个字以内)：</td><td class="table_td_12"><s:textfield name="scatteredGridRendtypeMake.type_called" id="tc" maxlength="15"/></td>
  		</tr>
  		<tr>
  		<td class="table_td_11">出租时间月份：</td><td class="table_td_12"><s:textfield name="scatteredGridRendtypeMake.months" id="mon" onkeyup="this.value=this.value.replace(/\D/g,'')" ondragenter="return false" style="ime-mode:Disabled" size="3"/>个月</td>
  		</tr>
  		<tr>
  		<td class="table_td_11">折扣：</td><td class="table_td_12"><s:textfield name="scatteredGridRendtypeMake.rendtype_agio" size="3" id="ra" onkeyup="this.value=this.value.replace(/\D/g,'')" ondragenter="return false" style="ime-mode:Disabled"/>(如：1、0.9、0.5等)</td>
  		</tr>
  		<tr>
  		<td class="table_td_11"><s:submit value="添加" onclick="return check();" /></td><td class="table_td_12"><s:reset value="重置" /></td>
  		</tr>
		</table>
		</s:form>
		
		<s:property value="tip"/>
		<table id="table2">
			<thead>
				<tr><th>编号</th><th>类型</th><th>出租月份</th><th>折扣</th><th>修改</th><th>删除</th></tr>
			</thead>
			<tbody>
			
			<s:action name="showAllRendType" executeResult="false"></s:action>
		  	<s:iterator value="#request.rendTypeMake_l" status="st">
		  		<tr>
		  		<td><s:property value="rendtype_id"/></td>
		  		<td><s:property value="type_called"/></td>
		  		<td><s:property value="months"/></td>
		  		<td><s:property value="rendtype_agio"/></td>
		  		<td><a href="${pageContext.request.contextPath}/admin/ScatteredGrid/updateScatteredRendType.jsp?rendtype_id=<s:property value="rendtype_id"/>&type_called=<s:property value="type_called"/>&months=<s:property value="months"/>&rendtype_agio=<s:property value="rendtype_agio"/>" >修改</a></td>
		  		<td>
			  	<s:url id="url" action="deleRendType">
				    <s:param name="rendtype_id"><s:property value="rendtype_id"/></s:param>
				</s:url>
			  	<s:a href="%{url}" method="post" onclick="return forcedo2();">删除</s:a>
			  	</td>
		  		</tr>	
		  	</s:iterator>
			</tbody>	
		</table>
  </div>
</div>
</body>
</html>