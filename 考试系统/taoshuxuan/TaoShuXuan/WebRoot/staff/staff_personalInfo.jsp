<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>无标题文档</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/staff/css/staff_personalInfo.css" type="text/css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/staff/css/main.css" type="text/css" />
</head>

<body>
<div id="breadNav">
	<jsp:include page="breadcrumbNavigation.jsp" />
</div>
	<div id="info">
    	<form>
        <table id="addStaff">
        	<tr>
            	<td>工号:</td>
                <td><input type="text" name="staff.staff_id" value="${staff.staff_id}" disabled="disabled"/> </td>
            </tr>
            <tr>
            	<td>姓名:</td>
                <td><input type="text" name="staff.name" value="${staff.name }" disabled="disabled"/></td>
            </tr>
            <tr>
            	<td>性别:</td>
                <td >
                	<c:set var="sex" scope="request" >${staff.sex}</c:set>
                	<c:choose>								
						<c:when test="${sex == '男'}"><input type="radio" name="staff.sex" value="男" checked="checked" disabled="disabled"/>男&nbsp;&nbsp;<input type="radio" name="staff.sex" value="女" disabled="disabled"/>女&nbsp;&nbsp;&nbsp;&nbsp;</c:when>
						<c:when test="${sex == '女'}"><input type="radio" name="staff.sex" value="男" disabled="disabled"/>男&nbsp;&nbsp;<input type="radio" name="staff.sex" value="女" checked="checked" disabled="disabled"/>女&nbsp;&nbsp;&nbsp;&nbsp;</c:when>				
					</c:choose>  
                </td>
            </tr>
            <tr>
            	<td>身份证号码:</td>
                <td><input type="text" name="staff.idcard" value="${staff.idcard }" disabled="disabled"/></td>
            </tr>
            <tr>
            	<td>出生年月:</td>
                <td><input type="text" name="staff.birthday" value="${staff.birthday}" disabled="disabled"/></td>
            </tr>
            <tr>
            	<td>员工加入时间:</td>
                <td><input type="text" name="staff.join_date" value="${staff.join_date}" disabled="disabled"/></td>
            </tr>
            <tr>
            	<td>联系号码:</td>
                <td><input type="text" name="staff.phone" value="${staff.phone}" disabled="disabled"/></td>
            </tr>
            <tr>
            	<td>员工住址:</td>
                <td><input type="text" name="staff.address" value="${staff.address }" disabled="disabled"/></td>
            </tr>
            <tr>
            	<td colspan="2">
            	    <a href="" style="color:green" title="员工不能修改基本信息，如需修改，请点击联系管理员">申请修改信息</a>
                	<input type="reset" value="返回"/>
                </td>
            </tr>
        </table>
  		</form>
    </div>
</body>
</html>
