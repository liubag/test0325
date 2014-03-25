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
	<script src="${pageContext.request.contextPath}/admin/js/addgoodstypepage.js" type="text/javascript"></script>
	
	<script type="text/javascript">
	
	$(document).ready(function() {
		var height = $("body").height();
		$("#rightIframe",parent.document.body).height(height + 50);
	
		$('.btn').click(function(){
			var id = $(this).attr("id");
			var goodstype_id = $("#goodstype_id" + id).text();
			var type_name = $("#type_name" + id).text();
			$("#type_name").attr("value",type_name);
			$("#id").attr("value",goodstype_id);
			var $x = $("#xia");
	    	var $s = $("#shang");
			if($x.is(":hidden")){
				$s.hide();
				$x.show();
			}
		});
		
		$("#canle").click(function(){
			var $x = $("#xia");
		    var $s = $("#shang");
			if($s.is(":hidden")){
				$x.hide();
				$s.show();
			}
		});
		
    });
    
    
	function forcedo2(){
		    if(!confirm('是否确定要删除该品牌格子类型？')){return false;}
		    return true;
		}
</script>

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
<div id="box" >
  <div id="zhuanghu" align="center">
  	<s:property value="tip"/>
	<div id="box5">
    <div id="shang">
   		<s:form method="post" action="saveGoodsType">
		<table>
		<tr>
			<td class="table_td_11">商品类型名称(10个字以内)：</td><td class="table_td_12"><s:textfield name="goodsType.type_name" value="" id="gtn" maxlength="10"/></td>
		</tr>
		<tr>
			<td class="table_td_11"><s:submit value="添加" onclick="return check();"/></td><td class="table_td_12"><s:reset value="重置" /></td>
		</tr>
		</table>
		</s:form>
	</div>

    <div id="xia" class="abc">
    <s:form method="post" action="update">
   	 	<div class="div_title" style="background: red;">修改商品类型</div>
   	 	<input type="hidden" name="goodsType.id" id="id" />
    	
		<div class="div_1">类型：</div><div class="div_2"><input type="text" id="type_name" name="goodsType.type_name" /></div>
		<div style="margin-left:250px;"><s:submit value="提交商品类型" id="send"/><input type="button" value="取消修改" id="canle"/> </div>
	</s:form>
	</div>    
	</div>
		
		<br/>
		<br/>
		<table id="table2">
			<tr><th>编号</th><th>类型</th><th>目前商品数</th><th>修改</th><th>删除</th></tr>
			<s:action name="showAllGoodsType" executeResult="false"></s:action>
		  	<s:iterator value="#request.goodstype_l" status="st">
		  		<tr>
		  		<td id="goodstype_id<s:property value="id"/>"><s:property value="id"/></td>
		  		<td id="type_name<s:property value="id"/>"><s:property value="type_name"/></td>
		  		<td><s:property value="amount"/></td>
		  		<td>
		  			<a  href="#" class="btn" id="<s:property value="id"/>" >修改</a>
			  	</td>
			  	<td>
			  		<s:if test="amount<=0">
			  			<s:url id="url" action="dele">
					        <s:param name="id"><s:property value="id"/></s:param>
						</s:url>
				  		<s:a href="%{url}" onclick="return forcedo2();">删除</s:a>
			  			
			  		</s:if>
			  		<s:else>
			  			----
			  		</s:else>
			  	</td>
		  		</tr>	
		  	</s:iterator>
		  	</table>
  </div>
</div>
</body>
</html>