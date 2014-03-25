<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<title>无标题文档</title>
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/customer/shoppingcart/css/shoppingcart.css" />
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/customer/shoppingcart/css/unite_header.css" />
</head>
	
<body>
	<div id="header_page">
           <jsp:include page="../../header.jsp" />
    </div>
	
    <div class="shoppingcart_wrapper">
    	<div class="shoppingcart_nav shoppingcart_nav3">
	        <h1>
	        	<a href="getBookFromCart.do">我的购物车</a>
	        </h1>
	    </div>
        <div class="success_frame money_notice_1">
            <p class="price">
           		订单号为：<s:property value="order.order_id"/>
           		<a target="_blank" href="<%=request.getContextPath() %>/customer/personalCenter/main.jsp?trigger=myOrder">查看订单状态&gt;&gt;</a>
            </p>
            <div class="information3">
                <p>
                    您需要在收货时向送货员支付
                    <span><s:property value="order.amount"/></span>
                </p>
            </div>
            <p class="success_footer">
                <span>
                	* 您可以在"
               	 	<a target="_blank" href="">我的订单</a>
                	"中查看或取消您的订单，由于系统需进行订单预处理，您可能不会立刻查询到刚提交的订单
                </span>
            </p>
        </div>
    </div>

     <div id="footer_page">
        	<jsp:include page="../../footer.jsp" />
    </div>
</body>
</html>
