<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*,com.OnlineGridShop.scattered.Entity.GridType,com.OnlineGridShop.scattered.Entity.ScatteredGridRendtypeMake" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<html >
<head>
	<title></title>
	<script src="${pageContext.request.contextPath}/Brand/js/jquery-1.6.4.min.js" type="text/javascript"></script>
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
<script type="text/javascript">
	  	var beforevalue = null;
	  	function infokeyup(){
	  		var goodsinfo = $("#text").attr("value");
	  		if(goodsinfo.length >200){
	  			$("#text").val(beforevalue);
	  			$("#wordcount").attr("class","text_red");
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
	  	function onload(){
	  		beforevalue = $("#text").attr("value");
	  		$("#wordcount").html(beforevalue.length + "/200字");
	  	}
	  	
	  	function  line3(){
	  		var brandgrid_infocote_id = $("#brandgrid_infocote_id").val(); 
			var text = $("#text").val();
			$("#iframe",window.parent.parent.parent.document.body).attr("src","updata_brandowner.do?brandgrid_infocote_id=" + brandgrid_infocote_id + "&text=" + text);
		 	$(window.parent.document).find("#floatBox .title span").trigger('click');	 
			return true;
	  	}
	</script>
</head>
<body onload="onload();">
    <div style="text-align: center;">
    	<div style="margin-top: 10px;margin-left: 10px;">
<table width="430px;">
  <tr>
    <td id="line1">修改公告信息:</td>
  </tr>
  <tr>
    <td width="100%">
	<label>
	<input type="hidden" value="<s:property value="brandgrid_infocote_id"/>" id="brandgrid_infocote_id"/>
      <textarea name="brandgridInfocote.brandgrid_infocote" id="text" onkeyup="infokeyup();" style="width:100%;height: 200px;"><s:property value="brandgridInfocote.brandgrid_infocote"/></textarea>
    </label></td>
  </tr>
  <tr>
    <td style="text-align: right;">
     	<span id="wordcount">0/200字</span>
    </td>
  </tr>
  
  <tr>
    <td><label>
      <input type="submit" name="Submit2" value="发布" class="tianjia" id="line3" onclick="line3();"/>
      <input type="reset" value="重置" class="tianjia"/>
    </label></td>
  </tr>
</table>
    	</div>
	</div>
</body>
</html>