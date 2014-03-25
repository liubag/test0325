<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<title>无标题文档</title>
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/customer/shoppingcart/css/shoppingcart.css"/>
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/customer/shoppingcart/css/unite_header.css"/>
	<script type="text/javascript" src="<%=request.getContextPath()%>/customer/shoppingcart/js/jquery.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/customer/shoppingcart/js/shopping.js"></script>
	</head>
<body>
	<div id="header_page">
           <jsp:include page="../../header.jsp" />
    </div>
	<div id="shoppingcart" class="shoppingcart_wrapper">
        <div class="shoppingcart_nav">
             <h1>我的购物车</h1>
        </div>
        <ul id="ui_shoppingcart_title" class="shoppingcart_subject title_border_line">
                <li class="row1">商品名称</li>
                <li class="row2">当当价</li>
                <li class="row3"><span title="在当当价基础上再优惠">&nbsp;&nbsp;&nbsp;优惠&nbsp;&nbsp;&nbsp;</span></li>
                <li class="row4">数量</li>
                <li class="row5">操作</li>
        </ul>
    	<div id="collection_0" class="shoppingcart_general" name="promo_s" style="display: block;">
    	   <s:iterator value="bookItems">
                <ul name="product_s" id="" class="shoppingcart_list">
                <li class="row00">
                    <a title="" target="_blank" href="" name="productpic">
                    	<img class="cover" src="<%=request.getContextPath()%>/../BookImages/cover/<s:property value="book.book_image"/>"></img>
              		</a>
                </li>
             	
                <li class="row11">
                    <p><i></i>
                    <span class="name"><a title="" href="" target="_blank" name="product">
                    	<s:property value="book.name"/>
                    </a>
                    </span>
                    </p>
                </li>
                
                <li class="row22"><span><s:property value="book.price"/></span>&nbsp;&nbsp;</li>
                <li class="row33"><span><s:property value="book.discount"/></span></li>
                <li class="row44">
                	<input class="number" type="text" onkeypress=" " onblur="" value="<s:property value="amount"/>" name="<s:property value="book.book_id"/>" />
                    <a class="add" title="数量加一"  href="#">+</a>
                    <a class="cut" title="数量减一"  href="#">-</a>
                </li>
                <li class="row55">
                    <a  class="collect" title="此商品将移至我的收藏并从购物车中删除" href="" name="<s:property value="book.book_id"/>">移入收藏</a>
                    <a  name="<s:property value="book.book_id"/>" href="" class="cut_from_cart">删除</a>
                </li>
                </ul>
              
                </s:iterator>
                <div class="clear"></div>
         </div>
       
          <s:if test="hasBookItem == true">
	          <div id="div_total" class="shoppingcart_total" style="display: block;">
		                <p class="price">商品金额总计(含运费)：
		                    <span>￥</span>
		                    <span id="total_account">${total_account}</span>
		                </p>
		                <p id="balance">
		                    <a title="结算" class="clearing" href="<%=request.getContextPath()%>/customer/shoppingcart/checkout.jsp" id="checkout_btn" name="checkout"></a>
		                    <a class="goon" name="goon" target="_blank" href="<%=request.getContextPath()%>/index.jsp">继续购物</a>
		                </p>
		        </div>
         </s:if><s:else>
         	
	         <div  class="shoppingcart_general" id="div_no_choice">
	                <div class="shoppingcart_general_none">您还没有挑选商品，
	                    <a href="<%=request.getContextPath()%>/index.jsp" name="gotoold" target="_self" id="no_product">去主页看看&gt;&gt;</a>
	                </div>
	                <div class="shoppingcart_total shoppingcart_total2"></div>
	         </div>
        </s:else>
       
      
        <div name="favoritezone" id="divCustWishList" class="shoppingcart_favorites">
					<h2>
						<a id="pucker_up_wish" href="" title="up" name="turnoff" class="up">折叠</a>
						<span>收藏的商品
							<span id="wishlogin" class="login" style="display: none;">
								-请<a href="#" id="wishlogin_0">登录</a>后查看
							</span>
						</span>
					</h2>
			<s:action name=""> </s:action>
			<div id="div_CustWishList">
				<div class="objhide" name="favoritezone" id="ul_CustWishList" style="display: block;">
                	<ul style="display:none"><li class="shoppingcart_favorites_none">您的收藏夹中暂无商品</li></ul>
                    <ul>
                    	<li class="row1"><a name="product_wish" href="#" target="_blank" title="#">乔布斯传</a></li>
                        <li class="row2">206</li>
                        <li class="row3">￥<span>20.60</span></li>
                        <li class="row4">&nbsp; </li>
                        <li class="row5">
                        	<a name="" id="1" class="put_into_cart" href="">放入购物车</a>
                        	
                        	<a name="delete_wish" id="wishremove_22731771" onclick="" href="">删除</a>
                        </li>
                    </ul>
                </div>
			</div>
		</div> 
        <br />
        <div class="shoppingcart_footer_experience">对新版购物车满意吗？留下您的意见和建议，
             <a href="javascript:openWin('cart_advice.aspx?ref=shopping-0-H','feedback',550,550)" 
                	name="feedback" id="cart_advice">帮我们改进购物车&gt;&gt;</a>
        </div>  
    </div> 
 
   <div id="footer_page">
        	<jsp:include page="../../footer.jsp" />
    </div>
    <s:debug></s:debug>
</body>
</html>
