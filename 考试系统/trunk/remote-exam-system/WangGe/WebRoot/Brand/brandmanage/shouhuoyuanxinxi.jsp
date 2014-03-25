<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
<script src="${pageContext.request.contextPath}/Brand/js/jquery-1.6.4.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/Brand/js/fuxuankuang.js" type="text/javascript"></script>
<link href="${pageContext.request.contextPath}/Brand/css/shouhuoyuanxinxi.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/Brand/css/dialog.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/Brand/js/jquery-latest.pack.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/Brand/js/dialog.js" type="text/javascript"></script>
<script type="text/javascript">
	  	function refreshSize() {
			var owner_status = $("#owner_status").val(); 
			
			if(owner_status == '1'){
				$("#zaizhi").attr("class","yes");
				$("#lizhi").attr("class","no");
			}else{
				$("#zaizhi").attr("class","no");
				$("#lizhi").attr("class","yes");
			}
		}	
	  	
	  	function dozhuxiao(){
	  		if(!confirm('是否确定注销操作？')){return false;}
		     return true;
	  	}
	</script>
</head>

<body onload="refreshSize()">
<input type="hidden" id="owner_status" value="<s:property value="owner_status"/>"/>
<div id="top"><span id="zaizhi">
<s:url id="url" action="showSalesMen_brandowner">
        <s:param name="owner_status">1</s:param></s:url>
<s:a href="%{url}">在职</s:a>
</span>
<span id="lizhi">
<s:url id="url" action="showSalesMen_brandowner">
        <s:param name="owner_status">0</s:param></s:url>
<s:a href="%{url}">离职</s:a>

</span></div>
<table cellspacing="0">
  <tr>
    <td class="td2">姓名</td>
    <td class="td2">性别</td>
    <td class="td2">身份证号码</td>
    <td class="td2">联系电话</td>
    <td class="td2">联系QQ</td>
    <td class="td2">联系邮箱</td>
    <td class="td2">状态</td>
    <td colspan="3" class="td2">操作</td>
  </tr>
  <s:iterator value="brandgridSalesman_l" status="st">
  <tr>
    <td class="td3"><s:property value="brandgrid_salesman_name"/> </td>
    <td class="td3"><s:property value="brandgrid_salesman_sex"/></td>
    <td class="td3"><s:property value="brandgrid_salesman_idcard"/></td>
    <td class="td3"><s:property value="brandgrid_salesman_phone"/></td>
    <td class="td3"><s:property value="brandgrid_salesman_qq"/></td>
    <td class="td3"><s:property value="brandgrid_salesman_email"/></td>
    <td class="td3">
    	<s:if test="brandgrid_salesman_status==1">
    		正常
    	</s:if>
    	<s:else>
    		已注销
    	</s:else>
    </td>
    
    <td colspan="3" class="td3">
    	<s:if test="brandgrid_salesman_status==1">
    		<s:url id="url" action="zhuxiao_salesman">
	        	<s:param name="brandgrid_salesman_id"><s:property value="brandgrid_salesman_id"/></s:param>
	        </s:url>
			<s:a href="%{url}" onclick="return dozhuxiao();">注销</s:a>
    		 |
    		 <a href="#" onclick='dialog("查看售货员:<s:property value="brandgrid_salesman_name"/>的其他信息","iframe:<s:text name="mylocalhosturl" />${pageContext.request.contextPath}/Brand/brandmanage/dialog_shIf.jsp?username=<s:property value="brandgrid_salesman_name"/>&pw=<s:property value="brandgrid_salesman_pw"/>&in=<s:property value="brandgrid_salesman_newtime.toLocaleString()"/>&outt=<s:property value="brandgrid_salesman_outtime.toLocaleString()"/>&intt=<s:property value="brandgrid_salesman_intime.toLocaleString()"/>","450px","180px","iframe"); '>查看其他信息</a>
    		 |
    		 <s:url id="url" action="findSalesman_brandowner">
	        	<s:param name="brandgrid_salesman_id"><s:property value="brandgrid_salesman_id"/></s:param>
	        </s:url>
			<s:a href="%{url}">修改</s:a> 
    	</s:if>
    	<s:else>
    		<s:url id="url" action="jihuo_salesman">
	        	<s:param name="brandgrid_salesman_id"><s:property value="brandgrid_salesman_id"/></s:param>
	        </s:url>
			<s:a href="%{url}">激活</s:a>
    	</s:else>
	</td>
  </tr>
 </s:iterator>
  <tr>
    <td class="td5">&nbsp;</td>
    <td class="td5">&nbsp;</td>
    <td class="td5">&nbsp;</td>
    <td class="td5">&nbsp;</td>
    <td class="td5">&nbsp;</td>
    <td colspan="3" class="td5">&nbsp;</td>
  </tr>
</table>

<%
		Integer page01 = (Integer)request.getAttribute("page");
		Integer hasPages = (Integer)request.getAttribute("hasPages");
	 %>
	<script type="text/javascript">
		var page = <%=page01 %>;
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
		
		
		function zhuxiao(){
			
		}
		
		function test(select){
	  		$("#iframe",parent.document.body).attr("src","showSalesMen_brandowner.do?page="+select.value);
	  	}
	  	
	</script>

<table width="100%" border="0" cellspacing="10" cellpadding="10">
			<tr>
			
			<td align="center"><span id="page2"><s:property value="page"/></span>/<s:property value="hasPages"/></td>
			<td align="center">
				<s:url id="url" action="showSalesMen_brandowner">
				<s:param name="page">1</s:param>
			    </s:url>
				<s:a href="%{url}" onclick="return justNextPage();">第一页</s:a>
			</td>
			<td align="center">
				<s:url id="url" action="showSalesMen_brandowner">
				<s:param name="page"><s:property value="page-1"/></s:param>
			   </s:url>
				<s:a href="%{url}" onclick="return justNextPage();">上一页</s:a>
			</td>
			<td align="center">
				<s:url id="url" action="showSalesMen_brandowner">
				<s:param name="page"><s:property value="page+1"/></s:param>
				</s:url>
				<s:a href="%{url}" onclick="return justUpPage();">下一页</s:a>
			</td>
			<td align="center">
				<s:url id="url" action="showSalesMen_brandowner">
				<s:param name="page"><s:property value="hasPages"/></s:param>
				</s:url>
				<s:a href="%{url}" onclick="return justUpPage();">最后一页</s:a>
			</td>
			<td align="center">
			跳转<s:select list="page_l" name="page" onchange="test(this);"/>
			</td>
			<td align="center">
			共有<s:property value="has"/>条记录
			</td>
			</tr>
		</table>

</body>
</html>
