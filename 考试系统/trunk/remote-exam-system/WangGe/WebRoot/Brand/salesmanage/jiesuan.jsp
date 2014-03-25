<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>结算</title>
<script src="${pageContext.request.contextPath}/Brand/js/jquery-1.6.4.min.js" type="text/javascript" ></script>
<script src="${pageContext.request.contextPath}/Brand/js/jquery.corner.js" type="text/javascript"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/Brand/js/jiesuan.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#img1").corner("15px");
});
</script>
<link href="${pageContext.request.contextPath}/Brand/css/jiesuan.css" rel="stylesheet" type="text/css" />
</head>

<body>
<form autocomplete="off" enctype="multipart/form-data">
<table cellspacing="0" cellpadding="0" id="chushou">
  <tr>
    <td rowspan="5">
    <div id="img1">
    <img id="show" src="${pageContext.request.contextPath}/Brand/pic/gezi1.jpg" width="136" height="113" />
    <img id="goodspic" src="${pageContext.request.contextPath}<s:text name="brandimgPath" />/" width="136" height="113" style="display:none;"/>
    <span id="fail" style="display:none;">
    	超时...<br/>
    <a id="shuaxin" href="">点击重新查询</a>
    </span>
    </div>
    </td>
    <td class="td1">出售商品：</td>
    <td>
    <input type="text" name="text1" id="text1" class="text"/>
    <div class="yes1">-</div>    
    <input type="text" name="text2" id="text2" class="text"/>
    <div id="yes1" class="no"></div>
    </td>
  </tr>
  <tr>
    <td class="td1">价格：</td>
    <td>
      <input type="text" name="text3" id="text3" style="display:none;"/>
	  <div id="yes3"></div>
	</td>
  </tr>
  <tr>
    <td class="td1">数量：</td>
    <td>
    <select name="select" id="select1" style="display:none;">
    </select>
    <SPAN id="qh" style="color: red;display:none;">缺货！</SPAN>
    </td>
  </tr>
  <tr>
    <td class="td1">折扣：</td>
    <td>
      <input type="text" name="text4" id="text4" style="display:none;"/>
	  <div id="yes4"></div>
	</td>
  </tr>
  <tr class="buttn1" style="display:none;">
	<td class="td1">
    <input name="" type="reset" value="重置" id="cz" class="sumbit"/>
    </td>
    <td class="td1">
    <input name="" type="button" class="sumbit" value="添加(Enter)" id="tianjia"/>
    </td>
  </tr>
</table>
</form>

<table  cellspacing="0" width="100%;" id="sure" style="display:none;">
  <tr>
    <td colspan="3" align="center" bgcolor="#FF8040">确定结算</td>
  </tr>
  <tr>
    <td width="50%" align="right">一共<span id="goods_how"></span>件商品</td>
    <td width="15%" align="left">&nbsp;</td>
    <td rowspan="3" width="35%">找零：<span id="zl"></span></td>
  </tr>
  <tr>
    <td align="right">应收<span id="how"></span>元整</td>
    <td align="left">&nbsp;</td>
  </tr>
  <tr>
    <td align="right" style="padding-left: 300px;">
     <span id="shi">实收：</span>
    <input name="text" type="text" id="shishou" size="5"/><div id="yes5"></div></td>
    
    <td align="left">&nbsp;</td>
  </tr>
  <tr>
  	<td align="center"></td>
  	<td align="center"><input type="button" class="sumbit" id="quxiao" value="取消" /></td>
    <td align="center"><input type="button" class="sumbit" id="makesure" value="确定结算(Enter)" /></td>
  </tr>
</table>
<div id="myDialog" style="display:none;text-align:center;">  
			<div style="margin-bottom: 10px;" id="waiting">结算需要一定时间，请等候...</div>
			<div>  
				<img alt="" src="../pic/empty_180_180.gif"/> 
			</div>   
	</div> 
<table id="tb" cellspacing="0" cellpadding="0">
  <tr>
    <td colspan="4">出售列表：</td>
  </tr>
  <tr>
    <td class="td2">商品编号</td>
    <td class="td2">名称</td>
    <td class="td2">当前价格*数量*折扣=总价</td>
    <td class="td2">操作</td>
  </tr>
  <tr id="tr1">
    <td class="td3">&nbsp;</td>
    <td class="td3">&nbsp;</td>
    <td class="td3">总价：<span id="text5"></span>元(RNB)</td>
    <td class="td3">
    <input type="submit" name="button2" id="jiesuan" value="结算(Ctrl+Enter)" class="sumbit"/>
    </td>
  </tr>
</table>

</body>
</html>
