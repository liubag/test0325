<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title></title>
	<script src="${pageContext.request.contextPath}/admin/js/jquery-1.5.1.min.js" type="text/javascript"></script>
	<link href="${pageContext.request.contextPath}/admin/css/table.css" type="text/css" rel="stylesheet" />
	<script src="${pageContext.request.contextPath}/admin/js/findpage.js" type="text/javascript"></script>
</head>

<body>
<div id="box" >
  <div id="zhuanghu" align="center" >
  	<div>
  	<s:property value="tip"/>
  	<br/>
  	<s:form method="post" action="find_accounts_truename">
  	<div> 通过真实姓名查找：<s:textfield id="truename" name="truename" value="" maxlength="20" id="tn"/></div>
	<div><s:submit value="查询"  onclick="return check1();"/><s:reset value="重置"/></div>
  	</s:form>
  	</div>
  	<br/>
  	<div>
  	<s:form method="post" action="findGoodsName">
  	<div> 商品名称查找：<s:textfield id="goodsname" name="goodsname" value="" maxlength="20" id="gn"/></div>
	<div><s:submit value="查询"  onclick="return check2();"/><s:reset value="重置"/></div>
  	</s:form>
  	</div>
  	<br/>
  	<div>
  	<s:form method="post" action="find_gridname">
  	<div>  格子名称查找：<s:textfield id="goodsname" name="girdname" value="" maxlength="25" id="grn"/></div>
	<div><s:submit value="查询"  onclick="return check3();"/><s:reset value="重置"/></div>
	  	
  	</s:form>
  	</div>
  	
  	<div id="myDialog" title="My Dialog" style="display:none;background-color: blue;">  
			<div id="dialogContent" style="overflow-y: auto; height: 100%;">  
				<span class="blue13">waiting..</span>  
			</div>   
 	</div>
 	</div>
</div>
</body>
</html>