<%@ page language="java" import="java.util.*,com.OnlineGridShop.brand.Entity.BrandgridGridtype"  contentType="text/html; charset=utf-8" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title></title>
	<link href="${pageContext.request.contextPath}/admin/css/style.css" rel="stylesheet" type="text/css" />
	<script src="${pageContext.request.contextPath}/admin/js/jquery-1.5.1.min.js" type="text/javascript"></script>
	<link href="${pageContext.request.contextPath}/admin/css/table.css" type="text/css" rel="stylesheet" />
	<script src="${pageContext.request.contextPath}/admin/js_brand/enrollBrandgrid.js" type="text/javascript"></script>
</head>

<body>
<div id="enroll">
<s:form method="post" action="enrollBrandgrid" autocomplete="off">
  		<s:property value="tip"/>
  		<input type="hidden" value="<s:property value="brandgrid.brandgrid_id"/>" name="brandgrid.brandgrid_id" id="brandgrid_id"/>
		<div class="int"> 
		<label> 品牌店店名：</label> 
		
		<input type="text" name="brandgrid.brandgrid_name" id="brandgrid_name" class="required" size="30" maxlength="10" value="<s:property value="brandgrid.brandgrid_name"/>"/> 
		</div>
		<div class="int"> 
		<label> 地址：</label> 
		<input type="text" name="brandgrid.brandgrid_address" value="<s:property value="brandgrid.brandgrid_address"/>" id="brandgrid_address" class="required" size="50"  maxlength="50"/> 
		</div>
		<div class="int"> 
		<label> QQ客服：</label> 
		<input type="text" name="brandgrid.brandgrid_qq" value="<s:property value="brandgrid.brandgrid_qq"/>" id="brandgrid_qq" class="required" size="30"  maxlength="20"/> 
		</div>
		<div class="int"> 
		<label> 租用月数：</label> 
		<input type="text" name="hireTime" id="hireTime" value="<s:property value="hireTime"/>" class="required" size="4" maxlength="4" /> 
		<s:if test="brandgrid.brandgrid_id!=null">
		可修改租用月数最小值为：
		</s:if>
		<span id="differ"><s:property value="differ"/></span>
		</div>
		<div class="int"> 
		<label> 拥有格子数：</label>
		<s:if test="brandgrid.brandgrid_id!=null">
			<input type="text" style="border-style:none;" name="brandgrid.brandgrid_hasgrids" id="brandgrid_hasgrids2" value="<s:property value="brandgrid.brandgrid_hasgrids"/>" size="4" maxlength="4" readonly="readonly"/> 
		</s:if>
		<s:else>
			<input type="text" name="brandgrid.brandgrid_hasgrids" id="brandgrid_hasgrids" value="<s:property value="brandgrid.brandgrid_hasgrids"/>" class="required" size="4" maxlength="4"/> 
		</s:else>
		</div>
		<div class="int"> 
		<s:action name="showAllBrandGridGridType" executeResult="false"></s:action>
		<label> 选择格子类型：</label>
		<input type="hidden" value="<s:property value="brandgrid_gridtype_id"/>" id="brandgrid_gridtype_id"/>
		<br/>
			<div style="margin-left: 110px">
		<%
		  		List<BrandgridGridtype> gridtype_l = (List<BrandgridGridtype>)request.getAttribute("brandgridGridtype_l");
		  		for(BrandgridGridtype gt : gridtype_l){
		  			%>
		  			<input type="radio"  class="grid_type_id" name="brandgrid_gridtype_id" value= "<%=gt.getBrandgrid_gridtype_id() %>" /> <%=gt.getBrandgrid_gridtype_name()+"  可容纳商品：" + gt.getCan_show_goods()%> 个,单价：<span id="<%="unitprice" + gt.getBrandgrid_gridtype_id() %>"><%=gt.getUnitprice() %></span> 元整/月,可用硬盘空间：<%=gt.getHard_disk_space() %>MB<br/> 
		  			<%
		  		}
		  	 %>
		  	 </div>
		 </div>
		<div class="int"> 
		<label> 总价：</label> 
		<s:textfield name="totalprice" value="" readonly="true" id="result" size="4"/>  元整
		</div>
		<br/>
		<div class="int"> 
		<input type="hidden" id="brandgrid_owner_id" value="<s:property value="brandgridOwner.brandgrid_owner_id"/>" name="brandgridOwner.brandgrid_owner_id"/>
		<label>法人名字：</label> 
		<input type="text" name="brandgridOwner.brandgrid_owner_name" value="<s:property value="brandgridOwner.brandgrid_owner_name"/>" id="brandgrid_owner_name" class="required" size="30" maxlength="20"/> 
		</div>
		<div class="int"> 
		<label>登录名：</label> 
		<input type="text" name="brandgridOwner.brandgrid_owner_username" value="<s:property value="brandgridOwner.brandgrid_owner_username"/>" id="brandgrid_owner_username" class="required" size="30" maxlength="20"/> 
		</div>
		<s:if test="brandgrid.brandgrid_id==null">
		<div class="int"> 
		<label>初始密码：</label> 
		<input type="text" name="brandgridOwner.brandgrid_owner_pw" id="brandgrid_owner_pw" class="required" size="30" onkeyup="truenamekeyup();" ondragenter="return false" maxlength="20" value="123456"/> 
		</div>
		</s:if>
		<div class="int"> 
		<label> 性别：</label> 
		<input type="hidden" id="sex" value="<s:property value="brandgridOwner.brandgrid_owner_sex"/>"/>
		男<input type="radio" class="sex" name="brandgridOwner.brandgrid_owner_sex" value="男" id="sex1" checked="checked"/>
		女<input type="radio" class="sex" name="brandgridOwner.brandgrid_owner_sex" value="女" id="sex2"/>
		</div>
		<div class="int"> 
		<label> 联系电话：</label> 
		<input type="text" name="brandgridOwner.brandgrid_owner_phone" value="<s:property value="brandgridOwner.brandgrid_owner_phone"/>" id="brandgrid_owner_phone" class="required" size="30" maxlength="13"/> 
		</div>
		
		<div class="sub">
			<input type="submit" value="确定" id="send"/><input type="reset" id="res"/>
		</div>
	</s:form>
	</div>
	
	<div id="myDialog" title="My Dialog" style="display:none;background-color: blue;">  
			<div id="dialogContent" style="overflow-y: auto; height: 100%;">  
				<span class="blue13">waiting..</span>  
			</div>   
	</div>
</body>
</html>