<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>hooyes Drag demo</title>
    <script src="js/jquery-1.5.2.js" type="text/javascript"></script>
	<script src="js/jquery.tools.min.js" type="text/javascript"></script>
	<script src="js/move-block.js" type="text/javascript"></script>
	<script src="js/jquery.blockUI.js" type="text/javascript"></script>
	<script src="js/jquery.contextmenu.r2.js" type="text/javascript"></script>
	<script src="js/dragParent.js" type="text/javascript"></script>
	<link rel="stylesheet" type="text/css" href="css/move.css"/>
	
	<script type="text/javascript">
		$(document).ready(function(){
			var map_width =parseInt($("#map").css("width"));
			console.log(map_width);
  			$("#preview").click(function(){
  				$("#parentDiv").css("display","none");
  				$("#map").css("width",parseInt($("#moveDivs").css("width")));
  				$("#editMoveDivs").removeAttr("disabled");
  				$(this).attr("disabled","true");
			});
			
			$("#editMoveDivs").click(function(){
				$("#map").css("width",map_width);
				$("#parentDiv").css("display","block");
				$("#preview").removeAttr("disabled");
  				$(this).attr("disabled","true");
			});
	});
	</script>
	
</head>
<body>
<div id="map">
		<div id = "parentDiv">
			<div id="Div1" class="dragParent" style="top:100px;left:0px;" ><a>&nbsp;hooyesparent</a></div>
			<div id="Div2" class="dragParent" style="top:207px;left:0px;" ><a>hooyes2</a></div>
		</div>
		<div id="subDiv">
			<div id="moveDivs">
				
			</div>
			<div id="buttonDiv">
				<input type="button" id="save" value="保存">
				<input type="button" id="preview" value="预览" >
				<input type="button" id="editMoveDivs" value="编辑" disabled="disabled">
				<input id="div_id" type="hidden" />
				<input type="hidden" id="moveDivs_id" value="1ffc07b4-bc1a-4ae5-a9ac-6f3803e08a86">
			</div>
		</div>
</div>

<div class="contextMenu" id="menu"> 
            <ul> 
                <li id="edit"> 
                    <img src="image/Home_Age_UnSelect.jpg" width="16" height="16" /> 
                    编辑</li> 
                <li id="delete"> 
                    <img src="image/Home_Age_UnSelect.jpg" width="16" height="16" /> 
                    删除</li> 
               
            </ul> 
        </div> 
        
   <div id="login_box">
		<fieldset>
			<h4 class="top_h4">设置消息</h4>
			<a href="#" class="close" title="关闭">close</a>
			<div class="label">
				<p>file</p>
				<input id="file" name="file" type="text" />
			</div>
			<div class="label">
				<p>version</p>
				<input id="version" name="version" type="text"/>
			</div>
			<span class="button2"><a href="#" id="send">提交</a></span>
		</fieldset>
</div> 
</body>
</html>