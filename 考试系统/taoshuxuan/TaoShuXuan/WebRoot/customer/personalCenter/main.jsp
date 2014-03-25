<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="css/left.css" rel="stylesheet" type="text/css" />
<link href="css/taoshuxuan.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/customer/personalCenter/css/personalBasic.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/customer/personalCenter/js/jquery-1.5.2.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/customer/personalCenter/js/main.js" charset="utf-8"></script>
<%
	String account = (String) session.getAttribute("customer_email");
 %>
</head>

<body>
<div id="header_page">
           <jsp:include page="../../header.jsp" />
        </div>
<div class="wrapper"> 
  <!--账户左栏-->
  <div class="mydnew_sidel">
  		<div id="navigation">
        	<div id="sidebar">
            	
              	<div id="sidebar3">
					<img src="../../images/sidebar9.png" alt="导航"/>
					<ul>
						<li><a target="iframe" class="mySidebar" id="myOrderHref" href="show_order_by_customer.do?customerEmai=<%=account %>" >我的订单</a></li>  
						<li><a target="iframe" class="mySidebar" id="myGoodsHref" href="boughtGoods.jsp" name="boughtcommodity" class="">已购商品</a></li>
     					<li><a target="iframe" class="mySidebar" id="myCollectionHref" href="show_collection_by_page.do?customerEmai=<%=account %>" >我的收藏</a></li>
     					<li><a target="iframe" class="mySidebar" id="myCommentHref" href="myComment.jsp" name="myComment" >我的评论</a></li>
     					<li><a target="iframe" class="mySidebar" id="myInfoHref" href="personalInfor.jsp" name="mycoupons" >个人信息管理</a></li>
     					<li><a target="iframe" class="mySidebar" id="myPwHref" href="changePassword.jsp" name="points_index_list" >修改登录密码</a></li>
      					<li><a target="iframe" class="mySidebar" id="myAddressHref" href="addressManagement.jsp" name="myaddress" >收货地址管理</a></li>   					
					</ul>					
				</div>             
                <div id="sidebar5"><img src="../../images/sidebar5.jpg" alt="导航"/></div>
                <div id="sidebar6"><img src="../../images/sidebar6.jpg" alt="导航"/></div>
                <div id="sidebar7"><img src="../../images/sidebar7.jpg" alt="导航"/></div>
                <div id="sidebar8"><img src="../../images/sidebar8.jpg" alt="导航"/></div>
            </div> 
        </div> 
  	</div>
  	<div class="right"><iframe id="iframe" name="iframe" frameborder="0"></iframe></div>
 	 <div id="footer_page">
      	<jsp:include page="../../footer.jsp" />
  	</div>
  </div>
  <input type="hidden" id="trigger" value='<%=request.getParameter("trigger") %>'/>
</body>
</html>
