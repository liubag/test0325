<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>无标题文档</title>
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
<%
	Integer page01 = (Integer) request.getAttribute("page");
	Integer hasPages = (Integer) request.getAttribute("hasPages");
	Long hasBook = (Long) request.getAttribute("hasBook");
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
	  		location.href = "showBook_by_page.do?page="+select.value ;
	  	}
	  	
</script>
<link href="<%=request.getContextPath()%>/admin/css/taoshuxuan.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/admin/css/blockUI.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/admin/js/jquery-1.5.2.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/admin/js/jquery.tools.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/admin/js/jquery.blockUI.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/admin/js/showBook.js" charset="utf-8"></script>
</head>

<body>
<input type="hidden" class="page" value="<%=page01 %>"/>
<input type="hidden" class="shangjia" value="1"/>
<input type="hidden" class="xiajia" value="2"/>

<div id="breadNav">
	<jsp:include page="breadcrumbNavigation.jsp" />
</div>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#c9c9c9">
      <tr>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">图书名称</span></strong></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">作者</span></strong></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">出版社</span></strong></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">出版时间</span></strong></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">图书状态</span></strong></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">图书分类</span></strong></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">原价</span></strong></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">操作</span></strong></div></td>
      </tr>
      <s:iterator value="book_l" status="st">
      <tr>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3"><a href="#"><s:property value="name"/></a></span></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3"><s:property value="author"/></span></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3"><s:property value="publish_company"/></span></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3"><s:property value="publish_date.toLocaleString()"/></span></div></td>       
        <c:set var="status" scope="request" ><s:property value="status"/></c:set>
        <c:choose>								
			<c:when test="${status == '0'}"><td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3">入库但是未上架</span></div></td></c:when>
			<c:when test="${status == '1'}"><td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3">已上架</span></div></td></c:when>			
			<c:when test="${status == '2'}"><td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3">已下架</span></div></td></c:when>					
		</c:choose> 		
        <td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3"><s:property value="catagory.catagory_name"/></span></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3"><s:property value="price"/></span></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center" class="STYLE5"><a href="#" class="added" id="<s:property value="book_id"/>" name="<s:property value="status"/>">上架</a>| <a href="#" class="drops" id="<s:property value="book_id"/>" name="<s:property value="status"/>">下架</a>| <a href="gainBook.do?book.book_id=<s:property value="book_id"/>">详细/修改</a>| <a href="#" class="storage_num" name="<s:property value="storage_num"/>" charset="<s:property value="name"/>" id="<s:property value="book_id"/>">增加库存</a>| <a href="#" charset="<s:property value="name"/>" class="discount" id="<s:property value="book_id"/>" name="<s:property value="discount"/>">打折</a></div></td>
      </tr>
      </s:iterator>
      
    </table></td>
  </tr>
   <tr>
    <td height="35"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="25%" height="29" nowrap="nowrap"><table width="342" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="44%" class="STYLE1">当前页：<%=page01%>/<%=hasPages%>页 每页 
              <input name="textfield2" type="text" class="STYLE1" style="height:14px; width:25px;" value="<%=perFolioAmount %>" size="5" />            </td>
            <td width="14%" class="STYLE1"><img src="images/sz.gif" width="43" height="20" /></td>
            <td width="42%" class="STYLE1"><span class="STYLE7">数据总量 <%=hasBook%> </span></td>
          </tr>
        </table></td>
        <td width="75%" valign="top" class="STYLE1"><div align="right">
            <table width="352" height="20" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td width="62" height="22" valign="middle"><div align="right"><a href="showBook_by_page.do?page=1" onclick="return justNextPage();"><img src="images/page_first_1.gif" width="48" height="20" /></a></div></td>
                <td width="50" height="22" valign="middle"><div align="right"><a href="showBook_by_page.do?page=<%=page01 - 1%>" onclick="return justNextPage();"><img src="images/page_back_1.gif" width="55" height="20" /></a></div></td>
                <td width="54" height="22" valign="middle"><div align="right"><a href="showBook_by_page.do?page=<%=page01 + 1%>" onclick="return justUpPage()"><img src="images/page_next.gif" width="58" height="20" /></a></div></td>
                <td width="49" height="22" valign="middle"><div align="right"><a href="showBook_by_page.do?page=<%=hasPages%>" onclick="return justUpPage()"><img src="images/page_last.gif" width="52" height="20" /></a></div></td>
                <td width="59" height="22" valign="middle"><div align="right">转到第</div></td>
                <td width="25" height="22" valign="middle"><span class="STYLE7">
                  <s:select list="page_l" name="page" cssClass="STYLE1" onchange="test(this);"/>
                </span></td>
                <td width="23" height="22" valign="middle">页</td>
                <td width="30" height="22" valign="middle"><img src="images/go.gif" width="26" height="20" /></td>
              </tr>
            </table>
        </div></td>
      </tr>
    </table></td>
  </tr>
</table>
<div id="discount_box" class="box">
	<fieldset class="discount_box">
		<h4 class="top_h4">图书打折</h4>
		<a href="#" class="close" title="关闭">close</a>
	<div class="label">
		<input id="id2" name="book_id" type="hidden"/>
	</div>
	<div class="label">
		<p>图书名称</p>
		<input id="name2" name="name" type="text" disabled="disabled"/>
	</div>
	<div class="label">
		<p>当前折扣</p>
		<input id="oldDiscount" name="discount" type="text" disabled="disabled"/>
	</div>
	<div class="label">
		<p>新折扣</p>
		<input id="newDiscount" name="newDiscount" class="required1" type="text"/>
	</div>
	<span class="button2"><a href="#" id="sendDiscount">提 交</a></span>
</fieldset>
<div id="storage_num_box" class="box">
	<fieldset class="storage_num_box">
		<h4 class="top_h4">添加图书库存</h4>
		<a href="#" class="close" title="关闭">close</a>
	<div class="label">
		
		<input id="id" name="book_id" type="hidden"/>
	</div>
	<div class="label">
		<p>图书名称</p>
		<input id="name" name="name" type="text" disabled="disabled"/>
	</div>
	<div class="label">
		<p>当前库存</p>
		<input id="oldStorage_num" name="storage_num" type="text" disabled="disabled"/>
	</div>
	<div class="label">
		<p>增加数量</p>
		<input id="newStorage_num" name="newStorage_num" class="required1" type="text"/>
	</div>
	<span class="button2"><a href="#" id="sendStorage_num">提 交</a></span>
</fieldset>
</div> 
</body>
</html>
