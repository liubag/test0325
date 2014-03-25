<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title></title>
<script src="${pageContext.request.contextPath}/Brand/js/jquery-1.6.4.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/Brand/js/yanzheng.js" type="text/javascript"></script>
<link href="${pageContext.request.contextPath}/Brand/css/tianjiagezhu.css" rel="stylesheet" type="text/css" />
</head>

<body>

<div id="top">
<s:if test="brandgrid_grid_id!=null">
修改格主
</s:if>
<s:else>
添加格主
</s:else>
</div>
<s:form method="post" action="addBrandgridGridOwner" autocomplete="off">
<input type="hidden" id="bggo_id" value="<s:property value="brandgridGridOwner.brandgrid_gridowner_id"/>" name="owner_id"/>
<table>
  <tr>
    <td class="td5">格主用户名（用于登录）&nbsp;：</td>
    <td class="td6">
	<label>
      <input type="text" name="brandgridGridOwner.brandgrd_gridowner_username" id="user" class="required input1" value="<s:property value="brandgridGridOwner.brandgrd_gridowner_username"/>"/>
    </label>
	</td>
  </tr>
  <tr>
    <td class="td5">姓&nbsp;&nbsp;&nbsp;&nbsp;名&nbsp;：</td>
    <td class="td6">
	<label>
      <input type="text" name="brandgridGridOwner.brandgrid_gridowner_name" id="name"  class="required input1" value="<s:property value="brandgridGridOwner.brandgrid_gridowner_name"/>"/>
    </label>
	</td>
  </tr>
  <tr>
    <td class="td5">性&nbsp;&nbsp;&nbsp;&nbsp;别&nbsp;：</td>
    <td class="td6"><div class="select1">
    	<input type="radio" class="sex" name="brandgridGridOwner.brandgrid_gridowner_sex" value="男" id="sex1" checked="checked"/>男
		<input type="radio" class="sex" name="brandgridGridOwner.brandgrid_gridowner_sex" value="女" id="sex2"/>女
		</div>
	</td>
  </tr>
  <tr>
    <td class="td5">联系方式&nbsp;：</td>
    <td class="td6">
	<label>
      <input type="text" name="brandgridGridOwner.brandgrid_gridowner_phone" id="lianxi" class="input1 required" value="<s:property value="brandgridGridOwner.brandgrid_gridowner_phone"/>"/>
    </label>
	</td>
  </tr>
   <tr>
    <td class="td5">联系QQ&nbsp;：</td>
    <td class="td6">
	<label>
      <input type="text" name="brandgridGridOwner.brandgrid_gridowner_qq" id="qq" class="input1 required" value="<s:property value="brandgridGridOwner.brandgrid_gridowner_qq"/>"/>
    </label>
	</td>
  </tr>
  <tr>
    <td class="td5">联系邮箱&nbsp;：</td>
    <td class="td6">
	<label>
      <input type="text" name="brandgridGridOwner.brandgrid_gridowner_email" id="mail" class="input1 required" value="<s:property value="brandgridGridOwner.brandgrid_gridowner_email"/>"/>
    </label>
	</td>
  </tr>
 
  <s:if test="brandgrid_grid_id!=null">
   <tr>
  	<td class="td5">原本格子&nbsp;：</td>
    <td class="td6">
	 <s:property value="brandgrid_grid_id"/>&nbsp;&nbsp;&nbsp;
	 修改格子<input type="checkbox" value="1" name="cgezhi" id="cgezhi"/>
	 <s:action name="getGeNum_l_brandowner" executeResult="false"></s:action>
	 <div id="cg" style="display:none;">
	 <s:select list="#request.genum_l"  name="brandgrid_grid_id" id="select" />
	 </div>
	 </td>
	 </tr>
  </s:if>
  <s:else>
   <tr>
  	<s:action name="getGeNum_l_brandowner" executeResult="false"></s:action>
    <td class="td5">选择格子&nbsp;：</td>
    <td class="td6">
	 <s:select list="#request.genum_l"  name="brandgrid_grid_id" id="select"/>
	 </td>
	 </tr>
  </s:else>
  	
  
  <tr>
   <s:if test="brandgrid_grid_id!=null">
    <td class="td5">&nbsp;</td>
    <td class="td6"><label>
      <input type="submit" name="Submit" value="确定修改" id="tianjia" />
        </label>
	</td>
   </s:if>
   <s:else>
    <td class="td5">&nbsp;</td>
    <td class="td6"><label>
      <input type="submit" name="Submit" value="添加" id="tianjia" />
        </label>
	</td>
   </s:else>
  </tr>
</table>
</s:form>

</body>
</html>
