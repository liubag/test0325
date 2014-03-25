<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>无标题文档</title>
<link href="css/taoshuxuan.css" rel="stylesheet" type="text/css" />
<link href="css/myFavorites.css" rel="stylesheet" type="text/css" />
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
	  		location.href = "show_collection_by_page.do?page="+select.value ;
	  	}
	  	
</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/customer/personalCenter/js/jquery-1.5.2.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/customer/personalCenter/js/myCollection.js" charset="utf-8"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/addBookToCart.js" charset="utf-8"></script>
</head>

<body>
<div  class="main_right">
<div id="breadNav">
	<jsp:include page="breadcrumbNavigation.jsp" />
</div>
<div  class="temp_navi">
  <div class="temp_navi_title"><b>我的收藏</b><span>(共有<b id="show_wish_count"><%=hasRecord%></b>个商品)</span></div>
  <form action="#" name="wish_search_form" >
    <span class="temp_navi_search">
    <input type="text" class="select" id="select" name="select"/>
    <button type="submit" class="">在收藏中查询</button>
    </span>
  </form>
</div>
<!--分类--> 

<!--choose-->

<div class="mydd_temp_choose">
<div class="temp_check">
  <input type="checkbox" id="Check_All_Up" class="Check_All_Up"/>
  <span id="select_hit_up" class="choose"><a>全选</a></span>
 </div>
 <div class="temp_choose">
  <button id="totaldelete">批量删除</button>
  <button id="totalbuy">批量购买</button></div>
</div>
<!--list-->
<div class="favorites">
<table  cellspacing="0" cellpadding="0" border="0" id="myTab1_Content0" class="invite-table3 invite-table31226">

	<s:iterator value="Record_l" status="st">
		<tr>
			<td><input type="checkbox" name="Check_up" value="<s:property value="collection_id"/>"></td>
        	<td><span class="row02"><a target="_blank" href="showbook.do?book.book_id=<s:property value="book.book_id"/>"  name="product_pic"><img src="<%=path %>/../BookImages/cover/<s:property value="book.book_image"/>"/></a></span></td>
       	 	<td><span class="row03" style="display:inline;"><a target="_blank" name="product_name"><s:property value="book.name"/></a>商家：<a target="_blank"  name="business"><s:property value="book.publish_company"/></a>收藏人气：<s:property value="collectionNum_l.get(#st.index)"/>
        		                          
            	</span>
          	</td>
        	<td><span class="discount">
         		 <b>￥<span id=""><s:property value="collection_price"/></span></b>
         		 (<span><fmt:formatNumber value="${book.discount*100}" pattern="0"/></span>折)</span></td>
          	<td><span class="row05">
           		<a href="#"  class="buy" name="${book.book_id}" ><img border="0"  title="购买" src="images/newbtn_buy.gif"/></a>
           		<a href="#" name="<s:property value="collection_id"/>" class="delete">删除</a>
       		 </span></td>
		</tr>		
	</s:iterator>	
</table>
<table>
	<tr class="pageTr">
 		   			<td >当前页：<%=page01%>/<%=hasPages%>页 </td>
            		<td ><span class="STYLE7">数据总量 <%=hasRecord%> </span></td>
            		<td width="62" height="22" valign="middle"><div align="right"><a href="show_collection_by_page.do?page=1" onclick="return justNextPage();"><img src="images/page_first_1.gif" class="pageImage"/></a></div></td>
                	<td width="50" height="22" valign="middle"><div align="right"><a href="show_collection_by_page.do?page=<%=page01 - 1%>" onclick="return justNextPage();"><img src="images/page_back_1.gif" class="pageImage" /></a></div></td>
                	<td width="54" height="22" valign="middle"><div align="right"><a href="show_collection_by_page.do?page=<%=page01 + 1%>" onclick="return justUpPage()"><img src="images/page_next.gif" class="pageImage" /></a></div></td>
               	 	<td width="49" height="22" valign="middle"><div align="right"><a href="show_collection_by_page.do?page=<%=hasPages%>" onclick="return justUpPage()"><img src="images/page_last.gif" class="pageImage"/></a></div></td>
                	<td  height="22" valign="middle"><div align="right">转到第</div></td>
                	<td height="22" valign="middle"><span class="STYLE7">
                  		<s:select list="page_l" name="page" cssClass="STYLE1" onchange="test(this);"/>页
                		</span>
                	</td>                 
 				 </tr>
</table>
</div>



</div>
</body>
</html>
