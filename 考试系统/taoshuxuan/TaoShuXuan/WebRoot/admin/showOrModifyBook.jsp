<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>无标题文档</title>
<sx:head extraLocales="en-us,nl-nl,de-de"/>
<style type="text/css">
#getCatagory{
	display: none;
	float:right;
}
</style>
<link href="<%=request.getContextPath()%>/admin/css/taoshuxuan.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/admin/css/personalInfor.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/admin/css/main.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/admin/js/jquery-1.5.2.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/admin/js/jquery.form.js" ></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/admin/js/showOrModifyBook.js" charset="utf-8"></script>
</head>

<body>
<div  class="main_right"> 	
	<div id="breadNav">
		<jsp:include page="breadcrumbNavigation.jsp" />
	</div>	
        <div class="archives_title">
            <h2>图书信息查看/修改</h2>
        </div>

        <div class="myForm">
        <form action="updateBook.do" id="update" method="post" enctype="multipart/form-data">
        <table id="addStaff" class="myTable">
            <tr>
            	<td>图书名称:</td>
                <td><input type="text" class="required1" id="name" name="book.name" disabled="disabled" value="${book.name}"/></td>
             </tr>
            <tr>
            	<td>图书封面:</td>
                <td >
                	<img class="bookImage" src="<%=path %>/../BookImages/cover/${book.book_image}"/><br/>
                	<input id="fileupload" name="fileupload" type="file" disabled="disabled" /><br/><br/>
                	<input type="hidden" name="book.book_image" class="book_image"/>
                </td>
            </tr>
            <tr>
            	<td>图书简介:</td>
                <td><textarea id="content_summary" name="book.content_summary" class="required1" disabled="disabled" cols="20" rows="100" style="width: 217px; height: 71px;">${book.content_summary}</textarea></td>
            </tr>
            <tr>
            	<td>ISBN编号:</td>
                <td><input type="text" class="required1" id="isbn" name="book.isbn" disabled="disabled" value="${book.isbn}" /></td>
            </tr>
            <tr>
            	<td>图书作者:</td>
                <td><input type="text" class="required1" id="author" name="book.author" disabled="disabled" value="${book.author}"/></td>
            </tr>
            <tr>
            	<td>进口书:</td>
                <td >
                	<c:set var="is_import" scope="request" >${book.is_import}</c:set>
                	<c:choose>								
						<c:when test="${is_import == '1'}"><input type="radio" name="book.is_import" value="1" checked="checked"/>是&nbsp;&nbsp;
                	<input type="radio" name="book.is_import" value="0" />否&nbsp;&nbsp;&nbsp;&nbsp;</c:when>
						<c:when test="${is_import == '0'}"><input type="radio" name="book.is_import" value="1" />是&nbsp;&nbsp;
                	<input type="radio" name="book.is_import" value="0" checked="checked"/>否&nbsp;&nbsp;&nbsp;&nbsp;</c:when>				
					</c:choose>                 	               	
                	
                </td>
            </tr>
            <tr>
            	<td>语言:</td>
                <td >
                	<c:set var="is_foreign" scope="request" >${book.is_foreign}</c:set>
                	<c:choose>								
						<c:when test="${is_foreign == '1'}"><input type="radio" id="foreign" name="book.is_foreign" value="1" checked="checked"/>外语&nbsp;&nbsp;
                	<input type="radio" id="chain" name="book.is_foreign" value="0" />中文&nbsp;&nbsp;&nbsp;&nbsp;</c:when>
						<c:when test="${is_foreign == '0'}"><input type="radio" id="foreign" name="book.is_foreign" value="1" />外语&nbsp;&nbsp;
                	<input type="radio" id="chain" name="book.is_foreign" value="0" checked="checked"/>中文&nbsp;&nbsp;&nbsp;&nbsp;</c:when>				
					</c:choose> 
                </td>
            </tr>
            <tr id="isHasTranslator"> 
            	<input type="hidden" value="${book.is_foreign}" id="is_foreign"/>
            	<td>翻译者:</td>
                <td><input type="text" id="translator" class="required1" name="book.translator" disabled="disabled" value="${book.translator}"/></td>
            </tr>
            <tr>
            	<td>出版社:</td>
                <td><input type="text" class="required1" id="publish_company" name="book.publish_company" disabled="disabled" value="${book.publish_company}"/></td>
            </tr>
            <tr>
            	<td>出版时间:</td>
                <td>
					<sx:datetimepicker name="book.publish_date" id="publish_date"
					cssClass="required1 publish_date" toggleType="wipe" toggleDuration="400"
					displayFormat="yyyy-MM-dd" />					
				</td>
            </tr>
            <tr>
            	<td>库存:</td>
                <td><input type="text" class="required1" id="storage_num" name="book.storage_num" disabled="disabled" value="${book.storage_num}"/></td>
            </tr>           
            <tr>
            	<td>图书分类:</td>
                <td>	
                	<input type="text" disabled="disabled" value="${book.catagory.catagory_name}"/><input type="button" value="修改" disabled="disabled" id="changeCatagory"/>
                	<s:action name="findFirstCatagory" executeResult="false"></s:action>
                	<div id="getCatagory">               	
					<s:select list="#request.catagory_l"  name="book.Catagory.catagory_id" id="select_big"  listValue="catagory_name" listKey="catagory_id" headerKey="0" headerValue="--请选择一级分类--"/>
					<select id="select_small" class="required1" name="secondCatagory_id">
						<option id="option" value="0">--请选择二级分类--</option>
					</select>
                	</div>
          		</td>
            </tr>            
            <tr>
            	<td>图书原价:</td>
                <td><input type="text" name="book.price" id="price" class="required1" disabled="disabled" value="${book.price}"/></td>
            </tr>
            <tr>
            	<td colspan="2">
                	<input type="submit" value="保存" id="send" class="button" disabled="disabled"/>
                	<input type="button" value="修改" class="button" id="modify"/>
                </td>
            </tr>
        </table>
  		</form>
  		</div>
  </div>
</body>
</html>
 
 