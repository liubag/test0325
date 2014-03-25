<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>公告栏</title>
<script src="${pageContext.request.contextPath}/Brand/js/jquery-1.6.4.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/Brand/js/fuxuankuang.js" type="text/javascript"></script>
<link href="${pageContext.request.contextPath}/Brand/css/gonggaolan.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath}/Brand/css/dialog.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/Brand/js/jquery-latest.pack.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/Brand/js/dialog.js" type="text/javascript"></script>
<style type="text/css">
#fengye td{
	height: 10px;
}
.text_red{
	color: red;
}

.text_black{
	color: black;
}
</style>
</head>

<body>
<table cellspacing="0">
  <tr>
    <td width="5%" class="td2">状态</td>
    <td width="10%" class="td2">发布时间</td>
    <td width="10%" class="td2">最近上架时间</td>
    <td width="10%" class="td2">最近下架时间</td>
    <td width="60%" class="td2">信息内容</td>
    <td width="5%" colspan="3" class="td2">操作</td>
  </tr>
  <s:iterator value="brandgridInfocote_l" status="st">
  <tr>
    <td class="td3">
    <s:if test="brandgrid_infocote_status==1">
    	已下架
    </s:if>
    <s:else>
    	正上架
    </s:else>
    </td>
    <td class="td3"><s:property value="brandgrid_infocote_dotime.toLocaleString()"/></td>
    <td class="td3"><s:property value="brandgrid_infocote_uptime.toLocaleString()"/></td>
    <td class="td3"><s:property value="brandgrid_infocote_outtime.toLocaleString()"/></td>
    <td class="td3"><s:property value="brandgrid_infocote"/></td>
    <td colspan="3" class="td3">
    	<p>
    	 <a href="#" onclick='dialog("修改公告栏信息","iframe:<s:text name="mylocalhosturl" />${pageContext.request.contextPath}/find_id_brandowner.do?brandgrid_infocote_id=<s:property value="brandgrid_infocote_id"/>","500px","350px","iframe"); '>修改</a>
    	</p>
      	<p>
      	<s:url id="url" action="dele_brandowner">
			<s:param name="brandgrid_infocote_id"><s:property value="brandgrid_infocote_id"/></s:param>
		</s:url>
		<s:a href="%{url}">删除</s:a>
      	</p>
      	<s:if test="brandgrid_infocote_status==1">
      		<p>
      		<s:url id="url" action="shangjia_brandowner">
			<s:param name="brandgrid_infocote_id"><s:property value="brandgrid_infocote_id"/></s:param>
		</s:url>
		<s:a href="%{url}">上架</s:a>
      		</p>
      	</s:if>
      	<s:else>
      		<p>
      		<s:url id="url" action="xiajia_brandowner">
			<s:param name="brandgrid_infocote_id"><s:property value="brandgrid_infocote_id"/></s:param>
		</s:url>
		<s:a href="%{url}">下架</s:a>
      		</p>
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
		
		
		function test(select){
	  		$("#iframe",parent.document.body).attr("src","show_by_page_brandowner.do?page="+select.value);
	  	}
	  	var beforevalue = null;
	  	function infokeyup(){
	  		var goodsinfo = $("#text").attr("value");
	  		if(goodsinfo.length >200){
	  			$("#text").val(beforevalue);
	  			
	  			return;
	  		}
	  		if(goodsinfo.length == 200){
	  			$("#wordcount").attr("class","text_red");
	  		}else{
	  			$("#wordcount").attr("class","text_black");
	  		}
	  		beforevalue = goodsinfo;
	  		$("#wordcount").html(goodsinfo.length + "/200字");
	  		return;
	  	}
	  	
	</script>

<table id="fengye" width="100%" border="0" >
			<tr>
			<td align="center"><s:property value="page"/>/<s:property value="hasPages"/></td>
			<td align="center">
				<s:url id="url" action="show_by_page_brandowner">
				<s:param name="page">1</s:param>
			    </s:url>
				<s:a href="%{url}" onclick="return justNextPage();">第一页</s:a>
			</td>
			<td align="center">
				<s:url id="url" action="show_by_page_brandowner">
				<s:param name="page"><s:property value="page-1"/></s:param>
			   </s:url>
				<s:a href="%{url}" onclick="return justNextPage();">上一页</s:a>
			</td>
			<td align="center">
				<s:url id="url" action="show_by_page_brandowner">
				<s:param name="page"><s:property value="page+1"/></s:param>
				</s:url>
				<s:a href="%{url}" onclick="return justUpPage();">下一页</s:a>
			</td>
			<td align="center">
				<s:url id="url" action="show_by_page_brandowner">
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
<s:form method="post" action="save_brandowner">
<table>
  <tr>
    <td id="line1">发布公告信息:</td>
  </tr>
  <tr>
    <td>
	<label>
      <textarea name="brandgridInfocote.brandgrid_infocote" id="text" onkeyup="infokeyup();"></textarea>
    </label></td>
  </tr>
  <tr>
    <td style="text-align: right;">
     	<span id="wordcount">0/200字</span>
    </td>
  </tr>
  
  <tr>
    <td><label>
      <input type="submit" name="Submit2" value="发布" class="tianjia" id="line3"/>
    </label></td>
  </tr>
</table>
</s:form>
</body>
</html>
