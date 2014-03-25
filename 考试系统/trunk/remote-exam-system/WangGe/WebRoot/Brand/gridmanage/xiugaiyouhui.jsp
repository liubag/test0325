<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
<script src="${pageContext.request.contextPath}/Brand/js/jquery-1.3.1.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/Brand/js/xiugaiyouhui.js" type="text/javascript"></script>
<link href="${pageContext.request.contextPath}/Brand/css/fabutongshishenqingshangjia.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">

</script>
</head>

<body onload="onload();">

<s:form id="form1" method="post" action="addPreferen_gridowner">
<input name="brandgrid_preferential_id" type="hidden" id="brandgrid_preferential_id" value="<s:property value="brandgridPreferential.brandgrid_preferential_id"/>"/>
<table cellspacing="0" cellpadding="0">
  <tr>
    <td>发布优惠信息（限200个字）:
  </tr>
  <tr>
    <td>
    <textarea name="text" cols="" rows="4" id="text" onkeyup="infokeyup();" ><s:property value="brandgridPreferential.brandgrid_preferential"/></textarea>
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
					<option value="0.95">0.95</option>
				    <option value="0.9">0.9</option>
					<option value="0.85">0.85</option>
					<option value="0.8">0.8</option>
					<option value="0.75">0.75</option>
				    <option value="0.7">0.7</option>
					<option value="0.65">0.65</option>
					<option value="0.6">0.6</option>
					<option value="0.55">0.55</option>
				    <option value="0.5">0.5</option>
					<option value="0.45">0.45</option>
					<option value="0.4">0.4</option>
					<option value="0.35">0.35</option>
				    <option value="0.3">0.3</option>
					<option value="0.25">0.25</option>
					<option value="0.2">0.2</option>
					<option value="0.15">0.15</option>
				    <option value="0.1">0.1</option>
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
						<option value="1">选项1</option>
						<option value="2">选项2</option>
						<option value="3">选项3</option>
						<option value="4">选项4</option>
						<option value="5">选项5</option>
						<option value="6">选项6</option>
						<option value="7">选项7</option>
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
					<option value="0.95">0.95</option>
				    <option value="0.9">0.9</option>
					<option value="0.85">0.85</option>
					<option value="0.8">0.8</option>
					<option value="0.75">0.75</option>
				    <option value="0.7">0.7</option>
					<option value="0.65">0.65</option>
					<option value="0.6">0.6</option>
					<option value="0.55">0.55</option>
				    <option value="0.5">0.5</option>
					<option value="0.45">0.45</option>
					<option value="0.4">0.4</option>
					<option value="0.35">0.35</option>
				    <option value="0.3">0.3</option>
					<option value="0.25">0.25</option>
					<option value="0.2">0.2</option>
					<option value="0.15">0.15</option>
				    <option value="0.1">0.1</option>
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
      <input type="submit" name="Submit" value="提交并同时申请上架" class="anniu" onclick="return line3();" />
   	  <input type="submit" name="" id="reset1" value="重置" class="anniu" />
    </label></td>
  </tr>
</table>
</s:form>

</body>
</html>
