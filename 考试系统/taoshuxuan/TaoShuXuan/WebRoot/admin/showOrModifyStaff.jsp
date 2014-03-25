<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>无标题文档</title>
<sx:head extraLocales="en-us,nl-nl,de-de"/>
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
            <h2>员工信息查看/修改</h2>
        </div>

        <div class="myForm">
        <form action="ModifyStaff.do" method="post">
        <table id="addStaff" class="myTable">
        	<tr>
            	<td>员工工号:</td>
                <td><input type="text" class="required1" id="staff_id" name="staff.staff_id" disabled="disabled" value="${staff.staff_id}"/> </td>
            </tr>
            <tr>
            	<td>员工姓名:</td>
                <td><input type="text" class="required1" id="staff_name"  name="staff.name" disabled="disabled" value="${staff.name}"/></td>
            </tr>
            <tr>
            	<td>性别:</td>
                <td >
                	<c:set var="sex" scope="request" >${staff.sex}</c:set>
                	<c:choose>								
						<c:when test="${sex == '男'}"><input type="radio" name="staff.sex" value="男" checked="checked"/>男&nbsp;&nbsp;<input type="radio" name="staff.sex" value="女"/>女&nbsp;&nbsp;&nbsp;&nbsp;</c:when>
						<c:when test="${sex == '女'}"><input type="radio" name="staff.sex" value="男"/>男&nbsp;&nbsp;<input type="radio" name="staff.sex" value="女" checked="checked"/>女&nbsp;&nbsp;&nbsp;&nbsp;</c:when>				
					</c:choose>                 	               	
                </td>
            </tr>
            <tr>
            	<td>身份证号码:</td>
                <td><input type="text" class="required1" id="identity_card" name="staff.idcard" disabled="disabled" value="${staff.idcard}"/></td>
            </tr>
            <tr>
            	<td>手机号码:</td>
                <td><input type="text" class="required1" id="phone" name="staff.phone" disabled="disabled" value="${staff.phone}"/></td>
            </tr>
            <tr>
            	<td>出生年月:</td>
                <td>
                	<sx:datetimepicker name="staff.birthday" id="birthday"
					cssClass="required1 birthday" toggleType="wipe" toggleDuration="400"
					displayFormat="yyyy-MM-dd" disabled="true"/>
					
				</td>
            </tr>
            <tr>
            	<td>注册时间:</td>
                <td>
                	<sx:datetimepicker name="staff.join_date" id="join_date"
					cssClass="required1 join_date" toggleType="wipe" toggleDuration="400"
					displayFormat="yyyy-MM-dd" disabled="true"/>
					
				</td>
            </tr>
            <tr>
            	<td>禁用时间:</td>
                <td>
                	<sx:datetimepicker name="staff.remove_date" id="remove_date"
					cssClass="required1 remove_date" toggleType="wipe" toggleDuration="400"
					displayFormat="yyyy-MM-dd" disabled="true"/>
					
				</td>
            </tr>
            <tr>
            	<td>状态:</td>
                <td>
                	<c:set var="status" scope="request" >${staff.status}</c:set>
                	<c:choose>								
						<c:when test="${status == '0'}"><input type="text" class="required1" id="state" name="staff.status" disabled="disabled" value="禁用"/></c:when>
						<c:when test="${status == '1'}"><input type="text" class="required1" id="state" name="staff.status" disabled="disabled" value="正常"/></c:when>				
					</c:choose>
				</td>
            </tr>
            <tr>
            	<td>员工住址:</td>
                <td><input type="text" name="staff.address" id="address" class="required1" disabled="disabled" value="${staff.address}"/></td>
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
 
 