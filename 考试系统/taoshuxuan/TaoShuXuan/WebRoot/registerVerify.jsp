<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>新用户注册邮箱验证-淘书轩</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/login2012.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/unite_header.css"/>

<script type="text/javascript"src="<%=request.getContextPath()%>/js/register_mobile.js"></script>
<script type="text/javascript"src="<%=request.getContextPath()%>/js/Showcode.js"></script>
<script type="text/javascript">
		var indexHref="http://localhost:8080/TaoShuXuan/registerVerify.jsp";
		if(top.location.href!=indexHref){
			top.location.href=indexHref;
		}
	</script>
</head>

<body>
<div id="header_page">
           <jsp:include page="header.jsp" />
    </div>
<div class="login_content shortmsg">
	<div class="login_content_dash">
			<div class="login_content_border">
			<h2>
				<div class="reg_title">
					<img src="<%=request.getContextPath()%>/images/title_welcome.png"alt="注册淘书轩" width="192" height="54" class="img_welcome"/>				
				</div>
			</h2>
				<div class="mobile_login_title msg_title_bar_2">
					<p class="one gray">
						<span>1.填写注册信息</span>
					</p>
					<p class="two nonce">
						<span>2.邮箱激活</span>
					</p>
					<p class="three gray">
						<span>3.注册成功</span>
					</p>
				</div>	
				<div class="mobile_login_content">
					<p>
						激活码已经发到注册邮箱，请查看并激活
					</p>
					</div>
					<input type="hidden" name="txtEmail" id="txtEmail"/>
					<input type="hidden" name="txtMobile" id="txtMobile" value=""/>
					<input type="hidden" name="txtPassword" id="txtPassword" value=""/>
					<input type="hidden" name="txtVerifyCode" id="txtVerifyCode" value="tbie"/>
					<input type="submit" name="Submit_Register" value="" id="Submit_Register" style="display:none"/>
			</div>
	</div>
	<div class="login_content_dashb">
	</div>
</div>
<div id="footer_page">
        	<jsp:include page="footer.jsp" />
    </div>
</body>
</html>
