<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>上传同时申请上架</title>
<script src="${pageContext.request.contextPath}/Brand/js/jquery-1.6.4.min.js" type="text/javascript"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/kindeditor/kindeditor-min.js" charset="UTF-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/Brand/js/goodsUpload.js"></script>
<script src="${pageContext.request.contextPath}/Brand/js/random2.js" type="text/javascript"></script>
<script type="text/javascript">
		KE.show({
			 id : "editor",
		     width : "670px",
		     height : "300px",		    
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
	<STYLE type="text/css">
	.text_red{
	color: red;
	}
	
	.text_black{
		color: black;
	}
		
	</STYLE>
<link href="${pageContext.request.contextPath}/Brand/css/goodsUpload.css" rel="stylesheet" type="text/css" />
</head>

<body onload="randomPic(120,25);">
<s:form id="form1" action="uploadOrUploadGoods_gridowner" method="post" autocomplete="off" enctype="multipart/form-data" theme="simple">
  <input type="hidden" name="brandgridGoods.brandgrid_goods_id" value=""/>
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="td5">商品名称（<span id="namewordcount">0/20</span>）&nbsp;：</td>
      <td class="td6"><label>
        <input type="text" name="brandgridGoods.goods_name" id="shangpin" class="required input1" onkeyup="goodsnamekeyup();"/>
        </label>     
       </td>
    </tr>
    <tr>
      <td class="td5">数量（数字）&nbsp;：</td>
      <td class="td6"><label>
        <input type="text" name="brandgridGoods.goods_hasamount" id="shuliang" class="required input1" />
        </label>      </td>
    </tr>
    <tr>
      <td class="td5">当前价（RMB）&nbsp;：</td>
      <td class="td6"><label>
        <input type="text" name="brandgridGoods.goods_price" id="dangqianjiage" class="required input1" />
        </label>      </td>
    </tr>
    <tr>
      <td class="td5">市场价（RMB）&nbsp;：</td>
      <td class="td6">
      	<label>
        <input type="text" name="brandgridGoods.market_price" id="shichangjiage" class="required input1" />
        </label>      
        </td>
    </tr>	
	<tr>
      <td class="td5">单位&nbsp;：</td>
      <td class="td6">
      <select name="brandgridGoods.unit">
        <option value="件">件</option>
		<option value="对">对</option>
		<option value="个">个</option>
		<option value="袋">袋</option>
		<option value="片">片</option>
		<option value="盒">盒</option>
        </select>
        </td>
    </tr>
    <tr>
      <td class="td5">类型&nbsp;：</td>
      <td class="td6">
      <s:action name="showAllGoodsType" executeResult="false"></s:action>
      <s:select list="#request.goodstype_l" listValue="type_name" name="goodsType_id" listKey="id" id="type_name" headerKey="0" headerValue="--请选择类型--"/>
		</td>
    </tr>

    <tr>
      <td class="td5">图片①&nbsp;：</td>
      <td class="td6">
      	<label>
        <input type="file" name="file" id="file11" class="required input1" style="ime-mode:Disabled"/>
        </label>
	  </td>
    </tr>
    <tr>
      <td class="td5">图片②&nbsp;：</td>
      <td class="td6">
      <label>
        <input type="file" name="file" id="file12" class="required input1" style="ime-mode:Disabled"/>
        </label>
      </td>
    </tr>
    <tr>
      <td class="td5">图片③&nbsp;：</td>
      <td class="td6">
      <label>
        <input type="file" name="file" id="file13" class="required input1" style="ime-mode:Disabled"/>
        </label>
      </td>
    </tr>
    <tr>
      <td class="td5">
      详细介绍(图片不超过10张，html代码
	  </td>
	  <td class="td6">(编辑器左上角第一个按钮可查看)不超过2500字符): </td>
    </tr>
    <tr>
      <td colspan="2" class="td8">
	  <textarea id="editor" name="brandgridGoods.goods_info" rows="" cols="" style="visibility: hidden;"> 
      </textarea>
	  </td>
    </tr>
    <tr>
      <td class="td5">验证码&nbsp;：</td>
      <td class="td6">
      	<input type="text" id="randomNum"/><img id="img1"/><a href="#" onclick="randomPic(100,20);">看不清</a>
      </td>
    </tr>
    <tr>
      <td class="td5">&nbsp;</td>
      <td class="td6"><label>
        <input type="submit" name="Submit" value="确定" id="yes1" class="anniu" />
        &nbsp;&nbsp;&nbsp;
        <input type="reset" name="button" value="重置" id="no1" class="anniu"/>
        </label>      </td>
    </tr>
  </table>
</s:form>

</body>
</html>
