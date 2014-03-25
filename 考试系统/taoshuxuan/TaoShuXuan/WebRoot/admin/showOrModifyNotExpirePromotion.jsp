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
.promotion_discount,.promotion_money{
	display: none;
}

</style>
<link href="<%=request.getContextPath()%>/admin/css/taoshuxuan.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/admin/css/personalInfor.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/admin/css/main.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/admin/css/jquery.multiselect.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/admin/css/style.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/admin/css/prettify.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/admin/css/jquery-ui.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/admin/js/jquery-1.5.2.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/admin/js/jquery.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/admin/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/admin/js/jquery.multiselect.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/admin/js/prettify.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/admin/js/jquery.form.js" ></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/admin/js/showOrModifyNotExpirePromotion.js" charset="utf-8"></script>
<script type="text/javascript">		
$(function(){
	$("#test-1").multiselect({
		show: ["bounce", 200],
		hide: ["explode", 1000]
	});	
});
</script>
</head>

<body>
<div  class="main_right"> 	
	<div id="breadNav">
		<jsp:include page="breadcrumbNavigation.jsp" />
	</div>	
        <div class="archives_title">
            <h2>未过期优惠信息查看/修改</h2>
        </div>

        <div class="myForm">
        <form action="updatePromotion.do" id="update" method="post" enctype="multipart/form-data">
        <input type="hidden" name="promotion.promotion_id" value="${promotion.promotion_id}"/>
        <table id="addStaff" class="myTable">         
            <tr>
            	<td>活动封面:</td>
                <td >
                	<img class="bookImage" src="<%=path %>/../BookImages/activity/${promotion.promotion_image}"/><br/>
                	<input id="fileupload" name="fileupload" type="file" disabled="disabled"/><br/><br/>
                	<input type="hidden" name="promotion.promotion_image" class="promotion_image"/>
                </td>
            </tr>
            <tr>
            	<td>优惠类型:</td>
                <td>
                	<input type="hidden" id="promotion_type" value="${promotion.promotion_type}"/>
                	<select id="select_type" class="required1" name="promotion.promotion_type" disabled="disabled">
						<option id="option" value="0">--请选择优惠类型--</option>
						<option id="option" value="1">满额打折</option>
						<option id="option" value="2">满额减价</option>
					</select>
                </td>
            </tr>
            <tr class="promotion_money">
            	<td><span style="color:red;">优惠金额:</span></td>
                <td><input type="text" class="required1" id="promotion_money" name="promotion.promotion_money" disabled="disabled" value="${promotion.promotion_money}"/></td>
            </tr>
            <tr class="promotion_discount">
            	<td><span style="color:red;">优惠折扣:</span></td>
                <td><input type="text" class="required1" id="promotion_discount" name="promotion.promotion_discount" disabled="disabled" value="${promotion.promotion_discount}"/></td>
            </tr>
            <tr>
            	<td>购书金额:</td>
                <td><input type="text" class="required1" id="need_amount" name="promotion.need_amount" disabled="disabled" value="${promotion.need_amount}"/></td>
            </tr>          
             <tr>
            	<td>开始日期:</td>
                <td>
					<sx:datetimepicker name="promotion.effective_date" id="effective_date"
					cssClass="required1 effective_date" toggleType="wipe" toggleDuration="400"
					displayFormat="yyyy-MM-dd" />					
				</td>
            </tr>
            <tr>
            	<td>结束日期:</td>
                <td>
					<sx:datetimepicker name="promotion.expiry_date" id="expiry_date"
					cssClass="required1 expiry_date" toggleType="wipe" toggleDuration="400"
					displayFormat="yyyy-MM-dd" />					
				</td>
            </tr>
            <tr>
            	<td>优惠图书分类:</td>
                <td>
                	<input type="text" id="promotion_catagorys" name="promotion_catagorys" disabled="disabled" value="${promotion_catagorys}"/>
					<input type="button" value="修改" disabled="disabled" id="changeCatagory"/>
                	<input type="hidden" class="hid" name="promotion.promotion_catagorys"/>
                	<s:action name="gainSecondCatagory" executeResult="false"/>
                	<div id="showCatagorys" style="display: none;">
                	<s:select list="#request.catagory_l" name="catagory_id" cssClass="required1 catagory_id" id="test-1" multiple="multiple" listValue="catagory_name" listKey="catagory_id" />
               		</div>
                </td>
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
 
 