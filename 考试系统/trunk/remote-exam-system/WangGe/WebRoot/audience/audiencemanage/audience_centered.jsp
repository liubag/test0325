<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>个人中心</title>
    
    <script src="${pageContext.request.contextPath}/audience/js/jquery-1.6.4.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/audience/js/lanmu.js" type="text/javascript"></script>
 
 <link href="${pageContext.request.contextPath}/audience/css/audienceCentered-css.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/audience/css/audienceCentered-div.css" rel="stylesheet" type="text/css" />

	<script type="text/javascript">
		$(function(){
		$("dt a").click(function(){
			$("#iframe").attr("src",$(this).attr("href"));
			return false;
		});
			var trigger =$("#trigger").val();
			if(trigger=="myAttention"){
				$("#myAttentionHref").trigger("click");
			}
		});
	</script>
  </head>
  
  <body>
    	<div id="zhuti">
	<div id="zuoshang1"></div>
	<div id="zhong1"></div>
	<div id="youshang1"></div>
	<div id="zhong2"></div>
	<div id="zhong"><div id="daohang"><div id="daohang1"></div>
	                                  <div id="daohang2">
	                                  <dl class="submenu">
		                                  <dt>
		                                  		<s:url id="url" action="showAudienceInfo">
												</s:url>
												<s:a href="%{url}" target="iframe" cssClass="childmenu">个人信息</s:a>
		                                  </dt>
	                                  </dl>
	                                   <dl class="submenu">
	                                  <dt><a id="myAttentionHref" href="myAttention.do?type=0" target="iframe" class="childmenu">我的关注</a></dt>
	                                  </dl>
	                                    <dl class="submenu">
	                                  <dt><a href="<%=request.getContextPath() %>/audience/audiencemanage/updatePassword.jsp" target="iframe" class="childmenu">修改登录密码</a></dt>
	                                  </dl>
                                      </div>
									  <div id="daohang3"></div>
	                </div>
					<div id="weizhi" class="ziti3">当前位置</div>
					<div id="right"><div id="xuxian1"></div>
					                <div id="xuxian2"></div>
									<div id="xuxian3"></div>
                                    <div id="content"><iframe id="iframe" name="iframe" frameborder="0"></iframe></div>
                                    <div id="xuxian4"></div>
                                    <div id="xuxian5"></div>
                                    <div id="xuxian6"></div>
					</div>
	</div>
	<div id="zhong3"></div>
	<div id="zuoxia1"></div>
	<div id="zhong4"></div>
	<div id="youxia1"></div>
	</div>  
	<input type="hidden" id="trigger" value='<%=request.getParameter("trigger") %>'/>
  </body>
</html>
