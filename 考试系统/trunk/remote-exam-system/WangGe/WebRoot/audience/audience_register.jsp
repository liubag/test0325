<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <title>网格用户注册</title>
    <link href="<%=request.getContextPath() %>/audience/css/register.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<%= request.getContextPath() %>/audience/js/jquery-1.6.4.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/audience/js/register.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/audience/js/random2.js"></script>
    </head>
    <body onload="randomPic(120,25);">
		<div>
			<jsp:include page="/header_nav.jsp"></jsp:include>
		</div>
        <div class="reg-form">
        <span class="reg-header">注册新会员</span>
    	<form id="audience_form" method="post" action="/WangGe/addAudience.do">
					<ul>
						<li id="nickname_field" class="field">
							<div class="input">
								<label for="nickname" >会员名：</label>
								<input id="nickname" class="field-text required" type="text" tabindex="2" value="" name="audience.audience_nickname"/>
                                
							</div>
						</li>
                        <li id="password_field" class="field">
							<div class="input ">
								<label for="pw" >登录密码：</label>
								<input id="pw" class="field-text required" type="password" maxlength="13" tabindex="2" value="" name="audience.audience_pw"/>
							</div>
						</li>
                          <li id="rePassword_field" class="field">
							<div class="input ">
								<label for="rePw" >确认密码：</label>
								<input id="rePw" class="field-text required" type="password" maxlength="13" tabindex="2" value="" name="audience_rePw"/>
                               
							</div>
						</li>
                        <li id="turename_field" class="field">
							<div class="input" >
								<label for="truename" >真实姓名：</label>
								<input id="truename" class="field-text required" type="text" tabindex="2" value="" name="audience.audience_truename"/>
                                
							</div>
						</li>
						 <li id="sex_field" class="field">
							<div class="input">
								<label for="sex" >性别：</label>
								<input id="sex_man" class="field-radio" type="radio" value="男" checked name="audience.sex"/><font>男</font>
                                <input id="sex_woman" class="field-radio" type="radio" value="女" name="audience.sex"/><font>女</font>
							</div>
						</li>
                        <li id="idcard_field" class="field">
							<div class="input ">
								<label for="idcard" >身份证：</label>
								<input id="idcard" class="field-text required" type="text" tabindex="2" value="" name="audience.audience_idcard"/>
                                
							</div>
						</li>
                        <li id="phone_field" class="field">
							<div class="input ">
								<label for="phone" >联系电话：</label>
								<input id="phone" class="field-text required" type="text" tabindex="2" value="" name="audience.phone"/>
                                 
							</div>
						</li>
                        <li id="address_field" class="field">
							<div class="input ">
								<label for="address" >住址：</label>
								<input id="address" class="field-text" type="text" tabindex="2" value="" name="audience.address"/>
                                 
							</div>
						</li>
						 <li id="audience_field" class="field">
							<div class="input ">
								<label for="randomNum" >验证码：</label>
								<input type="text" class="field-text" id="randomNum"/><img id="img1"/><a href="#" onclick="randomPic(100,20);">看不清</a>                                 
							</div>
						</li>
                        <li class="submit-field">
                        	<div class="input">
                            	<input type="submit" class="submit-btn" id="submit-btn" value="注册"/>
                            	<input type="reset" class="reset-btn" id="reset-btn" value="重置"/>
                            </div>
                        </li>
                        </ul>
		</form>
        
          </div>
         <div>
			<jsp:include page="/footer.jsp"></jsp:include>
		</div>
          
    </body>
</html>