<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html> 
<head> 
<meta name=vs_targetSchema content="http://schemas.microsoft.com/intellisense/ie5"> 
<title>销售记录打印</title>  
<script src="${pageContext.request.contextPath}/Brand/js/jquery-1.6.4.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/Brand/Daterangepicker/js/daterangepicker.jQuery.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/Brand/Daterangepicker/js/jquery-ui-1.7.1.custom.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/Brand/js/jquery.PrintArea.js" type="text/javascript"></script>
<link href="${pageContext.request.contextPath}/Brand/Daterangepicker/css/ui.daterangepicker.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/Brand/Daterangepicker/css/redmond/jquery-ui-1.7.1.custom.css" rel="stylesheet" type="text/css" />
<!--media=print 这个属性可以在打印时有效--> 
<style media=print> 
.Noprint{display:none;} 
.PageNext{page-break-after: always;} 
</style> 

<style> 
.tdp 
{ 
    border-bottom: 1 solid #000000; 
    border-left: ? solid #000000; 
    border-right: ? solid #ffffff; 
    border-top: 0 solid #ffffff; 
} 
.tabp 
{ 
    border-color: #000000 #000000 #000000 #000000; 
    border-style: solid; 
    border-top-width: 2px; 
    border-right-width: 2px; 
    border-bottom-width: 1px; 
    border-left-width: 1px; 
} 
.NOPRINT { 
font-family: "宋体"; 
font-size: 9pt; 
} 

</style>
<style type="text/css">
<!--
.sumbit{
background-color:#d8be98;
	border:dashed 1px #d8be98;
}
#rangeB {
    font-size: 10px;
}
.d_top{
margin-top: 10px;
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
.show{
width: 1000px;
}
#td1 {
    text-align: center;
    font-size: 20px;
}
-->
</style> 
<script type="text/javascript">
 $(function(){    
 		$('#rangeB').daterangepicker({arrows:true});
 		if (!$.browser.mozilla) {// ie6,7,8,opera,chrome管用
		     $("#ie_print").show();
		     $("#huohu_pirnt").hide();
		 } else {// firefox管用
		     $("#ie_print").hide();
		     $("#huohu_pirnt").show();     
		 }          
		$('#queding').click(function(){
			 var t = $('#rangeB').val();
			 var gz = $('#grid_num').val();
			 if(t=="点击选择筛选时间"){
			 	t = "";
			 }
			 if(gz=="0"){
			 	gz = "";
			 }
			 if(t=="" || gz==""){
			 	alert("请正确选择筛选条件");	
			 	return false;		 
			 }else{
			 	top.location.href = "for_daying.do?brandgrid_Grid_id="+gz+"&time="+t;	
			 }
		});
		$('#daying').click(function(){
			$(".show").each(function(){
				$(this).printArea();
			})
		});
})

</script>
</head> 

<body style=" background-color:#FFF5E1;"> 
<div><jsp:include page="../header.htm"/></div>
<div>
<center class="Noprint" >
<div style="width: 1000px;"> 
		<div id="td1" class="d_top" style="width: 100%;">销售记录打印</div>
		<div class="d_top" >
			<div style="float:left; width:35%;">
			 请选择格子：
			 <s:action name="getAllNum_l_brandowner" executeResult="false"></s:action>
			<s:select list="#request.brandgridGrid_l" listValue="brandgrid_grid_number" name="brandgrid_Grid_id" listKey="brandgrid_grid_id" id="grid_num"/>
			</div>
			<div style="float:left;width:35%;">
			 <input type="text" value="" id="rangeB" class="sou" name="time_be" onFocus="if (value =='点击选择筛选时间'){value =''}" onBlur="if (value ==''){value='点击选择筛选时间'}" readonly="readonly"/>
			</div>
			<div style="float:left;width:30%;">
			<input type="submit" id="queding" value="查询" class="sumbit"/>
			</div>
		</div>
	</div>
	<br/>
	<br/>
	<s:if test="listMap == null || listMap.size()==0">
	<br/>
		<table cellspacing="0" width="100%;">
			<tr>
		  <td colspan="6" align="center">没有销售记录</td>
		  </tr>
		</table>
		</s:if>
		<s:else>
<br/>

<div id="ie_print">
  <p> 
  <OBJECT  id=WebBrowser  classid=CLSID:8856F961-340A-11D0-A96B-00C04FD705A2  height=0  width=0> 
  </OBJECT>  
  <input  type=button  value="页面设置"  onclick='document.all.WebBrowser.ExecWB(8,1)'/> 
  <input  type=button  value="打印预览"  onclick='document.all.WebBrowser.ExecWB(7,1)'/>
</p>      
    <br>
 </div>
 <div id="huohu_pirnt">
 <p>
 <input  type=button  value="打印" id="daying"/> 
 </p>
 </div> 
    <hr width="95%"/>   
    </s:else>
</center> 
<s:if test="listMap != null && listMap.size()>0">
<s:iterator value="listMap" id="column" status="TTT">    
     <s:set name="allno" value="2 * (#column.key-1)"/> 
<table cellspacing="0" width="100%;" class="show" align="center">
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
 <s:if test="#TTT.last">
 
 </s:if>
 <s:else>
 <div class="PageNext"></div><!--打印范围控制-->
 </s:else>
 <br/>
 </s:iterator>
</s:if>
<hr width="95%"/> 
</div>

<div><jsp:include page="../bottom.jsp"/></div>
</body> 
</html>