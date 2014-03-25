<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>新用户注册-淘书轩</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/login2012.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/unite_header.css"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/js/register.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/Showcode.js"></script>
<script type="text/javascript"src="<%=request.getContextPath()%>/js/categorydata.js"></script>
</head>
<body onload="randomPic(120,25);">
<div id="header_page">
           <jsp:include page="header.jsp" />
    </div>
<div class="login_content">
	<div class="login_content_dash">
		<span class="login_content_dash"></span>
		<div class="login_content_border">
			<h2>
				<div class="reg_title">
				<img src="<%=request.getContextPath()%>/images/title_welcome.png"alt="注册淘书轩" width="192" height="54" class="img_welcome">				
				</div>
			</h2>
			<div id="email_reg_title_info"class="login_title">
				<p class="nonce">
					<span>1.填写注册信息</span>
				</p>
				<p>
					<span>2.邮箱激活</span>
				</p>
				<p>
					<span>3.注册成功</span>
				</p>
			</div>
			<form name="register_form"method="post"action="sendCodeToCustomer.do"id="register_form"class="login_form">
				<div>
					
				</div>
				<p id="input_email"class="wrong">
					<label>Email地址：</label>
					<span class="login_form_input">
					<input name="customer.email" type="text" maxlength="40" id="txtEmail" class="input_text" onfocus="check_email_focus()" onblur="txtEmail_check()"/>
					</span>	
					<span class="login_form_ok"id="email_ok"style="display:none;"></span>
					<span class="login_form_wrong"id="emailValidMsg"style="display:inline;">请填写您的Email</span>
				</p>
				<p id="input_password">	
					<label>登录密码：</label>
					<span class="login_form_input">
						<input name="customer.pw" type="password" maxlength="20" id="txtPassword" class="input_text" onfocus="check_password_focus();" onkeyup="txtPassword_strong_check()" onblur="txtPassword_check()" onpaste="return false"/>
					</span>
					<span class="login_form_ok"id="password_ok"style="display:none;"></span>
					<span class="login_form_hint"id="passwordValidMsg"style="display:none;"></span>
					<span class="intensity"id="span_intensity_check"style="display:none;">
						"强度：弱"
						<span class="strip_w">
							<span>
								<span></span>
							</span>
						</span>
						"强"
					</span>
				</p>
				<p id="input_repassword">	
					<label>确认密码：</label>
					<span class="login_form_input">
						<input name="txtRepeatPass" type="password" maxlength="20" id="txtRepeatPass" class="input_text" onfocus="check_repassword_focus();" onblur="txtRepeatPass_check()" onpaste="return false"/>
					</span>
					<span class="login_form_ok"id="repassword_ok"style="display:none;"></span>
					<span class="login_form_hint login_hint_rowl"id="repeatPassValidMsg"style="display:none;"></span>
				</p>
				<p id="input_vcode">
					<label>验证码：</label>
					<span class="login_form_input">	
						<input type="text"  maxlength="4" class="validate" id="randomNum" onfocus="if(this.value!=''){this.style.color='#000000';this.style.fontSize='15px';this.fontWeight='bold'}else{this.value='';this.style.color='#000000';this.style.fontSize='12px';this.style.fontWeight='normal'};check_VerifyCode_focus()" onblur="if(this.value==''){this.value='';this.style.color='#878787';this.style.fontSize='12px';this.style.fontWeight='normal'}else{this.style.color='#000000';this.style.fontSize='15px';this.style.fontWeight='bold'};randomNum_check()" onkeydown="this.style.color='#000000';this.style.fontSize='15px';this.style.fontWeight='bold';CheckdoSubmit(event)"/>                                 
						
					</span>
					<span class="login_form_ok"id="vcode_ok"style="display:none;"></span>
					<span class="login_form_hint"id="vcodeValidMsg"style="display:none;">验证码输入有误，请重新输入</span>
				</p>
				<p class="form_validate">	
					<label></label>
					<span class="login_form_validate">
						<a href="" name="change_code_img">
						<img title="点击更换密码" id="img1" width="220" height="50"src=""/>
						</a>
					</span>
					<span class="login_form_hint">
						"看不清？"
						<a href="" name="change_code_link" onclick="randomPic(100,20);">换张图</a>
					</span>		
				</p>				
				<p class="form_validate_btn">
				<button type="button" class="form_refer" onmouseover="this.className='form_refer_02'" onmouseout="this.className='form_refer'" name="btn_register" onclick="btnRegister_Click()"><img src="images/btn_login_refer1.gif" alt="" /> 提交注册</button>	
				</p>
				
				<input type="submit" name="btnRegister" id="btnRegister" style="display:none"/>
			</form>
		</div>
	</div>	
	<div class="login_content_dashb"></div>
</div>

<div id="footer_page">
        	<jsp:include page="footer.jsp" />
    </div>
</body>
</html>
