<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="${pageContext.request.contextPath}/ScatteredGrid/css/style.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/ScatteredGrid/css/css.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/ScatteredGrid/js/jquery-1.5.1.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/ScatteredGrid/js/manageupdategoodspage.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/ScatteredGrid/js/random2.js" type="text/javascript"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/kindeditor/kindeditor-min.js" charset="UTF-8"></script>
<script type="text/javascript">
		KE.show({
			 id : "editor",
		     width : "800px",
		     height : "200px",		    
		     resizeMode : 1,
		     allowFileManager : true,
		     /*图片上传的SERVLET路径*/
		     imageUploadJson : "${pageContext.request.contextPath}/uploadImage.html", 
		     /*图片管理的SERVLET路径*/     
		     fileManagerJson : "${pageContext.request.contextPath}/uploadImgManager.html",
		     /*允许上传的附件类型*/
		     accessoryTypes : "doc|xls|pdf|txt|ppt|rar|zip",
		     /*附件上传的SERVLET路径*/
		     accessoryUploadJson : "${pageContext.request.contextPath}/uploadAccessory.html"
		    	
		});
		
	
	</script>
</head>


<body onload="randomPic(120,25);">
  	
	 <s:form action="uploadGoods" method="post"
			enctype="multipart/form-data" theme="simple" autocomplete="off">
			
		<div class="int"> 
		 <input type="hidden" name="scatteredGridGoods.goods_id" id="goods_id2" value="<s:property value="scatteredGridGoods.goods_id"/>"/>
		<label for="goodsname"> 商品名称(<span id="namewordcount">0/20字</span>)：</label> 
		<input type="text" name="scatteredGridGoods.goods_name" id="goodsname" class="required" size="50" onkeyup="goodsnamekeyup();" ondragenter="return false" value="<s:property value="scatteredGridGoods.goods_name"/>" /> 
		</div>
		<div class="int">
		<label for="hasamount"> 数量(数字)：</label>
		<input type="text" name="scatteredGridGoods.goods_hasamount" id="hasamount" class="required" onkeyup="this.value=this.value.replace(/\D/g,'')" ondragenter="return false" style="ime-mode:Disabled"  value="<s:property value="scatteredGridGoods.goods_hasamount"/>"/>
		</div>
		<input type="hidden" value="<s:property value="scatteredGridGoods.residual_mount"/>" id="residual_mount2"/>
			
			<input type="hidden" name="marker2" value="yes"/>
			<div class="int">
			<label for="residual_mount"> 剩余数量(数字)：</label>
			<input type="hidden" value="<s:property value="scatteredGridGoods.goods_hasamount"/>" id="goods_hasamount2"/>
			<input type="text" id="residual_mount" name="scatteredGridGoods.residual_mount" ondragenter="return false" style="ime-mode:Disabled"  value="<s:property value="scatteredGridGoods.residual_mount"/>" readonly="readonly" style= "border-style:none;color:blue;"/>
			</div>

		<div class="int">
		<label for="price"> 当前价：</label>
		<div>￥<input type="text" name="price" id="price" class="required" onkeyup="this.value=this.value.replace(/\D/g,'')" ondragenter="return false" style="ime-mode:Disabled" size="5" value="<s:property value="price"/>"/>．<input type="text" name="decimal_price" id="decimal_price" class="required" onkeyup="this.value=this.value.replace(/\D/g,'')" ondragenter="return false" style="ime-mode:Disabled" size="5" value="<s:property value="decimal_price"/>"/></div>
		</div>
		<div class="int">
		<label for="marketprice"> 市场价：</label>
		<div>￥<input type="text" name="market_price" id="market_price" class="required" onkeyup="this.value=this.value.replace(/\D/g,'')" ondragenter="return false" style="ime-mode:Disabled" size="5" value="<s:property value="market_price"/>"/>．<input type="text" name="decimal_market_price" id="decimal_market_price" class="required" onkeyup="this.value=this.value.replace(/\D/g,'')" ondragenter="return false" style="ime-mode:Disabled" size="5" value="<s:property value="decimal_market_price"/>"/></div>
		
		</div>
		<div class="int">
			<label for="">单位：</label>
			<select name="scatteredGridGoods.unit">
	        <option value="件">件</option>
			<option value="对">对</option>
			<option value="个">个</option>
			<option value="袋">袋</option>
			<option value="片">片</option>
			<option value="盒">盒</option>
	        </select>
		</div>
		<div class="int">
			<s:action name="showAllGoodsType" executeResult="false"></s:action>
			<label for="">类型：</label>
			<s:select list="#request.goodstype_l" listValue="type_name" name="scatteredGridGoods.goods_type_id" listKey="id" id="type_name" headerKey="0" headerValue="--请选择类型--"/>
		</div>
		修改图片<input type="checkbox" value="1" name="xgtu" id="xgtu"/>
		<div id="tp" style="display:none;">
		<div class="int">
			<label for="file11">图片1：</label>
			<input type="file" name="file" id="file11" class="" style="ime-mode:Disabled"/><strong class="high"> *</strong>
		</div>
		<div class="int">
			<label for="file12">图片2：</label>
			<input type="file" name="file" id="file12" class="" style="ime-mode:Disabled"/><strong class="high"> *</strong>
		</div>
		<div class="int">
			<label for="file13">图片3：</label>
			<input type="file" name="file" id="file13" class="" style="ime-mode:Disabled"/><strong class="high"> *</strong>
		</div>
		</div>
		修改详情<input type="checkbox" value="1" name="xgxq" id="xgxq"/>
		<div id="xq" style="display:none;">
		<div class="">
			<label for="goodsinfo">详细介绍:</label>
			<textarea id="editor" name="scatteredGridGoods.goods_info" rows="" cols="" style="width: 400px; height: 200px; visibility: hidden;">
		 			<s:property value="scatteredGridGoods.goods_info"/>
		 		</textarea>
		</div>
		</div>
		
		<div class="int">
			<label for="rand">验证码：</label>
			<input type="text" id="randomNum"/><img id="img1"/>
			<a href="#" onclick="randomPic(120,25);">看不清</a>
		</div>
		<div class="sub">
			<input type="submit" value="确定上传" id="send"/><input type="reset" id="res"/>
		</div>
	</s:form>
</body>
</html>