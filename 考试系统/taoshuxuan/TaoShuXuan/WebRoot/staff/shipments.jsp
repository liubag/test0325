<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>无标题文档</title>
<sx:head extraLocales="en-us,nl-nl,de-de"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/staff/css/main.css" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/staff/js/jquery-1.5.2.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/staff/js/jquery.confirm-1.3.js" charset="utf-8"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/staff/js/setPage.js" ></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/staff/js/shipments.js" ></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/staff/js/search.js" ></script>
<style type="text/css">
<!--
.STYLE1 {font-size: 12px}
.STYLE3 {color: #707070; font-size: 12px; }
.STYLE5 {color: #0a6e0c; font-size: 12px; }
body {
	margin-top: 0px;
	margin-bottom: 0px;
}
.STYLE7 {font-size: 12}
-->
</style>
</head>

<body>

<input id="url" value="show_order.do?status=1" type="hidden"/>
<div id="breadNav">
	<jsp:include page="breadcrumbNavigation.jsp" />
</div>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td>&nbsp;</td>
        <td style="padding-right:10px;float:left"><div align="left" >
          <table border="0" align="right" cellpadding="0" cellspacing="0">
            <tr>
            	<td class="time" style="display:none;">
												日期：<sx:datetimepicker name="beginTime"  cssClass="beginTime" toggleType="wipe" toggleDuration="400" displayFormat="yyyy-MM-dd" />至
												<sx:datetimepicker name="endTime" cssClass="endTime" toggleType="wipe" toggleDuration="400" displayFormat="yyyy-MM-dd" />		
											</td>
											<td>
												<label class="search">检索内容: <input class="search" type="text" /></label>
												<select name="m" class="search" id="se">
													<option value="customer.email">
														根据会员账号搜索
													</option>
													<option value="order_id">
														根据订单编号搜索
													</option>
													<option value="order_date" id="time">
														根据时间段
													</option>
												</select>
												<a href="" id="search">搜索</a>
											</td>
            </tr>
          </table>
        </div></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#c9c9c9">
      <tr>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">订单编号</span></strong></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">下单会员</span></strong></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">下单时间</span></strong></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">订单总金额</span></strong></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">支付方式</span></strong></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">收货地址</span></strong></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">已发货</span></strong></div></td>
      </tr>
      <s:iterator value="Record_l" >
      <tr>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3"><a href="showBookInOrder.do?order.order_id=<s:property value="order_id"/>"><s:property value="order_id"/></a></span></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3"><s:property value="customer.email"/></span></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3"><s:property value="order_date"/></span></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3"><s:property value="amount"/></span></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3"><s:property value="paymentMethod.name"/></span></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3"><s:property value="shippingAddress.shipping_province"/></span></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center" class="STYLE5"><a href="#" class="shipments" name="${order_id}">发货</a></div></td>
      </tr>
      </s:iterator>
  	
    </table></td>
  </tr>
  <tr>
    <td height="35"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="25%" height="29" nowrap="nowrap"><table width="342" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="44%" class="STYLE1">当前页：${page}/${hasPages}页 每页 
             <input id="perFolioAmount" type="text" class="STYLE1" style="height:14px; width:25px;" value="${perFolioAmount}" size="5" /></td>
            <td width="14%" class="STYLE1"><a id="setPerFolioAmount"><img src="<%=request.getContextPath()%>/staff/images/sz.gif" width="43" height="20" onclick="changePerFolioAmount(${perFolioAmount})"/></a> </td>
            <td width="42%" class="STYLE1"><span class="STYLE7">数据总量 ${hasRecord} </span></td>
          </tr>
        </table></td>
        <td width="75%" valign="top" class="STYLE1"><div align="right">
            <table width="352" height="20" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td width="62" height="22" valign="middle"><div align="right"><a id="pageFirst"><img src="<%=request.getContextPath()%>/staff/images/page_first_1.gif" width="48" height="20" onclick="return pageFirst(${page})"/></a></div></td>
                <td width="50" height="22" valign="middle"><div align="right"><a id="pageBack"><img  src="<%=request.getContextPath()%>/staff/images/page_back_1.gif" width="55" height="20" onclick="return pageBackTo(${page})"/></a></div></td>
                <td width="54" height="22" valign="middle"><div align="right"><a id="pageNext"><img  src="<%=request.getContextPath()%>/staff/images/page_next.gif" width="58" height="20" onclick="return pageNextTo(${page},${hasPages})"/></a></div></td>
                <td width="49" height="22" valign="middle"><div align="right"><a id="pageLast"><img src="<%=request.getContextPath()%>/staff/images/page_last.gif" width="52" height="20" onclick="return pageLast(${page},${hasPages})"/></a></div></td>
                <td width="59" height="22" valign="middle"><div align="right">转到第</div></td>
                <td width="25" height="22" valign="middle"><span class="STYLE7">
                 <s:select list="page_l" name="page"  onchange="pageTo(this)"></s:select>
                </span></td>
                <td width="23" height="22" valign="middle">页</td>
                <td width="30" height="22" valign="middle"><img src="<%=request.getContextPath()%>/staff/images/go.gif" width="26" height="20" /></td>
              </tr>
            </table>
        </div></td>
      </tr>
    </table></td>
  </tr>
</table>



<s:debug></s:debug>
</body>
</html>
