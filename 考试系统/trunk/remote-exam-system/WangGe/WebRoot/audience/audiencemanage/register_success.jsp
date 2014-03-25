<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
    <meta http-equiv="refresh" content="3;url=/WangGe/audienceLogin.jsp">
    <title>操作成功</title>
	
	<script type="text/javascript" src="<%= request.getContextPath() %>/audience/js/jquery-1.6.4.min.js"></script>
	<script type="text/javascript">
		$(function(){
			var s_href="http://${header['host']}${pageContext.request.contextPath}/audience/audiencemanage/register_success.jsp";
			if(top.location.href!=s_href){
				top.location.href=s_href;
			}
			function animation(){
				$("#one").show(900,function(){
					$("#two").show(900,function(){
						$("#three").show(900,function(){
							$(".hide").hide();
						});
					});
				});
			}
			animation();
			setTimeout(animation, 3100);
		});
	</script>
	<style type="text/css">
		.parentInfo{
		 background: none repeat scroll 0 0 #F0F0F0;
			border:1px solid;
			margin: 0 auto;
    		width: 1024px;
    		padding:20px 0; 
		}
		.info{
			margin:0 0 0 400px;
		}
		.info div{
			float:left;
		}
		.info .dot{
			display:none;
		}
		.info .refresh{
			margin:0 0 0 115px;
		}
		
	</style>
  </head>
  
  <body>
  <div>
			<jsp:include page="/header_nav.jsp"></jsp:include>
		</div>
  <div class="parentInfo">
	  <div class="info" >
	  		<div >恭喜你注册成功！3秒后跳转到登录页面</div><div class="dot"  id="one">。</div><div class="dot hide"  id="two">。</div><div class="dot hide"  id="three">。</div>
	  		<br/><br/>
	  		<span class="refresh"><a href="/WangGe/audienceLogin.jsp">马上跳转</a></span>
	  </div>
  </div>
   <div>
			<jsp:include page="/footer.jsp"></jsp:include>
		</div>
  </body>
</html>
