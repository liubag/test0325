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

<div id="search_div">
<s:action name="findFridKeyWord" executeResult="false"></s:action>
<input type="hidden" value="${keyWord}" id="forYa"/>

<div class="search-panel">
	<input type="text" value="${keyWord}" name="searchQuery" id="ya" onfocus="Yaonfocus();" onblur="Yaonblur();"/>
	<div class="search-select">
	<select id="rowName" name="rowName">
		<option value="1">图书名称</option>
		<option value="2">图书作者</option>
		<option value="3">图书分类</option>
	</select>
</div>
</div>
<input type="submit" id="send" value="搜 索"/>
<div class="hot_search">热门搜索：
	<a href="gainGoods_by_keyWord.do?otherOrderBy=&keyWord=韩寒&rowName=2">韩寒</a>
	<a href="gainGoods_by_keyWord.do?otherOrderBy=&keyWord=人月神话&rowName=1">人月神话</a>
</div>	
</div>
 
</body>
</html>
