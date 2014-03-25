<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">  

<html>
<head>
<title>无标题文档</title>
<script src="<%=request.getContextPath()%>/staff/js/jquery-1.5.2.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/staff/js/prototype.lite.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/staff/js/moo.fx.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/staff/js/moo.fx.pack.js" type="text/javascript"></script>

<script src="<%=request.getContextPath()%>/staff/js/left.js" type="text/javascript"></script>

<link href="<%=request.getContextPath()%>/staff/css/left.css" rel="stylesheet" type="text/css" />
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
       <h1 class="type"><a href="javascript:void(0)">处理用户订单</a></h1>
      <div class="content">
        <ul class="MM">
          <li><a href="show_order.do?status=0 &clear=true" target="main">审核订单</a></li>
          <li><a href="show_order.do?status=1 &clear=true" target="main">发货</a></li>
          <li><a href="show_order.do?status=2 &clear=true" target="main">查看审核失败订单</a></li>
          <li><a href="show_order.do?status=3 &clear=true" target="main">查看已发货订单</a></li>
          <li><a href="show_order.do?status=4 &clear=true" target="main">查看交易完成订单</a></li>
        </ul>
      </div>
      <h1 class="type"><a href="javascript:void(0)">处理用户退货请求</a></h1>
      <div class="content">
        <ul class="MM">
		  <li><a href="show_rejectedApply.do?status=0 &clear=true" target="main">审核退货申请</a></li>
          <li><a href="show_rejectedApply.do?status=1 &clear=true" target="main">确认收货完成交易</a></li>
       	  <li><a href="show_rejectedApply.do?status=2 &clear=true" target="main">查看不批准的退货申请</a></li>
       	  <li><a href="show_rejectedApply.do?status=3 &clear=true" target="main">查看已完成退货申请</a></li>
        </ul>
      </div>
      <h1 class="type"><a href="javascript:void(0)">查看员工处理记录</a></h1>
      <div class="content">
        <ul class="MM">
          <li><a href="showStaffHandleRecord_by_id.do" target="main">查看员工处理记录</a></li>
        </ul>
      </div>
      <h1 class="type"><a href="javascript:void(0)">个人信息管理</a></h1>
      <div class="content">
        <ul class="MM">
          <li><a href="getStaffPersonalInfo.do?staff.staff_id=<s:property value="#session.staff_id"/>" target="main">个人信息管理</a></li>
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
