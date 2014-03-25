<%@ page language="java" import="java.util.*,com.OnlineGridShop.scattered.Entity.GridType,com.OnlineGridShop.scattered.Entity.ScatteredGridRendtypeMake" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title></title>
	<script src="${pageContext.request.contextPath}/admin/js/jquery-1.5.1.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/ScatteredGrid/js/onloadIframe.js" type="text/javascript"></script>
	
	<style type="text/css">
		body{
			font:normal 12px/17px Arial;
		}
		div{
		    padding:2px;
		} 
		text, textarea { 
			 width: 12em; 
			 border: 1px solid #888;
		}
		.focus { 
			 border: 1px solid #f00;
			 background: #fcc;
		} 
		</style>
		<script src="../scripts/jquery-1.3.1.js" type="text/javascript"></script>
	<script type="text/javascript">
			var unitprice = null;
			var r = null;
			var m = null;
		  	function account_01(){
		  		var grid_type_id = document.getElementsByName("grid_type_id");
		  		for (var i = 0; i < grid_type_id.length; i++) {
	              	if (grid_type_id[i].checked)
	               	  unitprice = document.getElementById("unitprice"+grid_type_id[i].value);
	             }
		  		if(r != null && m!=null){
		  			var msg = unitprice.value *r.value * m.value;
		  			var show = document.getElementById("totalprice");
		  			show.value = msg;
		  		}
			}
			function account_02(){
				var rendtype_id = document.getElementsByName("rendtype_id");
				for (var i = 0; i < rendtype_id.length; i++) {
	              	if (rendtype_id[i].checked){
	              		r = document.getElementById("rendtype_agio" + rendtype_id[i].value);
		  				m = document.getElementById("months" + rendtype_id[i].value);
	              	}
	            }
		  		if(unitprice!=null){
			  		var msg = unitprice.value *r.value * m.value;
			  		var totalprice = document.getElementById("totalprice");
			  		totalprice.value = msg;	
		  		}
		  			
			}
			
			 $(function(){
				$(":text").focus(function(){
					  $(this).addClass("focus");
					  if($(this).val() ==this.defaultValue){  
		                  $(this).val("");           
					  } 
				}).blur(function(){
					 $(this).removeClass("focus");
					 if ($(this).val() == '') {
		                $(this).val(this.defaultValue);
		             }
				});
    })
		</script>
</head>

<body >
<div id="box" >
  <div id="zhuanghu" align="center">
  	<s:property value="tip"/>
		<s:form method="post" action="update_scatteredGridAccount">
			<s:hidden name="owner_id"/>
			<s:hidden name="account_id" /><br/>
			用户名：<s:textfield id="username" label="" name="username" /><br/>
			身份证：<s:textfield id="idcard" label="" name="idcard" /><br/>
			真实姓名：<s:textfield id="truename" label="" name="truename" /><br/>
			性别:<s:radio  list="#{'男':'男','女':'女'}" label="" name="sex" /><br/>
			联系电话：<s:textfield id="phone" label="" name="phone" /><br/>
			住址：<s:textfield id="address" label="" name="address" /><br/>
			<br/>
			<br/>
			<s:action name="showAllGridType" executeResult="false"></s:action>
		  	<br/>
		  	<br/>
		  	<s:hidden name="grid_id"/><br/>
		  	选择格子类型：<br/>
		  	<%
		  		List<GridType> gridtype_l = (List<GridType>)request.getAttribute("gridtype_l");
		  		for(GridType gt : gridtype_l){
		  			%>
		  			<input type="radio" name="grid_type_id" value= "<%=gt.getGridtype_id() %>" onclick="account_01();"> <%=gt.getGridtypename()+"  可容纳商品：" + gt.getCanshowgoods()%> 单价：<input type="h" name="<%="unitprice" + gt.getGridtype_id() %>" value="<%=gt.getUnitprice() %>"/> <br/> 
		  			<%
		  		}
		  	 %>
			<br/>
			<br/>
			<s:action name="showAllRendType" executeResult="false"></s:action>
		  	选择租用类型：<br/>
		  	<%
		  		List<ScatteredGridRendtypeMake> rendTypeMake_l = (List<ScatteredGridRendtypeMake>)request.getAttribute("rendTypeMake_l");
		  		for(ScatteredGridRendtypeMake sgrm : rendTypeMake_l){
		  			%>
		  			<input  type="radio" name="rendtype_id" value= "<%=sgrm.getRendtype_id() %>" onclick="account_02();"> <%=sgrm.getType_called()%>月份：<input type="text" name="<%="months" + sgrm.getRendtype_id()%>" value="<%=sgrm.getMonths()%>" readonly="readonly" lang="10"/> 折扣：<input type="text" name="<%="rendtype_agio" + sgrm.getRendtype_id()%>" value="<%=sgrm.getRendtype_agio() %>" readonly="readonly"/> <br/> 
		  			<%
		  		}
		  	 %>
		  	 <br/>
		  	 <br/>
			总价：<s:textfield name="totalprice" value="" readonly="true"/>
			<br/>
			<br/>
			<s:submit value="确定" />
			<s:reset value="重置" />
		</s:form>
  </div>
</div>
</body>
</html>