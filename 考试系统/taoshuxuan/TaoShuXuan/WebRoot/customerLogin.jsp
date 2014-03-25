<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>登录 - 淘书轩</title>
<link href="<%=request.getContextPath() %>/css/customer_login.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-1.2.6.pack.js"></script>

</head>


<body>	            

<form name="Form1" method="post" action="customerLogin.do" id="Form1" ">
<div>
</div>

<div class="login_wrap">
	<div class="login_header">
		<h1><a href=""><img src="<%=request.getContextPath() %>/images/logo.jpg" alt="淘书轩" title="淘书轩" /></a></h1>  
	</div>
	<div class="login_main" >	
		<div class="login_panel" style="background:url(images/bg1.jpg) repeat center 0;"s>
    	<!--登录框开始-->
			<div class="right_panel">
        <div class="login_frame_top"></div>
        <div class="login_frame_border">
          <div class="login_frame">
            <div class="login_title"><a href="<%=request.getContextPath() %>/customerRegister.jsp">立即注册</a><i>登录淘书轩</i>还不是淘书轩会员？</div>
            <div class="login_frist clearfix" id="user_div_name">
              <label>登录邮箱</label>
              <span class="login_input">
              <input name="customer.email" type="text" maxlength="40" id="txtUsername" tabindex="1" class="tip" errordata="0"  /></span><a href="" id="selectusertype" style="display:none" class="replacetype01">更换类型</a>
              <span class="hint" id="liDivErrorMessage" style="display:none">请输入邮箱地址</span>
              <span class="error" id="selecttype" style="display:none;"><b>请选择用户类型</b><input name="selusertype" type="radio" id="selusertypemail" value="" /><span class="error_name">昵称</span><input id="selusertypemobile" name="selusertype" type="radio" value="" /><span>手机号码</span></span>
            </div>


            <p class="clearfix" id="password_div">
              <label>密&nbsp;&nbsp;码</label>
              <span class="login_input"><input name="customer.pw" type="password" maxlength="20" id="txtPassword" tabindex="2" errordata="0" onfocus="this.className='focus';focus_pass()"  /></span>
            
              <span class="hint" id="login_password_error" style="display:none"></span>
            </p>

            
      
            <div class="login_btn" id="submit_signin_div"><input  id="login" type="submit" value="登 录" onmouseout="this.className=''" onmouseover="this.className='btn_login_hover'" tabindex="6" />            
               
            </div>
            <div class="co_login">
			
				
			</div>
          </div>
        </div>
        <div class="login_frame_bottom"></div>
      </div>
      <!--登录框结束-->
	  </div>
	</div>
</div>
</form>
</body>
</html>
