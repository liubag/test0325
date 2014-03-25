<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>顶部快速导航条</title>
<link href="<%=request.getContextPath() %>/css/css.css" type="text/css" rel="stylesheet"/>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/header_nav.js"></script>
</head>

<body >
<%
	String account = (String) session.getAttribute("customer_email");
 %>
<div id=page>
	<div class="chl-poster simple" id=header_nav>
		<div id=site-nav>
			<p class="log-info">
			  <%
			  	if(account!=null){
			   %>
			   hi，
			   <a href="#"><%=account %></a>
			   <a href="customerLogout.do">安全退出</a>
			   <%
			   		}else{
			    %>
				亲，欢迎光临淘书轩！请
				<a href="<%=request.getContextPath() %>/customerLogin.jsp">登录</a>
				<a href="<%=request.getContextPath() %>/customerRegister.jsp">免费注册</a>
			    <%
			    	}
			     %>
			 </p>  
			<UL class=quick-menu>
			  <LI class=home><A href="<%=request.getContextPath() %>/index.jsp">淘书轩首页</A> </LI>
			  <LI><A target="_blank" href="<%=request.getContextPath() %>/customer/personalCenter/main.jsp?trigger=myOrder">我的订单</A></LI>

			  <LI class="mytaobao menu-item">
				  <div class=menu>
					  <A target="_blank" class=menu-hd href="<%=request.getContextPath() %>/customer/personalCenter/main.jsp?trigger=myOrder" target=_top rel=nofollow>个人中心<B></B></A> 
					  <div class=menu-bd>
						  <div class=menu-bd-panel>
							  <div>
								  <p align="center"><A href="<%=request.getContextPath() %>/customer/personalCenter/main.jsp?trigger=myOrder" rel=nofollow>我的订单</A></p>
								  <p align="center"><A href="<%=request.getContextPath() %>/customer/personalCenter/main.jsp?trigger=myGoods" rel=nofollow>我的商品</A></p> 
								  <p align="center"><A href="<%=request.getContextPath() %>/customer/personalCenter/main.jsp?trigger=myCollection" rel=nofollow>我的收藏</A></p>
								  <p align="center"><A href="<%=request.getContextPath() %>/customer/personalCenter/main.jsp?trigger=myComment" rel=nofollow>我的评论</A></p>
							  </div>
						  </div>
						  <S class=r></S><S class=rt></S><S class=lt></S><S class=b></S><S class="b b2"></S><S class=rb></S><S class=lb></S>
					  </div>
				  </div>
			  </LI>
			  <LI class=cart><A href="getBookFromCart.do" rel=nofollow><S></S>购物车 </A></LI>
			  <LI class=favorite><A  href="<%=request.getContextPath() %>/customer/personalCenter/main.jsp?trigger=myCollection" rel=nofollow>收藏夹</A></LI>
			 
			  <LI class="services menu-item last">
				  <div class=menu>
					  <A class=menu-hd href="#" target=_top>网站导航<B></B></A> 
					  <div class=menu-bd style="WIDTH: 210px; HEIGHT: 262px; _width: 202px">
						  <div class=menu-bd-panel>
							  <DL>
								<DT><A href="#">购物</A>
								<DD>
										<A href="#">商城</A> 
										<A href="#">电器城</A> 
										<A href="#">嗨淘</A>
										<A href="#">全球购</A>
										<A href="#">跳蚤街</A> 
										<A href="#">礼物</A>
										<A href="#">促销</A>
										<A href="#">机票</A>
										<A href="#">彩票</A>
										<A href="#">创意</A> 
								</DD>
							</DL>
							  <DL>
								<DT><A href="#">门户</A> 
								<DD><A href="#">服饰</A> <A href="#">女人</A> <A href="#">美容</A> <A href="#">居家</A> <A href="#">男人</A> <A href="#">数码</A> <A href="#">亲子</A> <A href="#">时尚</A> <A href="#">试用</A> <A href="#">心得</A> <A href="#">帮派</A> <A href="#">画报</A> <A href="#">淘女郎</A> <A href="#">社区</A> <A href="#">宝贝传奇</A>
								</DD>
							</DL>
							  <DL>
								<DT><A href="#">淘江湖</A> &nbsp;<A href="#">手机淘宝</A> </DT></DL>
							  <DL>
								<DT><A href="#">帮助中心</A> 
								<DD><A href="#">交易安全</A> <A href="#">维权中心</A> </DD></DL>
							  <DL class=last>
								<DD><STRONG style="FONT-WEIGHT: bold"><A href="#">更多内容</A></STRONG></DD>
							  </DL>
						  </div>
						  <S class=r></S><S class=rt></S><S class=lt></S><S class=b style="WIDTH: 169px"></S><S class="b b2" style="WIDTH: 169px"></S><S class=rb></S><S class=lb></S>
					  </div>
				  </div>
			  </LI>
		    </UL>
		</div>
	</div>
</div>
<SCRIPT type=text/javascript>
	TB.Header.init();
</SCRIPT>
</body>
</html>