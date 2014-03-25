<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>会员信息</title>
     <link href="<%=request.getContextPath() %>/audience/css/audience_info.css" rel="stylesheet" type="text/css" />
     <script type="text/javascript" src="<%= request.getContextPath() %>/audience/js/jquery-1.6.4.min.js"></script>
     <script type="text/javascript" src="<%=request.getContextPath() %>/audience/js/audience_info.js"></script>
    
    <script type="text/javascript">
	   
	    $(function(){
	     var sex=$("#sexValue").val();
	    		if(sex=="男"){
	    			$("#sex_man").attr("checked","checked");
	    		}else if(sex=="女"){
	    			$("#sex_woman").attr("checked","checked");
	    		}
	    });
    </script>
    
    
  </head>
  	
  <body>
  	<form class="form1" method="post" action="/WangGe/update_exceptPw.do">
  		<ul>
						<li id="nickname_field" class="field">
							<div class="input">
								<label for="nickname" >会员名：</label>
								<span class="field-span"><s:property value="audience.audience_nickname"/></span>
								<input type="hidden" name="audience.audience_nickname" value="<s:property value="audience.audience_nickname"/>"/>
								<a href="/WangGe/audience/audiencemanage/updatePassword.jsp">修改登录密码</a>
							</div>
						</li>
                        
                        <li id="turename_field" class="field">
							<div class="input" >
								<label for="truename" >真实姓名：</label>
								<span class="field-span"><s:property value="audience.audience_truename"/></span>     
								<span class="info-span">请联系管理员修改真实姓名</span>                           
							</div>
						</li>
						 <li id="sex_field" class="field">
							<div class="input">
								<label for="sex" >性别：</label>
								<input id="sex_man" class="field-radio" type="radio" value="男" name="audience.sex"/><font>男</font>
                                <input id="sex_woman" class="field-radio" type="radio" value="女" name="audience.sex"/><font>女</font>
								<input type="hidden" id="sexValue" value='<s:property value="audience.sex"/>' />								
							</div>
						</li>
                        <li id="idcard_field" class="field">
							<div class="input ">
								<label for="idcard" >身份证：</label>
                                <span class="field-span"><s:property value="audience.audience_idcard"/></span>
                                <span class="info-span">请联系管理员修改身份证</span>  
							</div>
						</li>
                        <li id="phone_field" class="field">
							<div class="input ">
								<label for="phone" >联系电话：</label>
								<input id="phone" class="field-text required" type="text" tabindex="2" value="<s:property value="audience.phone"/>" name="audience.phone"/>
                                 
							</div>
						</li>
                        <li id="address_field" class="field">
							<div class="input ">
								<label for="address" >住址：</label>
								<input id="address" class="field-text" type="text" tabindex="2" value="<s:property value="audience.address"/>" name="audience.address"/>
							</div>
						</li>
						
                        <li class="submit-field">
                        	<div class="input">
                            	<input type="submit" class="submit-btn" id="submit-btn" value="保存"/>
                            </div>
                        </li>
                   </ul>
  	</form>
  </body>
</html>
