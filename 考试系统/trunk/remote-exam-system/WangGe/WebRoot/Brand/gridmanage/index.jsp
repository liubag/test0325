<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title></title>	
		<script language="JavaScript">
			if (window != top)
				top.location.href = "${pageContext.request.contextPath}/Brand/gridmanage/index.jsp";
			}
		</script>
	</head>

	<body>
	你好！<s:property value="#session.grid_username"/>，
              	  	<s:url id="url" action="exit_gridowner">
					</s:url>
			<s:a href="%{url}" method="post">安全退出</s:a>
	</body>
</html>
