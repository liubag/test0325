<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="<%=request.getContextPath()%>/customer/personalCenter/css/taoshuxuan.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/customer/personalCenter/css/myOrder2.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/customer/personalCenter/js/jquery-1.5.2.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/customer/personalCenter/js/myOrder.js" charset="utf-8"></script>
<%
	Integer page01 = (Integer) request.getAttribute("page");
	Integer hasPages = (Integer) request.getAttribute("hasPages");
	Long hasRecord = (Long) request.getAttribute("hasRecord");
	Integer perFolioAmount = (Integer) request.getAttribute("perFolioAmount");
%>
<script language="javascript">
		var page = <%=page01%>;
		var hasPages = <%=hasPages%>;
		function justUpPage(){
			if(page == hasPages){
				 alert("已经是最后一页了！");
				 return false;
			}	 
		}
		
		function justNextPage(){
			if(page == 0 || page == 1){
				 alert("已经是第一页了！");
				 return false;
			}	 
		}
		function test(select){
	  		location.href = "show_order_by_customer.do?page="+select.value ;
	  	}
	  	
</script>
</head>

<body>

<div class="content">
<div id="breadNav">
	<jsp:include page="breadcrumbNavigation.jsp" />
</div>
<div class="mylisttop">
	<div class="orders-inquires">
   		<input type="text" maxlength="50" name="SearchInfo" id="SearchInfo" class="orders-text"/>
    	<input type="button"  value="查询" name="my_Index_id_btnSearchOrder" class="track"/>
	</div>
 	<div id="dvOrders" class="TabContent">
        <table  cellspacing="0" cellpadding="0" border="0" id="myTab1_Content0" class="invite-table3">
        	<tbody>
            	<tr id="headTr">
                  <th> 订单号 </th>
                  <th> 商品 </th>
                  <th> 收货人 </th>
                  <th> 金额 </th>
                  <th> 支付方式 </th>
                  <th> 下单时间 </th>
                  <th> 状态 </th>
                  <th > 操作 </th>
                </tr>
                <s:iterator value="Record_l" status="st">
                	<tr>
                  		<td><div align="center"><span class="STYLE3"><a href="#"><s:property value="order_id"/></a></span></div></td>
                  		<td>
                     	                   
                     	 <s:iterator value="book_l_l.get(#st.index)" status="st1" id="inner">
                     	 	<span class="STYLE3"><a target="_blank" href="showbook.do?book.book_id=<s:property value="#inner.book_id"/>"  class="track"> <img  src="<%=path %>/../BookImages/cover/<s:property value="#inner.book_image"/>"/></a></span>
                     	 </s:iterator>                                     
                      
                   		</td>
                  <td><div align="center"><span class="STYLE3"><s:property value="customer.name"/></span></div></td>
                  <td> <s:property value="amount"/></td>
                  <td>
                      <div align="center"><span class="STYLE3"><s:property value="paymentMethod.name"/></span></div>
                  </td>
                  <td >
                      <div align="center"><span class="STYLE3"><s:property value="order_date.toLocaleString()"/></span></div>
                  </td>
                  <td>
                  	 <c:set var="status" scope="request" ><s:property value="status"/></c:set>
                  	 <c:choose>								
						<c:when test="${status == '0'}"><div align="center"><span class="STYLE3">等待审核</span></div></c:when>
						<c:when test="${status == '1'}"><div align="center"><span class="STYLE3">审核成功</span></div></c:when>	
						<c:when test="${status == '2'}"><div align="center"><span class="STYLE3">审核失败</span></div></c:when>
						<c:when test="${status == '3'}"><div align="center"><span class="STYLE3">已发货</span></div></c:when>
						<c:when test="${status == '4'}"><div align="center"><span class="STYLE3">交易成功</span></div></c:when>
						<c:when test="${status == '5'}"><div align="center"><span class="STYLE3">已取消</span></div></c:when>			
					</c:choose>                   
                    </td>
                  <td>
                  	
                  	<c:choose>	
                  		<c:when test="${status == '0'}"><div align="center" class="STYLE5"><a href="#" class="delete" id="<s:property value="order_id"/>" name="<s:property value="status"/>">取消订单</a></c:when>
                  		<c:when test="${status == '4'}"><br/><div align="center" class="STYLE5"><a href="#" class="comment" id="<s:property value="order_id"/>" name="<s:property value="status"/>">写评论</a></div></c:when>                 		
                  		<c:otherwise>---</c:otherwise>
                  	</c:choose> 
                  </td>
                </tr>
                </s:iterator>              
          		<tr class="pageTr">
 		   			<td class="STYLE1">当前页：<%=page01%>/<%=hasPages%>页 </td>
            		<td class="STYLE1"><span class="STYLE7">数据总量 <%=hasRecord%> </span></td>
            		<td width="62" height="22" valign="middle"><div align="right"><a href="show_order_by_customer.do?page=1" onclick="return justNextPage();"><img src="images/page_first_1.gif" class="pageImage"/></a></div></td>
                	<td width="50" height="22" valign="middle"><div align="right"><a href="show_order_by_customer.do?page=<%=page01 - 1%>" onclick="return justNextPage();"><img src="images/page_back_1.gif" class="pageImage" /></a></div></td>
                	<td width="54" height="22" valign="middle"><div align="right"><a href="show_order_by_customer.do?page=<%=page01 + 1%>" onclick="return justUpPage()"><img src="images/page_next.gif" class="pageImage" /></a></div></td>
               	 	<td width="49" height="22" valign="middle"><div align="right"><a href="show_order_by_customer.do?page=<%=hasPages%>" onclick="return justUpPage()"><img src="images/page_last.gif" class="pageImage"/></a></div></td>
                	<td  height="22" valign="middle"><div align="right">转到第</div></td>
                	<td height="22" valign="middle"><span class="STYLE7">
                  		<s:select list="page_l" name="page" cssClass="STYLE1" onchange="test(this);"/>页
                		</span>
                	</td>                 
 				 </tr>     
                
 </tbody>
 </table>
 </div></div></div>
</body>
</html>
