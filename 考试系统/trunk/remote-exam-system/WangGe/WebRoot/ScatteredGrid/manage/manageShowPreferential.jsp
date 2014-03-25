<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>优惠信息</title>
<style type="text/css">
	table		{ border:0;border-collapse:collapse;width: 100%}
	td	{ font:normal 12px/17px Arial;padding:2px;}
	th			{ font:bold 12px/17px Arial;text-align:left;padding:4px;border-bottom:1px	solid #333;}
	.even		{ background:#FFF38F;}  /* 偶数行样式*/
	.odd		{ background:#FFFFEE;} /* 奇数行样式*/
	.selected	{ background:#FF6500;color:#fff;}
	
</style>
<link href="${pageContext.request.contextPath}/ScatteredGrid/css/style.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/ScatteredGrid/css/css.css" rel="stylesheet" type="text/css" />

<script src="${pageContext.request.contextPath}/ScatteredGrid/js/jquery-1.5.1.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/ScatteredGrid/js/manageshowpreferentionpage.js" type="text/javascript"></script>
</head>

<body onload="refreshSize();">
  	<%
		Integer page01 = (Integer)request.getAttribute("page");
		Integer hasPages = (Integer)request.getAttribute("hasPages");
	 %>
	<script type="text/javascript">
		var page = <%=page01 %>;
		var hasPages = <%=hasPages%>;
	  	//插件编写
	;(function($) {
		$.fn.extend({
			"alterBgColor":function(options){
				//设置默认值
				options=$.extend({
					odd:"odd",	/* 偶数行样式*/
					even:"even", /* 奇数行样式*/
					selected:"selected" /* 选中行样式*/ 
				},options);
				$("tbody>tr:odd",this).addClass(options.odd);
				$("tbody>tr:even",this).addClass(options.even);
				$('tbody>tr',this).click(function() {
					//判断当前是否选中
					var hasSelected=$(this).hasClass(options.selected);
					//如果选中，则移出selected类，否则就加上selected类
					$(this)[hasSelected?"removeClass":"addClass"](options.selected)
						//查找内部的checkbox,设置对应的属性。
						.find(':checkbox').attr('checked',!hasSelected);
				});
				// 如果单选框默认情况下是选择的，则高色.
				$('tbody>tr:has(:checked)',this).addClass(options.selected);
				return this;  //返回this，使方法可链。
			}
		});
	})(jQuery);

	//插件应用
	$(function(){
		$("#table2")
				.alterBgColor()  //应用插件
				.find("th").css("color","red");//可以链式操作
	})
	  
	</script>
	<div>今天还有<span id="lz_note" style="color:#FF0000;"><s:property value="lz"/></span>次置顶机会</div>
	<table id="table2">
		<thead>
			<tr><th>置顶时间</th><th>发布时间</th><th>优惠信息</th><th>最近使用时间</th><th>最近下架时间</th><th>状态</th><th style="text-align: center;">使用</th><th>删除</th></tr>
		</thead>
		<tbody>
			
		  	<s:iterator value="scatteredGridPreferential_l" status="st">
		  		<tr>
		  		<td style="text-align: center;"><s:property value="LZ_datetime.toLocaleString()" /></td>
		  		<td style="text-align: center;"><s:property value="Do_time" /></td>
		  		<td ><s:property value="preferential_text" /></td>
		  		<td style="text-align: center;"><s:property value="used_time" /></td>
		  		<td style="text-align: center;"><s:property value="down_time" /></td>
		  		<s:if test="status==1">
			  		<td style="text-align: center;">当前优惠信息</td>
			  		<td style="text-align: center;">
			  		<s:url id="url" action="undercarriagePreferential_user">
					    <s:param name="id"><s:property value="id" /></s:param>
					</s:url>
				  	<s:a href="%{url}">下架</s:a>
				  	<br/>
				  	<s:if test="lz>0">
			  		<s:url id="url" action="zhiding_user">
					    <s:param name="id"><s:property value="id" /></s:param>
					</s:url>
				  	<s:a href="%{url}">置顶</s:a>
				  	</s:if>
			  		</td>
			  		<td style="text-align: center;">
			  			----
			  		</td>
			  	</s:if>
			  	<s:elseif test="status==0">
			  		<td style="text-align: center;">未上架</td>	
			  		<td style="text-align: center;">
			  		<s:if test="lz>0">
			  		<s:url id="url" action="updateUseOld">
				        <s:param name="id"><s:property value="id"/></s:param>
					</s:url>
			  		<s:a href="%{url}">设为当前优惠<br/>并置顶</s:a>
			  		</s:if>
			  		<s:else>
			  			----
			  		</s:else>
			  		</td>
			  		<td style="text-align: center;">
			  		<s:url id="url" action="delePreferential_user">
				        <s:param name="id"><s:property value="id"/></s:param>
					</s:url>
			  		<s:a href="%{url}">删除</s:a>
			  		</td>
			  	</s:elseif>
			  	<s:else>
			  		<td style="text-align: center;">违规！强制下架</td>
			  		<td style="text-align: center;">
			  		-----
			  		</td>
			  		<td style="text-align: center;">
			  		-----
			  		</td>
			  	</s:else>
		  		</tr>	
		  	</s:iterator>
			</tbody>	
		</table>
		
		<table width="680" border="0" cellspacing="10" cellpadding="10">
			<tr>
			<td align="center"><s:property value="page"/>/<s:property value="hasPages"/></td>
			<td align="center">
				<s:url id="url" action="showAllPreferential_user">
			        <s:param name="page">1</s:param>
				</s:url>
				<s:a href="%{url}" onclick="return justNextPage();">第一页</s:a>
			</td>
			<td align="center">
				<s:url id="url" action="showAllPreferential_user">
			        <s:param name="page"><s:property value="page-1"/></s:param>
				</s:url>
				<s:a href="%{url}" onclick="return justNextPage();">上一页</s:a>
			</td>
			<td align="center">
				<s:url id="url" action="showAllPreferential_user">
			        <s:param name="page"><s:property value="page+1"/></s:param>
				</s:url>
				<s:a href="%{url}" onclick="return justUpPage();">下一页</s:a>
			</td>
			<td align="center">
				<s:url id="url" action="showAllPreferential_user">
			        <s:param name="page"><s:property value="hasPages"/></s:param>
				</s:url>
				<s:a href="%{url}" onclick="return justUpPage();">最后一页</s:a>
			</td>
			<td align="center">
			<s:url id="url" action="showAllPreferential_user">
			</s:url>
			跳转<s:select list="page_l" name="page" onchange="test(this);"/>
			</td>
			<td align="center">
			共有<s:property value="hasPreferentials"/>条记录
			</td>
			</tr>
		</table>
		
		<s:property value="tip"/><br/><br/>
		<s:if test="isSendPrefereToday==0">
			<s:form method="post" action="savePreferential">
				<h3>添加优惠信息(注：一天最多只能发一条优惠信息。)</h3><br/>
				<div>
				<label for="preferential_text">优惠信息：</label><br/>
				</div>
				<div class="int">
				<s:textarea name="sgp.preferential_text" cols="50" rows="5" value="" id="preferential_text" onkeyup="preferentialtextkeyup();"/>
				</div>
				<div class="int">
				<label for="preferential_text"></label><br/>
				<span id="wordcount">0/100字</span>
				</div>
				<div>
					<s:checkboxlist name="remandDo" list="#{'1':'设置为最新优惠信息'}" value="{'1'}"/><br/>
				</div>
				
				<input type="submit" value="确定添加 " id="send"/><input type="reset" id="res"/>
			</s:form>	  		
		</s:if>
		<s:else>
			今天已经发布了最新优惠信息！	  			
		</s:else>
</body>
</html>