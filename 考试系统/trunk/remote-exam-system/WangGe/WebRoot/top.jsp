<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<link href="<%=request.getContextPath()%>/css/rightTop.css"
			type="text/css" rel="stylesheet">
	</head>
	<body>
		<%
			String account = (String) session.getAttribute("current_audience");
		%>

		<div style="margin: 0 auto; width: 100%; overflow: hidden">

			<div class="nav_top_2011">
				<%
					if (account != null) {
				%>
				<ul>
					<li>
						欢迎
						<em><%=account%></em>
					</li>
					<li>
						<a href="/WangGe/audience_logout.do">退出</a>
					</li>
				</ul>
				<%
					} else {
				%>
				<ul>
					<li>
						亲，欢迎来网格！
					</li>
					<li>
						请
						<a href="/WangGe/audienceLogin.jsp">登录</a> |
					</li>
					<li>
						<a href="/WangGe/audience/audience_register.jsp">免费注册</a>
					</li>
				</ul>
			
				<%
					}
				%>
				<p>
					<a target="_blank" href="/WangGe/audience/audiencemanage/audience_centered.jsp?trigger=myAttention">我的关注</a>
					<a target="_blank" href="/WangGe/audience/audiencemanage/audience_centered.jsp">个人中心</a>
					<a target="_blank" href="">帮助</a>
				</p>

			</div>

		</div>
	</body>
</html>