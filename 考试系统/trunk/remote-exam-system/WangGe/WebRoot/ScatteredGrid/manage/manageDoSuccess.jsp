<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title></title>
	<script src="${pageContext.request.contextPath}/ScatteredGrid/js/jquery-1.5.1.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/ScatteredGrid/js/onloadIframe.js" type="text/javascript"></script>
	<script type="text/javascript">
	  	$(document).ready(function () {
	    	var height = $("body").height();
			$("#rightIframe",parent.document.body).height(height + 50);
			alert("操作成功！");
		});
</script>
</head>

<body>
<div id="box" >
  <div id="zhuanghu">
  	操作成功！
  </div>
</div>
</body>
</html>