<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>无标题文档</title>
<link href="css/taoshuxuan.css" rel="stylesheet" type="text/css" />
<link href="css/addressManagement.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div class="content">
 <div id="breadNav">
	<jsp:include page="breadcrumbNavigation.jsp" />
</div>
  <div class="title">
    <h3> 我的收货地址簿</h3>
  </div>
  <div id="dizhi_list">
    <table class="addr_list">
      <tbody>
        <tr>
          <th class="consignee"> 收货人 </th>
          <th class="addr_detail"> 详细地址 </th>
          <th class="phone"> 电话/手机 </th>
          <th class="operate"> 操作 </th>
        </tr>
        <tr>
          <td class="addresseename" title="简建鸿"> 简建鸿 </td>
          <td class="address"> 广东-珠海市-香洲区-广东省珠海市唐家湾金凤路6号北京理工大学珠海学院,519088 </td>
          <td>13750034730</td>
          <td><a href="#" class="edit-info"> 编辑</a> <a href="#" id="delete"> 删除</a></td>
        </tr>
        <tr>
          <td class="page-panel">分页导航</td>
        </tr>
      </tbody>
    </table>
  </div>
  <div class="title">
    <h3> 输入新的收货地址</h3>
  </div>
  <fieldset class="edit-addr">
    <div id="EditAddress">
      <div class="new_dizhi">
        <table width="100%" cellspacing="3" cellpadding="10" border="0" class="addNewAddr">
          <tbody>
            <tr>
              <td class="lable"><span>*</span> 收 货 人：</td>
              <td ><input type="text" name="receiverName" maxlength="20" id="receiverName"></td>
            </tr>
            <tr>
              <td class="lable"><span>*</span> 地&#12288;&#12288;区：</td>
              <td><select id="s_province" name="s_province">
                </select>
                <select id="s_city" name="s_city">
                </select>
                <select id="s_county" name="s_county">
                </select>
                <script type="text/javascript" src="js/area.js" ></script> 
                <script type="text/javascript">_init_area();</script> 
                <script type="text/javascript">
var Gid  = document.getElementById ;
var showArea = function(){
	Gid('show').innerHTML = "<h3>" + Gid('s_province').value + " - " + 
							Gid('s_city').value + " - " + 
							Gid('s_county').value + "</h3>"
}
Gid('s_county').setAttribute('onchange','showArea()');
</script></td>
            </tr>
            <tr>
              <td class="lable"><span>*</span> 详细地址：</td>
              <td colspan="3"><input type="text" name="detailAddress" maxlength="50" id="detailAddress"></td>
            </tr>
            <tr>
              <td class="lable"><span>*</span> 邮政编码：</td>
              <td colspan="3"><input type="text"  name="postalCode" maxlength="6" id="postalCode"></td>
            </tr>
            <tr>
              <td class="lable">&#12288;手&#12288;&#12288;机：</td>
              <td ><input type="text"  name="mobile" maxlength="11" id="mobile"></td>
            </tr>
            <tr>
              <td class="lable">&#12288;座    机：</td>
              <td ><input type="text" " name="phone" maxlength="20" id="phone"></td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
    <a style="margin-left:77px;" href="###"> <img alt="添加这个地址" id="saveButton" src="http://i.vanclimg.com/my/2012/deliveryaddress/bt6.jpg"/> </a>
  </fieldset>
</div>
</body>
</html>
