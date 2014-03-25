<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>

<script src="${pageContext.request.contextPath}/ScatteredGrid/js/jquery-1.5.1.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/ScatteredGrid/js/onloadIframe.js" type="text/javascript"></script>
<script language="JavaScript">
    	var id = null;
    	var beforeSelect = null;
    	var goods_id = null;
    	var page = null;
    	function keepid(select){
    		if(beforeSelect != null){
    			beforeSelect.className = 'div1';
    		}
    		id = select.id;
    		beforeSelect = select;
    		select.className = 'divselected';
    		
    	}
    	
    	function putaway(){	
    		if(id == null){
    			alert("未选择上架位置！");
    		}else{
    			goods_id = $("#goods_id").attr("value");
    			page = $("#page").attr("value");
    			$("#rightIframe",parent.document.body).attr("src","putAwayGoods.do?goods_id="+goods_id+"&bunkid="+id+"&page="+page);
    		}
    		
    	}
</script>

<style type="text/css">
.div1{
	width:70px;
	height:50px;
	margin:0 auto;
	background-color: #1efae8;
	border: 5px solid #000000;
}

.div2{
	width:70px;
	height:50px;
	margin:0 auto;
	background-color: #1efae8;
}
.text{
	color: red;
}
.divselected{
	width:70px;
	height:50px;
	margin:0 auto;
	background-color: #000000;
	border: 5px solid #1efae8;
}
</style>

</head>



<body>
	<s:hidden id="goods_id" name="goods_id"/>
	<s:hidden id="page" name="page"/>
	 <%
  	int showNo = 0;
  	int divisor = 4;
  	int canShowGoods = (Integer)request.getAttribute("canShowGoods");
  	List<Integer> canshowgoodsbunkid_l = (List<Integer>)request.getAttribute("canshowgoodsbunkid_l");

   %>
  	 请点击选择上架位置：
   <table>
		<tr>
		<%
			for(int i = 0;showNo<canShowGoods;showNo++){
				if(i<canshowgoodsbunkid_l.size()){
					if(canshowgoodsbunkid_l.get(i) == showNo+1){
						i ++;
						if(showNo%divisor == 0){  //可以上架位置
							%>
						<tr/><tr>
							<td>
							<div id="<%=showNo+1 %>" onclick="keepid(this);" class="div1"><span class="text"><%=showNo+1 %></span></div>
							</td>
					<%
						}else{
						
						%>
						<td>
							<div id="<%=showNo+1 %>" onclick="keepid(this);" class="div1"><span class="text"><%=showNo+1 %></span></div>
							</td>
							<%
						}
					}else{ //已经上架位置
						if(showNo%divisor == 0){
							%>
						<tr/><tr>
							<td>
							<div class="div2"><span class="text"><%=showNo+1 %></span><br/>已有商品</div>
							</td>
					<%
						}else{
						
						%>
						<td>
							<div class="div2"><span class="text"><%=showNo+1 %></span><br/>已有商品</div>
							</td>
							<%
						}
					}
				}else{
					if(showNo%divisor == 0){  //可以上架位置
							%>
						<tr/><tr>
							<td>
							<div id="<%=showNo+1 %>" onclick="keepid(this);" class="div1"><span class="text"><%=showNo+1 %></span></div>
							</td>
					<%
						}else{
						
						%>
						<td>
							<div id="<%=showNo+1 %>" onclick="keepid(this);" class="div1"><span class="text"><%=showNo+1 %></span></div>
							</td>
							<%
						}
				}
				
			}
		 %>	
		</tr>
	</table> 
	<input type="submit" onclick="putaway();" value="上架"/>
</body>
</html>