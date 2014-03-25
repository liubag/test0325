<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title></title>
		<script src="${pageContext.request.contextPath}/ScatteredGrid/js/jquery-latest.pack.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/ScatteredGrid/js/dialog.js" type="text/javascript"></script>
		 <script src="${pageContext.request.contextPath}/ScatteredGrid/js/jquery-1.5.1.min.js" type="text/javascript"></script>
		 <script type="text/javascript">
		 	
		 	function amountChange(select){
		 		var goods_price = $("#goods_price").text();
		 		$("#total").html(select.value*goods_price);
		 	}
		 	$(function(){
			 	$("#send").click(function(){
			 		if($("#amount").attr("value").length == 0){
			 			alert("请选择出售数量");
			 			return;
			 		}
			 		var do_truePrivce = $("#do_truePrivce").val();
			 		if(do_truePrivce.length==0){
			 			alert("请输入售出价格.");
			 			return;
			 		}
			 		var page = $("#page").attr("value");
			 		var goodstatu = $("#goodstatu").attr("value");
			 		var goodsid = $("#goods_id").attr("value");
			 		var amount = $("#amount").attr("value");
			 		
					$("#rightIframe",window.parent.parent.parent.document.body).attr("src","workoffGoods.do?goods_id=" + goodsid + "&amount=" + amount + "&page="+page +"&goodstatu=" + goodstatu+"&do_truePrivce=" + do_truePrivce);
		 			$(window.parent.document).find("#floatBox .title span").trigger('click');	 
		 		});
		 	});
		 </script>
	</head>

	<body>
	
	<%
		String goodsid = request.getParameter("goodsid");
		String page3 = request.getParameter("page");
		String goodstatu = request.getParameter("goodstatu");
		String goodsname = new String(request.getParameter("goodsname").getBytes("ISO8859-1"),"utf-8");
		Integer goods_hasamount = Integer.parseInt(request.getParameter("goods_hasamount"));
		List<Integer> amount_l = new ArrayList<Integer>();
		for(int i=1;i <= goods_hasamount;i++){
			amount_l.add(i);
		}
		request.setAttribute("amount_l",amount_l);
		float goods_price = Float.parseFloat(request.getParameter("goods_price"));
	 %>
	 <s:form method="post" action="#">
	 <input type="hidden" value="<%=goodsid %>" id="goods_id" name="goods_id"/>  <input type="hidden" value="<%=page3 %>" id="page" name="page"/><input type="hidden" value="<%=goodstatu %>" id="goodstatu" name="goodstatu"/> 
	 	<table>
	 		<tr>
	 			<td>商品名称：</td><td><%=goodsname %></td>
	 		</tr>
	 		<tr>
	 			<td>当前价：</td><td><span id="goods_price"><%=goods_price %></span></td>
	 		</tr>
	 		<tr>
	 			<td>售出价：</td><td><input type="text" name="do_truePrivce" id="do_truePrivce" value="<%=goods_price %>" /></td>
	 		</tr>
	 		<tr>
	 			<td>出售数量：</td><td><s:select list="#attr.amount_l" headerValue="--选择出售数量--" name="amount" headerKey=""  id="amount" onchange="amountChange(this);"></s:select></td>
	 		</tr>
	 		<tr>
	 			<td>总价：</td><td><span id="total">0</span></td>
	 		</tr>
	 		<tr>
	 			<td></td><td><input type="submit" value="出售" id="send"/></td>
	 		</tr>
	 	</table>
	 </s:form>

	</body>
</html>
