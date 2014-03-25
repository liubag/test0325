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
<script type="text/javascript" src="<%=request.getContextPath()%>/admin/js/addPaymentMethod.js" charset="utf-8"></script>
</head>
<body>
	<div  class="main_right"> 	
	<div id="breadNav">
		<jsp:include page="breadcrumbNavigation.jsp" />
	</div>	
        <div class="archives_title">
            <h2>新增支付方式</h2>
        </div>

        <div class="myForm">
        <form action="addPaymentMethod.do" method="post">
        <table id="addStaff" class="myTable">       	
            <tr>
            	<td>支付名称:</td>
                <td><input type="text" class="required1" id="name" name="paymentMethod.name" /></td>
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
