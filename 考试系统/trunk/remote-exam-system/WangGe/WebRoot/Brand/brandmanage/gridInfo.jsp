<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
<script src="${pageContext.request.contextPath}/Brand/js/jquery-1.6.4.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/Brand/js/gridInfo.js" type="text/javascript"></script>
<link href="${pageContext.request.contextPath}/Brand/css/gridInfo.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/Brand/css/dialog.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/Brand/js/jquery-latest.pack.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/Brand/js/dialog.js" type="text/javascript"></script>
</head>

<body onload="refreshSize()">

<div id="top">店Logo</div>
<s:form action="uploadGridLogo_owner" method="post" autocomplete="off" enctype="multipart/form-data" theme="simple">
<table cellspacing="0">
  <tr>
    <td class="td2"></td>
  </tr>
  <tr>
    <td><div id="tu">
    	<img src="${pageContext.request.contextPath}<s:text name="brandLogo" />/<s:property value="#session.brand_id"/>/<s:property value="#session.brand_id"/>.jpg" />
    </div>
	    <div id="shangchuan"> <input type="file" name="file" id="file11" style="ime-mode:Disabled"/>
	         <div id="imgShow"></div>
	    </div>
	</td>
  </tr>
    <tr>
    <td class="td4"><span id="xiugai">修改</span>
    <div id="msure">
    <input type="hidden" name="owner_status" value="gzxi"/>
    <input type="submit" value="确定" id="yes" class="anniu"/><input name="" type="reset" value="取消" id="no" class="anniu"/>
    </div>
	</td>
  </tr>
</table>
</s:form>
</body>
</html>
