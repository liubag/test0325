<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    
    <title>淘书轩页面首部</title>
    
	<link href="<%=request.getContextPath()%>/css/basic.css" rel="stylesheet" type="text/css" />

  </head>
  
  <body>
  <div id="header_nav_page">
  	<jsp:include page="header_nav.jsp"></jsp:include>
  </div>
  <div id="header">
     		<div id="nav1">
            </div>
			<div id="logo"><img src="<%=request.getContextPath()%>/images/logo.jpg"/></div>  
			<div id="nav2">
				<img src="<%=request.getContextPath()%>/images/nav2.jpg" alt="导航"/>
					<ul>
						<li><a href="<%=request.getContextPath() %>/index.jsp">首页</a></li>
						<li><a href="gainGoods_by_keyWord.do?otherOrderBy=&keyWord=影视图书&rowName=3">影视图书</a></li>
						<li><a href="gainGoods_by_keyWord.do?otherOrderBy=&keyWord=人生哲学&rowName=3">人生哲学</a></li>
						<li><a href="gainGoods_by_keyWord.do?otherOrderBy=&keyWord=佛学&rowName=3">佛学</a></li>
						<li><a href="gainGoods_by_keyWord.do?otherOrderBy=&keyWord=IT书籍&rowName=2">IT书籍</a></li>
					</ul>
			</div>
	 </div>
  </body>
</html>
