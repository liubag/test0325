<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
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
	Long hasCatagory = (Long) request.getAttribute("hasCatagory");
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
	  		location.href = "showCatagory_by_page.do?page="+select.value ;
	  	}
	  	
</script>
<link href="<%=request.getContextPath()%>/admin/css/taoshuxuan.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/admin/css/blockUI.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/admin/js/jquery-1.5.2.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/admin/js/jquery.tools.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/admin/js/jquery.blockUI.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/admin/js/bookClassify.js" charset="utf-8"></script>
</head>

<body>
<div id="breadNav">
	<jsp:include page="breadcrumbNavigation.jsp" />
</div>
<input type="hidden" class="page" value="<%=page01%>"/>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#c9c9c9">
      <tr>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">编号</span></strong></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">名称</span></strong></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">分类级别</span></strong></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">父类</span></strong></div></td>  
        <td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">操作</span></strong></div></td>        
      </tr>
      <s:iterator value="catagory_l" status="st">
      <tr>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3"><s:property value="catagory_id"/></span></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3"><s:property value="catagory_name"/></span></div></td>
        <c:set var="catagory_level" scope="request" ><s:property value="catagory_level"/></c:set>
        <c:choose>								
			<c:when test="${catagory_level == '1'}"><td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3">一级</span></div></td></c:when>
			<c:when test="${catagory_level == '2'}"><td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3">二级</span></div></td></c:when>				
		</c:choose>   
        <td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3"><s:property value="catagory_parent.catagory_name"/></span></div></td>             
        <td height="22" bgcolor="#FFFFFF"><div align="center" class="STYLE5"><a href="#" class="modifyCatagory" id="<s:property value="catagory_id"/>" name="<s:property value="catagory_name"/>">修改</a>| <a href="#" class="deleteCatagory" id="<s:property value="catagory_id"/>">删除</a>| <a href="#" class="discount" id="<s:property value="catagory_id"/>" name="<s:property value="discount"/>">打折</a></div></td>
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
            <td width="42%" class="STYLE1"><span class="STYLE7">数据总量 <%=hasCatagory%> </span></td>
          </tr>
        </table></td>
        <td width="75%" valign="top" class="STYLE1"><div align="right">
            <table width="352" height="20" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td width="62" height="22" valign="middle"><div align="right"><a href="showCatagory_by_page.do?page=1" onclick="return justNextPage();"><img src="images/page_first_1.gif" width="48" height="20" /></a></div></td>
                <td width="50" height="22" valign="middle"><div align="right"><a href="showCatagory_by_page.do?page=<%=page01 - 1%>" onclick="return justNextPage();"><img src="images/page_back_1.gif" width="55" height="20" /></a></div></td>
                <td width="54" height="22" valign="middle"><div align="right"><a href="showCatagory_by_page.do?page=<%=page01 + 1%>" onclick="return justUpPage()"><img src="images/page_next.gif" width="58" height="20" /></a></div></td>
                <td width="49" height="22" valign="middle"><div align="right"><a href="showCatagory_by_page.do?page=<%=hasPages%>" onclick="return justUpPage()"><img src="images/page_last.gif" width="52" height="20" /></a></div></td>
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
<div id="login_box" class="box">
	<fieldset  class="login_box">
		<h4 class="top_h4">修改图书分类</h4>
		<a href="#" class="close" title="关闭">close</a>
	<div class="label">
		<p>编号</p>
		<input id="id" name="catagory_id" type="text" disabled="disabled"/>
	</div>
	<div class="label">
		<p>名称</p>
		<input id="name" name="catagory_name" class="required1" type="text"/>
	</div>
	<span class="button2"><a href="#" id="send">提 交</a></span>
</fieldset>
</div> 
<div id="discount_box" class="box">
	<fieldset class="discount_box">
		<h4 class="top_h4">图书打折</h4>
		<a href="#" class="close" title="关闭">close</a>
	<div class="label">
		<p>编号</p>
		<input id="id2" name="catagory_id" type="text" disabled="disabled"/>
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
</div> 
</body>
</html>
