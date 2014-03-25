<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
	<script src="${pageContext.request.contextPath}/admin/js/jquery-1.5.1.min.js" type="text/javascript"></script>
<style type="text/css">
	#box{
		width:980px;
		
	}
	.add_grid{
		width:150px;
		height:150px;
		margin-left:8px;
		margin-top:8px;
		background:#E1E1E1;
		float:left;
	}
	.grid{
		width:150px;
		height:150px;
		margin-left:8px;
		margin-top:8px;
		background:#00CCCC;
		float:left;
	}
	.new_grid{
		width:150px;
		height:150px;
		margin-left:8px;
		margin-top:8px;
		background:#00CCCC;
		float:left;
	}
	
	.i_grid{
		width:100%;
		height:25px;
		background:#CCCCCC;
		text-align:center;
		font-size:12px;
	}
	.i_grid_add{
		width:100%;
		height:25px;
		background:#CCCCCC;
		text-align:center;
		font-size:12px;
	}
	.in_grid{
		width:50px;
		height:50px;
		margin-left:50px;
		margin-right:50px;
		background-image: url("${pageContext.request.contextPath}/admin/pic/dele_1.gif");
	}
	.in_grid_add{
		width:50px;
		height:50px;
		margin-left:50px;
		margin-right:50px;
		background-image: url("${pageContext.request.contextPath}/admin/pic/add_1.gif");
	}
	.in_grid_no{
		width:50px;
		height:50px;
		margin-left:50px;
		margin-right:50px;
		background-image: url("${pageContext.request.contextPath}/admin/pic/no_1.gif");
	}
	.grid_no{
		width:150px;
		height:150px;
		margin-left:8px;
		margin-top:8px;
		background:#666666;
		float:left;
	}
	
	
</style>
<script type="text/javascript">
	
		$(function(){
			var height = $(document).height();
			$("#rightIframe",parent.document.body).height(height + 50);
			$("#sure").hide();
			var yb = $("#yb").html();
			var hasdm = null;
			var hasum = null;
			var has = null;
			var hasdmid_str = "";
			$(".in_grid").click(function (){
				var id = $(this).attr("id");
				
				if(!confirm('是否确定要删除格子编号为：' + id +' 的格子？')){
					return false;
				}else{
					$("#grid"+id).hide();
					hasdm = $("#hasdm").html();
					has = $("#has").html();
					var num = hasdm*1 + 1;
					$("#hasdm").html(num);
					$("#has").html(has*1 - 1);
					$("#sure").show();
					hasdmid_str = hasdmid_str + "," + id;
					return true;
				}	
			});
			
			
			
			$(".in_grid_add").click(function (){
				var number = $("#number").attr("value");
				var isa = true;
				if(number.length > 0){
					$(".i_grid").each(function(){
						if(number == $(this).html()){
							alert("该编号：" + number + ",已经存在！");
							isa = false;
						}
					})
					if(isa){
						var $div_1 = $("<div class='new_grid' id='" +  number + "'><div class='i_grid'><span style='color:#FF0000;'>(新)</span>未分配</div><div class='i_grid' >" + number +"</div><div class='in_grid' onclick='dele_new(this.id);'></div></div>");	//  创建元素
						$div_1.insertAfter($("#add_grid"));
						hasum = $("#hasum").html();
						has = $("#has").html();
						var num = hasum*1 + 1;
						$("#hasum").html(num);
						$("#has").html(has*1 + 1);
						$("#sure").show();
					}
				}else{
					alert("请输入编号！");
				}
			});
			
			$("#makesure").click(function (){
				var hasadd_str = "";
				$(".new_grid").each(function(){
					if($(this).is(":hidden")){
						
					}else{
						hasadd_str = hasadd_str + "," + $(this).attr("id");
					}
				})
				var brandgrid_id = $("#brandgrid_id").attr("value");
				has = $("#has").html();
				if(has==yb){
					alert("格子数量没有发生变化！无效操作！");
				}else{
					var str = "增加格子编号：" + hasadd_str + "\n  删除格子编号：" + hasdmid_str + "\n 最终格子数：" + has ; 
					if(!confirm('是否确定操作：\n\n' + str)){
						return false;
					}else{
						$("#rightIframe",parent.document.body).attr("src","updateHasGrids.do?hasadd_str="+hasadd_str+"&hasdmid_str="+hasdmid_str+"&has="+has+"&brandgrid_id="+brandgrid_id);
						return true;
					}
					
				}
			});
		})
		
		function dele_new(select){
			if(!confirm('是否确定要删除格子编号为：' + select +' 的格子？')){
					return false;
				}else{
					$("#grid"+select).hide();
					hasum = $("#hasum").html();
					has = $("#has").html();
					var num = hasum*1 - 1;
					$("#hasum").html(num);
					$("#has").html(has*1 - 1);
					return true;
				}	
			
		}
	</script>
</head>

<body>
<input type="hidden" value="<s:property value="brandgrid_id"/>" id="brandgrid_id"/>
<div style="width: 980px;">
	<div style="margin-left:10px; float: left; width: 280px;">
		品牌店：<s:property value="brandgrid_name"/>
	</div>
	<div style=" float: left; width: 140px;">
		原本：<span id="yb"><s:property value="allGrid_l.size()"/></span>个
	</div>
	<div style=" float: left; width: 140px;">
		最终：<span id="has"><s:property value="allGrid_l.size()"/></span>个
	</div>
	<div style=" float: left; width: 140px;">
		<div style="width:25px; height:25px; float:left; background-image: url('${pageContext.request.contextPath}/admin/pic/dele_2.gif');"></div>
		<div style="width:105px; float:left;margin-left: 10px;">删除：<span id="hasdm">0</span>个</div>	
	</div>
	<div style=" float: left; width: 140px;">
		<div style="width:25px; height:25px; float:left; background-image: url('${pageContext.request.contextPath}/admin/pic/add_2.gif');"></div>
		<div style="width:105px; float:left; margin-left: 10px;">添加：<span id="hasum">0</span>个</div>	
	</div>
	<div style=" float: left; width: 80px;" id="sure">
		<a href="#" id="makesure">确定修改</a>
	</div>
</div>
<div id="box">
	<!-- 最后一个可添加的格子标志 -->
	<div class="add_grid" id="add_grid">
		<div class="i_grid_add">可添加</div>
		<div class="i_grid_add" ><input name="number" type="text" size="16" id="number" value=""/></div>
		<div class="in_grid_add"></div>
	</div>
	<s:iterator value="allGrid_l" status="st">
	<s:if test="brandgrid_grid_owner_id==brandgrid.brandgrid_id">
	<div class="grid" id="grid<s:property value="brandgrid_grid_number"/>">
		<div class="i_grid">未分配</div>
		<div class="i_grid" ><s:property value="brandgrid_grid_number"/></div>
		<div class="in_grid" id="<s:property value="brandgrid_grid_number"/>"></div>
	</div>
	</s:if>
	<s:else>
	<div class="grid_no">
		<div class="i_grid">已分配</div>
		<div class="i_grid"><s:property value="brandgrid_grid_number"/></div>
		<div class="in_grid_no" id="<s:property value="brandgrid_grid_number"/>"></div>
	</div>
	</s:else>
	</s:iterator>
</div>

</body>
</html>
