<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>无标题文档</title>
<link href="<%=request.getContextPath()%>/admin/css/taoshuxuan.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/admin/css/personalInfor.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/admin/css/main.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/admin/js/jquery-1.5.2.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/admin/js/showOrModifyStaff.js" charset="utf-8"></script>
</head>

<body>
<div  class="main_right"> 	
	<div id="breadNav">
		<jsp:include page="breadcrumbNavigation.jsp" />
	</div>	
        <div class="archives_title">
            <h2>会员信息查看</h2>
        </div>

        <div class="myForm">
        <table id="addStaff" class="myTable">
        	<tr>
            	<td>员工账号:</td>
                <td><input type="text" class="required1" disabled="disabled" value="${customer.email}"/> </td>
            </tr>
            <tr>
            	<td>会员姓名:</td>
                <td><input type="text" class="required1" disabled="disabled" value="${customer.name}"/></td>
            </tr>
            <tr>
            	<td>性别:</td>
                <td >
                	<c:set var="sex" scope="request" >${customer.sex}</c:set>
                	<c:choose>								
						<c:when test="${sex == '男'}"><input type="radio" name="customer.sex" value="男" checked="checked"/>男&nbsp;&nbsp;<input type="radio" name="customer.sex" value="女"/>女&nbsp;&nbsp;&nbsp;&nbsp;</c:when>
						<c:when test="${sex == '女'}"><input type="radio" name="customer.sex" value="男"/>男&nbsp;&nbsp;<input type="radio" name="customer.sex" value="女" checked="checked"/>女&nbsp;&nbsp;&nbsp;&nbsp;</c:when>				
					</c:choose>                 	               	
                </td>
            </tr>
            <tr>
            	<td>余额:</td>
                <td><input type="text" class="required1"  disabled="disabled" value="${customer.balance}"/></td>
            </tr>          
            <tr>
            	<td>出生年月:</td>
                <td>
					<input type="text" class="required1"  disabled="disabled" value="${customer.birthday}.toLoacleString()" />
				</td>
            </tr>
            <tr>
            	<td>注册时间:</td>
                <td>
					<input type="text" class="required1" disabled="disabled" value="${customer.join_date}" />
				</td>
            </tr>
            <tr>
            	<td>爱好:</td>
                <td>
					<input type="text" class="required1"  disabled="disabled" value="${customer.hobbies}"/>
				</td>
            </tr>
            <tr>
            	<td>状态:</td>
                <td>
                	<c:set var="status" scope="request" >${customer.status}</c:set>
                	<c:choose>								
						<c:when test="${status == '0'}"><input type="text" class="required1" id="state"  disabled="disabled" value="禁用"/></c:when>
						<c:when test="${status == '1'}"><input type="text" class="required1" id="state" disabled="disabled" value="正常"/></c:when>	
						<c:when test="${status == '2'}"><input type="text" class="required1" id="state" disabled="disabled" value="未激活"/></c:when>				
					</c:choose>
				</td>
            </tr>
            <tr>
            	<td>会员住址:</td>
                <td><input type="text" id="address" class="required1" disabled="disabled" value="${customer.address}"/></td>
            </tr>
        </table>
  		</div>
  </div>
</body>
</html>
 
 