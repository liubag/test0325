<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>会员信息</title>
     <link href="<%=request.getContextPath() %>/admin/audience/css/update_audience_idcard.css" rel="stylesheet" type="text/css" />
     <script type="text/javascript" src="<%= request.getContextPath() %>/audience/js/jquery-1.6.4.min.js"></script>
     <script type="text/javascript" src="<%=request.getContextPath() %>/admin/audience/js/update_audience_idcard.js"></script>
  </head>
  	
  <body>
  	<form class="form1" method="post" action="/WangGe/updateAudienceIdcard.do">
  		<ul>
						<li id="nickname_field" class="field">
							<div class="input">
								<label for="nickname" >会员名：</label>
								<span class="field-span"><s:property value="audience.audience_nickname"/></span>
								<input type="hidden" name="audience.audience_nickname" value="<s:property value="audience.audience_nickname"/>"/>
							</div>
						</li>
                        
                        <li id="turename_field" class="field">
							<div class="input" >
								<label for="truename" >真实姓名：</label>
								<input id="truename" name="audience.audience_truename" class="field-text required" value="<s:property value="audience.audience_truename"/>"/>
							</div>
						</li>
						
                        <li id="idcard_field" class="field">
							<div class="input ">
								<label for="idcard" >身份证：</label>
                                <input id="idcard" class="field-text required" value="<s:property value="audience.audience_idcard"/>"/>
                                
							</div>
						</li>
                  
                        <li class="submit-field">
                        	<div class="input">
                            	<input type="submit" class="submit-btn" id="submit-btn" value="保存"/>
                            	<s:url id="url" action="showAllAudience">
						  			<s:param name="page"><s:property value="page"/></s:param>
							        
								</s:url>
								<s:a href="%{url}" >返回会员列表</s:a>
                            </div>
                        </li>
                   </ul>
                   <input type="hidden" id="audience_id" value="<s:property value="audience.id"/>"/>
                   <input type="hidden" id="page" value="<s:property value="page"/>"/>
  	</form>
  </body>
</html>
