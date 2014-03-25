<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title></title>
	<script src="${pageContext.request.contextPath}/admin/js/jquery-1.5.1.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/admin/js/table_tr.js" type="text/javascript"></script>
	<link href="${pageContext.request.contextPath}/admin/css/table_tr.css" type="text/css" rel="stylesheet" />
	<style type="text/css">
		.inbox{
			width:980px; 
		}
		.inbox1_3{
			margin-left:130px;
		}
		.td_1{
			width:120px;
			text-align:right;
		}
		.td_2{
			width:200px;
			text-align:left;
		}
	</style>
	
	<script type="text/javascript">
	
		$(function(){
	
			var height = $("body").height();
			$("#rightIframe",parent.document.body).height(height + 30);
			 $("#send2").click(function(){
				var uuid1 = $("#uuid1").val();
				$("#_Iframe").attr("src","${pageContext.request.contextPath}/showAllBP_by_page.do?page=1&brandgrid_id="+uuid1+"&time_status=1&owner_status=7");
			 });
			 $("#send3").click(function(){
				var uuid2 = $("#uuid2").val();
				$("#_Iframe").attr("src","${pageContext.request.contextPath}/showAllBP_by_page.do?page=1&brandgrid_id="+uuid2+"&time_status=&owner_status=8");
			 });
		})
	  	
	</script>
</head>

<body>
<div class="inbox">
  <table width="980" border="0">
        <tr>
          <td class="td_1"></td>
          <td class="td_2"></td>
		  <td class="td_1">注册品牌店：</td>
          <td class="td_2">
          <s:action name="makeBrandgrid_l_true" executeResult="false"></s:action>
          <s:select list="#request.brandgrid_l_true" listValue="brandgrid_name" listKey="brandgrid_id" id="uuid1"/>
          </td>
		  <td class="td_1">已注销品牌店：</td>
          <td class="td_2">
          <s:action name="makeBrandgrid_l_false" executeResult="false"></s:action>
          <s:select list="#request.brandgrid_l_false" listValue="brandgrid_name"listKey="brandgrid_id" id="uuid2"/>
          </td>
        </tr>
		<tr>
          <td class="td_1"></td>
          <td class="td_2"></td>
		  <td class="td_1"></td>
          <td class="td_2"><input type="submit" value="筛选" id="send2"/></td>
		  <td class="td_1"></td>
          <td class="td_2"><input type="submit" value="筛选" id="send3"/></td>
        </tr>
		<tr>
          <td class="td_1">&nbsp;</td>
          <td class="td_2">&nbsp;</td>
		  <td class="td_1"></td>
          <td class="td_2"></td>
		  <td class="td_1">&nbsp;</td>
          <td class="td_2">&nbsp;</td>
        </tr>
		<tr>
          <td class="td_1">&nbsp;</td>
          <td class="td_2">&nbsp;</td>
		  <td class="td_1">&nbsp;</td>
          <td class="td_2"></td>
		  <td class="td_1">&nbsp;</td>
          <td class="td_2">&nbsp;</td>
        </tr>
      </table>
</div>
<div class="inbox">
	
</div>
<div class="inbox">
	<iframe name="_Iframe" frameborder="1" id="_Iframe" width="980px">
                    
    </iframe>
</div>
</body>
</html>
