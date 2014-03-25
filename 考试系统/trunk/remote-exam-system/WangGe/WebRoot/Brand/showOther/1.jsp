<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title></title>
<script src="${pageContext.request.contextPath}/Brand/js/jquery-1.6.4.min.js" type="text/javascript"></script>
<!--media=print 这个属性可以在打印时有效--> 
<style media=print> 
.Noprint{display:none;} 
.PageNext{page-break-after: always;} 
</style> 
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
#content{
 width:960px;
}
.sumbit{
background-color:#d8be98;
	border:dashed 1px #d8be98;
}

.td3, .td4 {
    background-color: #EFE9D8;
    border-bottom: 2px solid #FFF3D2;
    border-top: 2px solid #FFF3D2;
    height: 25px;
    vertical-align: middle;
}
.td5 {
    border-top: 2px dashed #D8CFB8;
    height: 1px;
    text-align: center;
}
#td6 {
	padding-right:100px;
    text-align: right;
}
td {
    font-size: 14px;
    padding-top: 2px;
    text-align: center;
}
.td2 {
    border-bottom: 2px dashed #D8CFB8;
    font-size: 16px;
    height: 30px;
}
.NOPRINT { 
font-family: "宋体"; 
font-size: 9pt; 
width: 100%;
} 
-->
</style>

</head>

<body>
<div id="content">
<s:if test="listMap.size()==0">
<table cellspacing="0" width="100%;">
	<tr>
  <td colspan="6" align="center">没有销售记录</td>
  </tr>
</table>
</s:if>
<s:else>
<center class="Noprint" > 
  <p> 
  <OBJECT  id=WebBrowser  classid=CLSID:8856F961-340A-11D0-A96B-00C04FD705A2  height=0  width=0> 
  </OBJECT> 
  <input  type=button  value=打印          onclick=document.all.WebBrowser.ExecWB(6,1)> 
  <input  type=button  value=直接打印  onclick=document.all.WebBrowser.ExecWB(6,6)> 
  <input  type=button  value=页面设置  onclick=document.all.WebBrowser.ExecWB(8,1)> 
</p> 
  <p>    <input  type=button  value=打印预览  onclick=document.all.WebBrowser.ExecWB(7,1)> 
    <br> 
    </p> 
  <hr align="center" width="90%" size="1" noshade> 
</center> 
 <s:iterator value="listMap" id="column" status="TTT">    
     <s:set name="allno" value="2 * (#column.key-1)"/> 
<table cellspacing="0" width="100%;" class="show">
  <tr>
  <td colspan="7" align="center"><s:property value="brand_name"/>品牌店</td>
  </tr>
  <tr>
  <td colspan="7" align="center">
  	第<s:property value="#column.key"/>页&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  	共<s:property value="listMap.size"/>页&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  	格子：<s:property value="grid_no"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  	<s:property value="time"/>时间段销售记录
    <hr/>
    </td>
  </tr>
  <tr>
  	<td width="4%" class="td2">编号</td>
  	<td width="8%" class="td2">操作类型</td>
    <td width="15%" class="td2">商品编号</td>
    <td width="25%" class="td2">商品名称</td>
    <td width="8%" class="td2">操作数量</td>
    <td width="15%" class="td2">出售时间</td>
    <td width="25%" class="td2">数量*单价*折扣</td>
  </tr>   
     <s:iterator value="#column.value" status="s">
     <s:set name="allno" value="#allno+1"/>  
      <tr>    
        <td class="td3">${allno}</td>  
        <td class="td3">
    		售出
   		 </td>
    	<td class="td3"><s:property value="brandgridGridOwner.brandgridGrid.addgoods_no"/>-<s:property value="brandgridGoods.goods_no"/></td>
    	<td class="td3"><s:property value="do_name"/></td>
    	<td class="td4"><s:property value="do_amount"/></td>
    	<td class="td3">
    	<s:property value="do_time.toLocaleString()"/>
    	</td>
	    <td class="td3">
	    <s:property value="do_amount"/> * <s:property value="do_privce"/> * <s:property value="discount"/>= <s:property value="total_price"/>
	    </td>    
      </tr>    
     </s:iterator>    
  
  <tr>
      <td class="td5">&nbsp;</td>
      <td class="td5">&nbsp;</td>
    <td class="td5">&nbsp;</td>
    <td class="td5">&nbsp;</td>
    <td class="td5">&nbsp;</td>
    <td class="td5">&nbsp;</td>
    </tr>
<s:if test="#TTT.last">
  <tr>
  <td colspan="7" id="td6">销售总额：<s:property value="total_price"/>元</td>
  </tr>
</s:if>
  <tr>
  <td colspan="7" align="center">来自：Copyright ©2012 网格 </td>
  </tr>
 </table>
 <p></p>
 <div class="PageNext"></div><!--打印范围控制--> 
 </s:iterator>
</s:else>
</div>
<script type="text/javascript"><!--
 $(function(){
	 var height = $(document).height();
	$("#jilu2",parent.document.body).height(height + 50); 
 	///var heigth = 150 + $(".show").length * 200;
	//$("#jilu2",parent.document.body).height(heigth);
})
</script>
</body>
</html>
