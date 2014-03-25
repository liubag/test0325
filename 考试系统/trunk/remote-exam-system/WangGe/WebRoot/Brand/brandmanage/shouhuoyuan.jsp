<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title></title>
<script src="${pageContext.request.contextPath}/Brand/js/jquery-1.6.4.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/Brand/js/shouhuoyuan.js" type="text/javascript"></script>
<link href="${pageContext.request.contextPath}/Brand/css/shouhuoyuan.css" rel="stylesheet" type="text/css" />
</head>

<body>

<div id="top">
<s:if test="brandgrid_salesman_id!=null">
修改售货员
</s:if>
<s:else>
添加售货员
</s:else>
</div>
<s:form action="addSalesman_brandowner" method="post" autocomplete="off">
<input type="hidden" id="bgs_id" value="<s:property value="brandgridSalesman.brandgrid_salesman_id"/>" name="brandgrid_salesman_id"/>
<table cellspacing="0">
  <tr>
    <td class="td5">姓&nbsp;&nbsp;&nbsp;&nbsp;名&nbsp;：</td>
    <td class="td6">
	<label>
      <input type="text" name="brandgridSalesman.brandgrid_salesman_name" id="name"  class="required input1" value="<s:property value="brandgridSalesman.brandgrid_salesman_name"/>"/>
    </label>
	</td>
  </tr>
  <tr>
    <td class="td5">性&nbsp;&nbsp;&nbsp;&nbsp;别&nbsp;：</td>
    <td class="td6"><div class="select1">
    	<input type="radio" class="sex" name="brandgridSalesman.brandgrid_salesman_sex" value="男" id="sex1" checked="checked"/>男
		<input type="radio" class="sex" name="brandgridSalesman.brandgrid_salesman_sex" value="女" id="sex2"/>女
		</div>
	</td>
  </tr>
   <tr>
    <td class="td5">身份证&nbsp;：</td>
    <td class="td6">
	<label>
      <input type="text" name="brandgridSalesman.brandgrid_salesman_idcard" id="shenfenzheng" class="input1 required" value="<s:property value="brandgridSalesman.brandgrid_salesman_idcard"/>"/>
    </label>
	</td>
  </tr>
  <tr>
    <td class="td5">联系电话&nbsp;：</td>
    <td class="td6">
	<label>
      <input type="text" name="brandgridSalesman.brandgrid_salesman_phone" id="phone" class="input1 required" value="<s:property value="brandgridSalesman.brandgrid_salesman_phone"/>"/>
    </label>
	</td>
  </tr>
  <tr>
    <td class="td5">联系QQ&nbsp;：</td>
    <td class="td6">
	<label>
      <input type="text" name="brandgridSalesman.brandgrid_salesman_qq" id="qq" class="input1 required" value="<s:property value="brandgridSalesman.brandgrid_salesman_qq"/>"/>
    </label>
	</td>
  </tr>
  <tr>
    <td class="td5">联系邮箱&nbsp;：</td>
    <td class="td6">
	<label>
      <input type="text" name="brandgridSalesman.brandgrid_salesman_email" id="mail" class="input1 required" value="<s:property value="brandgridSalesman.brandgrid_salesman_email"/>"/>
    </label>
	</td>
  </tr>
  <tr>
    <td class="td5">&nbsp;</td>
    <td class="td6"><label>
    <s:if test="brandgrid_salesman_id!=null">
	<input type="submit" name="Submit" value="确定修改" id="tianjia" />
	</s:if>
	<s:else>
	<input type="submit" name="Submit" value="添加" id="tianjia" />
	</s:else>
        </label>
	</td>
  </tr>
</table>
</s:form>
</body>
</html>
