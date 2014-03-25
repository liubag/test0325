<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
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
#isHasTranslator{
	display: none;
}
</style>
<link href="<%=request.getContextPath()%>/admin/css/taoshuxuan.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/admin/css/personalInfor.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/admin/css/main.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/admin/js/jquery-1.5.2.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/admin/js/jquery.form.js" ></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/admin/js/addBook.js" charset="utf-8"></script>
</head>
<body>
<input type="hidden" value="<%=path %>" class="path"/>
	<div  class="main_right"> 	
	<div id="breadNav">
		<jsp:include page="breadcrumbNavigation.jsp" />
	</div>	
        <div class="archives_title">
            <h2>新增图书</h2>
        </div>

        <div class="myForm">
        <form action="addBook.do" id="form" method="post">
        <table id="addStaff" class="myTable">
            <tr>
            	<td>图书名称:</td>
                <td><input type="text" class="required1" id="name" name="book.name" /></td>
            </tr>
            <tr>
            	<td>图书封面:</td>
                <td >
                	<input id="fileupload" class="required1" name="fileupload" type="file" />
                	<input type="hidden" name="book.book_image" class="book_image"/>
                </td>
            </tr>
            <tr>
            	<td>图书简介:</td>
                <td><textarea id="content_summary" name="book.content_summary" class="required1" cols="20" rows="100" style="width: 217px; height: 71px;"></textarea></td>
            </tr>
            <tr>
            	<td>ISBN编号:</td>
                <td><input type="text" class="required1" id="isbn" name="book.isbn" /></td>
            </tr>
            <tr>
            	<td>图书作者:</td>
                <td><input type="text" class="required1" id="author" name="book.author" /></td>
            </tr>
            <tr>
            	<td>进口书:</td>
                <td >
                	<input type="radio" name="book.is_import" value="1" />是&nbsp;&nbsp;
                	<input type="radio" name="book.is_import" value="0" checked="checked"/>否&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
            </tr>
            <tr>
            	<td>语言:</td>
                <td >
                	<input type="radio" id="foreign" name="book.is_foreign" value="1" />外语&nbsp;&nbsp;
                	<input type="radio" id="chain" name="book.is_foreign" value="0" checked="checked"/>中文&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
            </tr>
            <tr id="isHasTranslator">           	
            	<td>翻译者:</td>
                <td><input type="text" id="translator" class="required1" name="book.translator"/></td>               
            </tr>
            <tr>
            	<td>出版社:</td>
                <td><input type="text" class="required1" id="publish_company" name="book.publish_company" /></td>
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
                <td><input type="text" class="required1" id="storage_num" name="book.storage_num" /></td>
            </tr>           
            <tr>
            	<td>图书分类:</td>
                <td>
                	<s:action name="findFirstCatagory" executeResult="false">
                	</s:action>
					<s:select list="#request.catagory_l"  name="firstCatagory_id" id="select_big"  listValue="catagory_name" listKey="catagory_id" headerKey="0" headerValue="--请选择一级分类--"/>
					<select id="select_small" class="required1" name="secondCatagory_id">
						<option id="option" value="0">--请选择二级分类--</option>
					</select>
                </td>
            </tr>            
            <tr>
            	<td>图书原价:</td>
                <td><input type="text" name="book.price" id="price" class="required1"/></td>
            </tr>
            <tr>
            	<td colspan="2">
                	<input type="submit" value="保存" id="send" class="button"/>
                	<input type="reset" value="重置" class="button"/>
                </td>
            </tr>
        </table>
  		</form>
  		</div>
  </div>
</body>
</html>
