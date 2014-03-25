<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>上传同时申请上架</title>
<script src="${pageContext.request.contextPath}/Brand/js/jquery-1.6.4.min.js" type="text/javascript"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/Brand/js/s_goodsUpdata.js"></script>
<script src="${pageContext.request.contextPath}/Brand/js/random2.js" type="text/javascript"></script>
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
<s:form id="form1" action="updataGoods_salesman" method="post" autocomplete="off">
 <input type="hidden" name="issalesmanage" value="yes"/>
 <input type="hidden" name="page" value="<s:property value="page"/>"/>
 <input type="hidden" name="statu_choice" value="<s:property value="statu_choice"/>"/>
 <input type="hidden" name="owner_status" value="<s:property value="owner_status"/>"/>
 <input type="hidden" name="brandgrid_Gridnum" value="<s:property value="brandgrid_Gridnum"/>"/>
  <input type="hidden" name="brandgridGoods.brandgrid_goods_id" value="<s:property value="brandgridGoods.brandgrid_goods_id"/>"/>
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="td5">商品名称（<span id="namewordcount">0/20</span>）&nbsp;：</td>
      <td class="td6"><label>
        <input type="text" name="brandgridGoods.goods_name" id="shangpin" class="required input1" onkeyup="goodsnamekeyup();" value="<s:property value="brandgridGoods.goods_name"/>"/>
        </label>     
       </td>
    </tr>
    <tr>
      <td class="td5">数量（最小为<s:property value="brandgridGoods.goods_hasamount - brandgridGoods.residual_mount"/>）&nbsp;：</td>
      <td class="td6"><label>
      	<input type="hidden"  id="min" value="<s:property value="brandgridGoods.goods_hasamount - brandgridGoods.residual_mount"/>"/>
        <input type="text" name="brandgridGoods.goods_hasamount" id="shuliang" class="required input1" value="<s:property value="brandgridGoods.goods_hasamount"/>"/>
        </label>      </td>
    </tr>
    <tr>
      <td class="td5">剩余数量&nbsp;：</td>
      <td class="td6"><label>
        <input type="text" name="brandgridGoods.residual_mount" id="syu" value="<s:property value="brandgridGoods.residual_mount"/>" readonly="readonly" style="border: none;background-color: #FFF3D2;"/>
        </label>      </td>
    </tr>
    <tr>
      <td class="td5">当前价（RMB）&nbsp;：</td>
      <td class="td6"><label>
        <input type="text" name="brandgridGoods.goods_price" id="dangqianjiage" class="required input1" value="<s:property value="brandgridGoods.goods_price"/>"/>
        </label>      </td>
    </tr>
    <tr>
      <td class="td5">市场价（RMB）&nbsp;：</td>
      <td class="td6">
      	<label>
        <input type="text" name="brandgridGoods.market_price" id="shichangjiage" class="required input1" value="<s:property value="brandgridGoods.market_price"/>"/>
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
      <td class="td5">图片&nbsp;：</td>
      <td class="td6">
      	<label>
        	没有修改权限
        </label>      
        </td>
    </tr>	
    <tr>
      <td class="td5">详情&nbsp;：</td>
      <td class="td6">
      	<label>
       没有修改权限
        </label>      
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
      <td class="td5">&nbsp;</td>
      <td class="td6"><label>
        <input type="submit" name="Submit" value="确定修改" id="yes1" class="anniu" />
        &nbsp;&nbsp;&nbsp;
        <input type="reset" name="button" value="重置" id="no1" class="anniu"/>
        </label>      </td>
    </tr>
  </table>
</s:form>

</body>
</html>
