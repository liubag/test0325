<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>注册成功-淘书轩</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/login2012.css"/>
<link rel="stylesheet" type="text/css" href="unite_header.css"/>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/register.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/Showcode.js"></script>
<script id="json_script"type="text/javascript"src="<%=request.getContextPath()%>/js/categorydata.js"></script>
<script type="text/javascript">
		var indexHref="http://localhost:8080/TaoShuXuan/regok.jsp";
		if(top.location.href!=indexHref){
			top.location.href=indexHref;
		}
	</script>
</head>

<body>
<div id="header_page">
           <jsp:include page="header.jsp" />
    </div>
<div class="login_content">
	<div class="login_content_dash">
		<span class="login_content_dasht"></span>
		<div class="login_content_border">
			<h2>
				<div class="reg_title">
					<img src="<%=request.getContextPath()%>/images/title_succeed.png"alt="注册成功">				
				</div>
			</h2>
			<div class="login_title_email_ok">
				<p>
					<span>1.填写注册信息</span>
				</p>
				<p class="nonce">
				<span>2.注册成功</span>
				</p>
		</div>
		<div class="login_mail_border_login_succeed_border">
			<div class="login_mail_title border-bot">
         		<p>
		  			<b>恭喜您注册成功！</b>
				</p>
          		<p>您今后可使用邮箱
					<span></span>
					登录淘书轩。
				</p>
			</div>
		</div>
</div>
s
</body>
</html>
