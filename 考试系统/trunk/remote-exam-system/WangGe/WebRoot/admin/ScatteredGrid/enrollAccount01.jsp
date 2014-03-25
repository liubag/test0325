<%@ page language="java" import="java.util.*,com.OnlineGridShop.scattered.Entity.GridType,com.OnlineGridShop.scattered.Entity.ScatteredGridRendtypeMake" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title></title>
	<link href="${pageContext.request.contextPath}/admin/css/style.css" rel="stylesheet" type="text/css" />
	<script src="${pageContext.request.contextPath}/admin/js/jquery-1.5.1.min.js" type="text/javascript"></script>
	<link href="${pageContext.request.contextPath}/admin/css/table.css" type="text/css" rel="stylesheet" />
	<script src="${pageContext.request.contextPath}/admin/js/enrollAccount01page.js" type="text/javascript"></script>
</head>

<body>
<s:form method="post" action="enroll_Account" autocomplete="off">
  		<s:property value="tip"/>
		<div class="int"> 
		<label> 用户名：</label> 
		<input type="text" name="username" id="username" class="required" size="30" onkeyup="namekeyup();" ondragenter="return false" maxlength="20"/> 
		</div>
		<div class="int"> 
		<label> 身份证：</label> 
		<input type="text" name="idcard" id="idcard" class="required" size="30" onkeyup="idcardkeyup();" ondragenter="return false" maxlength="20"/> 
		</div>
		<div class="int"> 
		<label> 真实姓名：</label> 
		<input type="text" name="truename" id="truename" class="required" size="30" onkeyup="truenamekeyup();" ondragenter="return false" maxlength="20"/> 
		</div>
		<div class="int"> 
		<label> 性别：</label> 
		男<input type="radio" name="sex" value="男" id="sex1" checked="checked"/>
		女<input type="radio" name="sex" value="女" id="sex2"/>
		</div>
		<div class="int"> 
		<label> QQ客服：</label> 
		<input type="text" name="qq_number" id="qq_number" class="required" size="30" ondragenter="return false" maxlength="13"/> 
		</div>
		<div class="int"> 
		<label> 联系电话：</label> 
		<input type="text" name="phone" id="phone" class="required" size="30" ondragenter="return false" maxlength="20"/> 
		</div>
		<div class="int"> 
		<label> 住址：</label> 
		<input type="text" name="address" id="address" class="required" size="30" ondragenter="return false" maxlength="20"/> 
		</div>
		<div class="int"> 
		<s:action name="showAllGridType" executeResult="false"></s:action>
		<label> 选择格子类型：</label>
		
		<br/>
			<div style="margin-left: 110px">
		<%
		  		List<GridType> gridtype_l = (List<GridType>)request.getAttribute("gridtype_l");
		  		for(GridType gt : gridtype_l){
		  			%>
		  			<input type="radio"  class="grid_type_id" name="grid_type_id" value= "<%=gt.getGridtype_id() %>" /> <%=gt.getGridtypename()+"  可容纳商品：" + gt.getCanshowgoods()%> 个,单价：<span id="<%="unitprice" + gt.getGridtype_id() %>"><%=gt.getUnitprice() %></span> 元整,可用硬盘空间：<%=gt.getHard_disk_space() %>MB<br/> 
		  			<%
		  		}
		  	 %>
		  	 </div>
		 </div>
		<s:action name="showAllRendType" executeResult="false"></s:action>
		<div class="int"> 
		<label> 选择租用类型：</label> 
		<br/>
			<div style="margin-left: 110px">
		<%
		  		List<ScatteredGridRendtypeMake> rendTypeMake_l = (List<ScatteredGridRendtypeMake>)request.getAttribute("rendTypeMake_l");
		  		for(ScatteredGridRendtypeMake sgrm : rendTypeMake_l){
		  			%>
		  			<input  type="radio" class="rendtype_id" name="rendtype_id" value= "<%=sgrm.getRendtype_id() %>" /> <%=sgrm.getType_called()%>（<span id="<%="months" + sgrm.getRendtype_id()%>"><%=sgrm.getMonths()%></span> ）,折扣：<span id="<%="rendtype_agio" + sgrm.getRendtype_id()%>"><%=sgrm.getRendtype_agio() %></span>折 <br/> 
		  			<%
		  		}
		  	 %>
		  	 </div>
		</div>
		<div class="int"> 
		<label> 总价：</label> 
		<s:textfield name="totalprice" value="" readonly="true" id="result"/>
		</div>
		<br/>
		<div class="sub">
			<input type="submit" value="确定" id="send"/><input type="reset" id="res"/>
		</div>
	</s:form>
</body>
</html>