<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
<script src="${pageContext.request.contextPath}/Brand/js/jquery-1.3.1.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/Brand/js/fabutongshishenqingshangjia.js" type="text/javascript"></script>
<link href="${pageContext.request.contextPath}/Brand/css/fabutongshishenqingshangjia.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">

</script>
</head>

<body onload="onload();">
<s:form id="form1" method="post" action="addPreferen_gridowner">
<table cellspacing="0" cellpadding="0">
  <tr>
    <td>发布优惠信息（限200个字）:
  </tr>
  <tr>
    <td>
    <input type="hidden" name="brandgrid_preferential_id" value=""/>
    <s:textarea name="text" cols="" rows="4" id="text" onkeyup="infokeyup();"/>
    </td>
  </tr>
    <tr>
    <td style="text-align: right;">
     	<span id="wordcount">0/200字</span>
    </td>
  </tr>
  <tr>
    <td style="text-align: left;">
     	&nbsp;
    </td>
  	</tr>
   <tr>
    <td style="text-align: left;">
     	全场折扣优惠：<input type="checkbox" value="1" name="qczk" id="qczk"/>制定折扣优惠：<input type="checkbox" value="1" name="zdzk" id="zdzk"/>
    </td>
  	</tr>
  	<tr>
    <td style="text-align: left;">
     	&nbsp;
    </td>
  	</tr>
  	<tr>
    <td style="text-align: center;">
    <div id="quanczk" style="display:none;">
    <div>
   				全场 折扣优惠: 
				<select name="quanczk">
					<option value="9.5">9.5</option>
				    <option value="9">9</option>
					<option value="8.5">8.5</option>
					<option value="8">8</option>
					<option value="7.5">7.5</option>
				    <option value="7">7</option>
					<option value="6.5">6.5</option>
					<option value="6">6</option>
					<option value="5.5">5.5</option>
				    <option value="5">5</option>
					<option value="4.5">4.5</option>
					<option value="4">4</option>
					<option value="3.5">3.5</option>
				    <option value="3">3</option>
					<option value="2.5">2.5</option>
					<option value="2">2</option>
					<option value="1.5">1.5</option>
				    <option value="1">1</option>
					<option value="0">0</option>
				 </select>
		 </div>
    </div>
    <div id="zdyh" style="display:none;">
    <div>
    	<s:textarea name="zkxinxi" cols="" rows="5" id="zkxinxi" readonly="true"/>
    </div>
    <div style="width: 100%;text-align: right;"><span id="wordcount2">0/1700字</span></div>
     	<div style="margin-top: 10px;">
			<div style=" float:left;">
			<select multiple="multiple" id="select1" style="width:180px;height:230px;">
						<s:iterator value="brandgridGoods_l" status="st">
						<option value="<s:property value="brandgrid_goods_id"/>"><s:property value="goods_name"/></option>
						</s:iterator>
					</select>
			
			</div>
			<div style=" float:left;width:430px;">
				<div style="height:100px; text-align: center;">
					<a id="hf">指定恢复</a>
				</div>
				<div>
				<div style="float:left; width:70px; text-align:left;">&nbsp; <a id="zd">制定折扣</a></div>
				<div style="float:left;width:170px; text-align:center;"><input type="text" value="" id="goodunm" readonly="readonly"/></div>
				<div style="float:left;width:120px; text-align:center;">
				折扣: 
				<select id="zk">
					<option value="9.5">9.5</option>
				    <option value="9">9</option>
					<option value="8.5">8.5</option>
					<option value="8">8</option>
					<option value="7.5">7.5</option>
				    <option value="7">7</option>
					<option value="6.5">6.5</option>
					<option value="6">6</option>
					<option value="5.5">5.5</option>
				    <option value="5">5</option>
					<option value="4.5">4.5</option>
					<option value="4">4</option>
					<option value="3.5">3.5</option>
				    <option value="3">3</option>
					<option value="2.5">2.5</option>
					<option value="2">2</option>
					<option value="1.5">1.5</option>
				    <option value="1">1</option>
					<option value="0">0</option>
				 </select>
				 </div>
				<div style="float:left;width:70px; text-align:right;">&nbsp; <a id="qd">确定折扣</a></div>
				</div>
				<div style="width:100%; text-align:center; margin-top:20px;">
					&nbsp;
				</div>
			</div>
			<div style=" float:left;">
			  		<select multiple="multiple" id="select2" style="width: 180px;height:230px;">
						
					</select>
			</div>
			</div>
			</div>
    </td>
  	</tr>
  	<tr>
    <td style="text-align: left;">
     	&nbsp;
    </td>
  	</tr>
  <tr>
    <td class="td3"><label>
    	<input type="hidden" id="zkgoods_id" name="zkgoods_id" value=""/>
      <input type="submit" id="Submit" value="提交并同时申请上架" class="anniu" onclick="return line3();" />
   	  <input type="submit" name="" id="reset1" value="重置" class="anniu" />
    </label></td>
  </tr>
</table>
</s:form>

</body>
</html>
