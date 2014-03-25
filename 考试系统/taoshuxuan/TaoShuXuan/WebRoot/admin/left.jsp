<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">  

<html>
<head>
<title>无标题文档</title>
<script src="<%=request.getContextPath()%>/admin/js/jquery-1.5.2.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/admin/js/prototype.lite.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/admin/js/moo.fx.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/admin/js/moo.fx.pack.js" type="text/javascript"></script>

<script src="<%=request.getContextPath()%>/admin/js/left.js" type="text/javascript"></script>

<link href="<%=request.getContextPath()%>/admin/css/left.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="left">
		       <div id="left_menu"></div>
			   <div id="left_tree">
					   <!--   <li class="tree_li"><span class="list_img"><img src="images/list_img.gif" /></span>用户属性 <span class="list_img"><img src="images/list_img.gif" /></span>修改密码</li>
					   -->
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#EEF2FB" id="tab">
  <tr>
    <td width="182" height="auto" valign="top">
    <div id="container">
      <h1 class="type"><a href="javascript:void(0)">员工管理</a></h1>
      <div class="content">
        <ul class="MM">
          <li><a href="addStaff.jsp" target="main">新增员工</a></li>
          <li><a href="showStaff_by_page.do" target="main">员工信息管理</a></li>
          <li><a href="showStaffHandleRecord_by_page.do?handle_type=1&type=0" target="main">员工订单处理记录</a></li>
          <li><a href="showStaffHandleRecord_by_page.do?handle_type=2&type=0" target="main">员工退货申请处理记录</a></li>
        </ul>
      </div>
       <h1 class="type"><a href="javascript:void(0)">会员管理</a></h1>
      <div class="content">
       
        <ul class="MM">
          <li><a href="showCustomer_by_page.do?status=1" target="main">会员信息管理</a></li>
          <li><a href="showCustomer_by_page.do?status=2&type=1" target="main">会员购书记录查看</a></li>
          <li><a href="showCustomer_by_page.do?status=3&type=1" target="main">会员评论信息管理</a></li>
         
        </ul>
      </div>
      <h1 class="type"><a href="javascript:void(0)">图书管理管理</a></h1>
      <div class="content">
        <ul class="MM">
          <li><a href="addBook.jsp" target="main">新增图书</a></li>
          <li><a href="addCatagory.jsp" target="main">新增图书分类</a></li>
		  <li><a href="showCatagory_by_page.do" target="main">图书分类信息管理</a></li>
          <li><a href="showBook_by_page.do" target="main">图书信息管理</a></li>
        </ul>
      </div>
      <h1 class="type"><a href="javascript:void(0)">支付方式管理</a></h1>
      <div class="content">
        <ul class="MM">
          <li><a href="addPaymentMethod.jsp" target="main">新增支付方式</a></li>
		  <li><a href="showPaymentMethod_by_page.do" target="main">支付方式管理</a></li>
        </ul>
      </div>
       <h1 class="type"><a href="javascript:void(0)">优惠活动管理</a></h1>
      <div class="content">
        <ul class="MM">
		  <li><a href="addPromotion.jsp" target="main">新增优惠信息</a></li>
          <li><a href="showPromotion_by_page.do?status=0" target="main">到期的优惠信息</a></li>
          <li><a href="showPromotion_by_page.do?status=1" target="main">未到期的优惠信息</a></li>
        </ul>
      </div>
      <h1 class="type"><a href="javascript:void(0)">图书销售情况</a></h1>
      <div class="content">
        <ul class="MM">
		  <li><a href="" target="main">销售数量</a></li>
          <li><a href="" target="main">销售金额</a></li>
        </ul>
      </div>
      <h1 class="type"><a href="javascript:void(0)">网站首页广告管理</a></h1>
      <div class="content">
       <ul class="MM">
		  <li><a href="" target="main">网站首页广告管理</a></li>
        </ul>
      </div>
      <h1 class="type"><a href="javascript:void(0)">系统关键字管理</a></h1>
      <div class="content">
        <ul class="MM">
		 <li><a href="" target="main">系统关键字管理</a></li>
        </ul>
      </div>
      
      <h1 class="type"><a href="javascript:void(0)">修改登录密码</a></h1>
      <div class="content">
        <ul class="MM">
		  <li><a href="changePassword.jsp" target="main">修改登录密码</a></li>
        </ul>
      </div>
    </div>
       <script type="text/javascript">
		var contents = document.getElementsByClassName('content');
		var toggles = document.getElementsByClassName('type');
	
		var myAccordion = new fx.Accordion(
			toggles, contents, {opacity: true, duration: 400}
		);
		myAccordion.showThisHideOpen(contents[0]);
	</script>
        </td>
  </tr>
</table>


</div>
</div>
</body>
</html>
