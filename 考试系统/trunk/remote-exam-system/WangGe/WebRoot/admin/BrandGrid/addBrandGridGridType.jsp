<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title></title>
	<script src="${pageContext.request.contextPath}/admin/js/jquery-1.5.1.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/admin/js/table_tr.js" type="text/javascript"></script>
	<link href="${pageContext.request.contextPath}/admin/css/table_tr.css" type="text/css" rel="stylesheet" />

	<link href="${pageContext.request.contextPath}/admin/css/table.css" type="text/css" rel="stylesheet" />
	<script src="${pageContext.request.contextPath}/admin/js_brand/addgridtype.js" type="text/javascript"></script>

<style type="text/css">
    #box5
    {
        width:900px;
        height:auto;
        }
    #shang,#xia
    {
        width:740px;
        height:auto;
        margin:5px;
        float:left;
		
        }
      #btn
    {
        width:130px;
        height:25px;
        background-color:White;
        }
     .abc
     {
         display:none;
         }
	.div_title{
		background:#669999; 
		text-align:center;
		margin-left:24px;
	    width:705px;
	    margin-top: 5px;
	}
	.div_1{
		float:left;
		width:200px; 
		text-align:right;
		margin-left:30px;
		background:#FFF38F;
		margin-right:5px;
		margin-top: 5px;
	}
	.div_2{
		float:left;
		text-align:left;
		width:500px; 
		background:#FFF38F;
		margin-top: 5px;
	}
</style>
	
	
</head>

<body onload="refreshSize();">
<div id="box" align="center">
  <div id="zhuanghu" align="center">
  	<s:property value="tip"/>
	<div id="box5">
    <div id="shang">
   		<s:form method="post" action="addBrandGridGridType">
		<table>
		<tr>
			<td class="table_td_11">格子类型(10个字以内)：</td><td class="table_td_12"><s:textfield name="brandgridGridtype.brandgrid_gridtype_name" value="" id="gtn" maxlength="10"/></td>
		</tr>
		<tr>
			<td class="table_td_11">可容纳商品数：</td><td class="table_td_12"><s:textfield name="brandgridGridtype.can_show_goods" value="" id="gtcsg" maxlength="4" size="4"/>个商品</td>
		</tr>
		<tr>
			<td class="table_td_11">单价(整数)：</td><td class="table_td_12"><s:textfield name="brandgridGridtype.unitprice" value="" id="gtu" maxlength="4" size="4"/>元整/月</td>
		</tr>
		<tr>
			<td class="table_td_11">空间大小：</td><td class="table_td_12"><s:textfield name="brandgridGridtype.hard_disk_space" value="" id="gtnhds" maxlength="4" size="4"/>MB</td>
		</tr>
		<tr>
			<td class="table_td_11">每天可置顶次数：</td><td class="table_td_12"><s:textfield name="brandgridGridtype.LZ_note" value="" id="gtlz" maxlength="4" size="4"/>次</td>
		</tr>
		<tr>
			<td class="table_td_11"><s:submit value="添加" onclick="return check();"/></td><td class="table_td_12"><s:reset value="重置" /></td>
		</tr>
		</table>
		</s:form>
	</div>

    <div id="xia" class="abc">
    <s:form method="post" action="updateBrandGridGridType">
   	 	<div class="div_title" style="background: red;">修改格子类型</div>
   	 	<input type="hidden" name="brandgridGridtype.brandgrid_gridtype_id" id="id" />
    	
		<div class="div_1">格子类型：</div><div class="div_2"><input type="text" id="type_name" name="brandgridGridtype.brandgrid_gridtype_name" maxlength="10"/></div>
		<div class="div_1">可容纳商品数：</div><div class="div_2"><input type="text" id="csg" name="brandgridGridtype.can_show_goods" size="4"/>个商品</div>
		<div class="div_1">单价(整数)：</div><div class="div_2"><input type="text" id="unitprice" name="brandgridGridtype.unitprice" size="4"/>元整/月</div>
		<div class="div_1">空间大小：</div><div class="div_2"><input type="text" id="hds" name="brandgridGridtype.hard_disk_space" size="4"/>MB</div>
		<div class="div_1">每天可置顶次数：</div><div class="div_2"><input type="text" id="lz" name="brandgridGridtype.LZ_note" size="4"/>次</div>
		<div style="margin-left:250px;"><s:submit value="提交商品类型" id="send"/><input type="button" value="取消修改" id="canle"/> </div>
	</s:form>
	</div>    
	</div>
		
		<br/>
		<br/>
		<table id="table2">
			<tr><th>编号</th><th>类型</th><th>目前格子数</th><th>单价</th><th>可容纳商品数</th><th>空间大小（MB）</th><th style="width: 150px;">每天可置顶次数(次)</th><th >操作</th></tr>
			<s:action name="showAllBrandGridGridType" executeResult="false"></s:action>
		  	<s:iterator value="#request.brandgridGridtype_l" status="st">
		  		<tr>
		  		<td id="goodstype_id<s:property value="brandgrid_gridtype_id"/>"><s:property value="brandgrid_gridtype_id"/></td>
		  		<td id="type_name<s:property value="brandgrid_gridtype_id"/>"><s:property value="brandgrid_gridtype_name"/></td>
		  		<td ><s:property value="amount"/></td>
		  		<td id="unitprice<s:property value="brandgrid_gridtype_id"/>"><s:property value="unitprice"/></td>
		  		<td id="csg<s:property value="brandgrid_gridtype_id"/>"><s:property value="can_show_goods"/></td>
		  		<td id="hds<s:property value="brandgrid_gridtype_id"/>"><s:property value="hard_disk_space"/></td>
		  		<td id="lz<s:property value="brandgrid_gridtype_id"/>"><s:property value="LZ_note"/></td>
		  		<td>
		  			<a href="#" class="btn" id="<s:property value="brandgrid_gridtype_id"/>" >修改</a>
		  			<br/>
		  			<s:if test="amount<=0">
			  			<s:url id="url" action="deleBrandGridGridType">
					        <s:param name="brandgrid_gridtype_id"><s:property value="brandgrid_gridtype_id"/></s:param>
						</s:url>
				  		<s:a href="%{url}" onclick="return forcedo2();">删除</s:a>
			  			
			  		</s:if>
			  		<s:else>
			  			----
			  		</s:else>
			  	</td>
			  	<td>
			  		
			  	</td>
		  		</tr>	
		  	</s:iterator>
		  	</table>
  </div>
</div>
</body>
</html>