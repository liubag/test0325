<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>无标题文档</title>
<sx:head extraLocales="en-us,nl-nl,de-de"/>

<link href="<%=request.getContextPath()%>/admin/css/taoshuxuan.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/admin/css/personalInfor.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/admin/css/main.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/admin/js/jquery-1.5.2.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/admin/js/addStaff.js" charset="utf-8"></script>
</head>
<body>
	<div  class="main_right"> 	
	<div id="breadNav">
		<jsp:include page="breadcrumbNavigation.jsp" />
	</div>	
        <div class="archives_title">
            <h2>新增员工</h2>
        </div>

        <div class="myForm">
        <form action="addStaff.do" method="post">
        <table id="addStaff" class="myTable">
        	<tr>
            	<td>员工工号:</td>
                <td><input type="text" class="required1" id="staff_id" name="staff.staff_id" /> </td>
            </tr>
            <tr>
            	<td>员工姓名:</td>
                <td><input type="text" class="required1" id="staff_name" name="staff.name" /></td>
            </tr>
            <tr>
            	<td>性别:</td>
                <td >
                	<input type="radio" name="staff.sex" value="男" checked="checked"/>男&nbsp;&nbsp;
                	<input type="radio" name="staff.sex" value="女"/>女&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
            </tr>
            <tr>
            	<td>身份证号码:</td>
                <td><input type="text" class="required1" id="identity_card" name="staff.idcard" /></td>
            </tr>
            <tr>
            	<td>手机号码:</td>
                <td><input type="text" class="required1" id="phone" name="staff.phone" /></td>
            </tr>
            <tr>
            	<td>出生年月:</td>
                <td>
					<sx:datetimepicker name="staff.birthday" id="date"
					cssClass="required1 date" toggleType="wipe" toggleDuration="400"
					displayFormat="yyyy-MM-dd" />
					
				</td>
            </tr>
            <tr>
            	<td>员工住址:</td>
                <td><input type="text" name="staff.address" id="address" class="required1"/></td>
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
