<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<title></title>
<style>

</style>
<script language="javascript" type="text/javascript" src="${pageContext.request.contextPath}/searchEngine/js/jquery-1.6.4.min.js"></script>
<script language="javascript" type="text/javascript" src="${pageContext.request.contextPath}/searchEngine/js/jquery.jSuggest.1.0.js"></script>
<script language="javascript" type="text/javascript" src="${pageContext.request.contextPath}/searchEngine/js/indexshou.js"></script>
<LINK rel=stylesheet type=text/css href="${pageContext.request.contextPath}/searchEngine/js/indexshou.css"/>
<script language="javascript">

</script>
</head>
<body>

<div>
<s:action name="findFridKeyWord" executeResult="false"></s:action>
<input type="hidden" value="${keyWord}" id="forYa"/>
<input type="text" style="width:300px;height:20px" value="${keyWord}" name="searchQuery" id="ya" onfocus="Yaonfocus();" onblur="Yaonblur();"/>
<input type="submit" id="send" value="搜索"/>
</div>
</body>
</html>
