<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>


<style type="text/css">
* {margin:0; padding:0;}
body {font-size:12px; color:#222; font-family:Verdana,Arial,Helvetica,sans-serif; background:#f0f0f0;}
.clearfix:after {content: "."; display: block; height: 0; clear: both; visibility: hidden;}
.clearfix {zoom:1;}
ul,li {list-style:none;}
img {border:0;}

.wrapper {width:600px; margin:0 auto; padding-bottom:50px;}
.ad {width:468px; margin:10px auto 0;}
.ad li {padding-top:5px;}

h1 {height:50px; line-height:50px; font-size:22px; font-weight:normal; font-family:"Microsoft YaHei",SimHei;}

.shuoming {margin-top:20px; border:1px solid #ccc; padding-bottom:10px;}
.shuoming dt {height:30px; line-height:30px; font-weight:bold; text-indent:10px;}
.shuoming dd {line-height:20px; padding:5px 20px;}

.wrapper {width:780px;}
/* tmall focus */
#focus {width:780px; height:380px; overflow:hidden; position:relative;}
#focus ul {height:380px; position:absolute;}
#focus ul li {float:left; width:780px; height:380px; overflow:hidden; position:relative; background:#000;}
#focus ul li div {position:absolute; overflow:hidden;}
#focus .btnBg {position:absolute; width:780px; height:40px; left:0; bottom:0; background:#000;}
#focus .btn {position:absolute; width:770px; height:24px; left:0; bottom:8px; padding-left:10px;}
#focus .btn span {display:inline-block; _display:inline; _zoom:1; width:24px; height:24px; line-height:24px; text-align:center; font-size:20px; font-family:"Microsoft YaHei",SimHei; margin-right:10px; cursor:pointer; color:#fff;}
#focus .btn span.on {background:#000; color:#fcc;}
</style>

<!--<script type="text/javascript" src="js/jquery-1.6.4.min.js"></script>-->
<script type="text/javascript">
$(function() {
	var sWidth = $("#focus").width(); 
	var len = $("#focus ul li").length; 
	var index = 0;
	var picTimer;
	var btn = "<div class='btnBg'></div><div class='btn'>";
	for(var i=0; i < len; i++) {
		btn += "<span>" + (i+1) + "</span>";
	}
	btn += "</div>"
	$("#focus").append(btn);
	$("#focus .btnBg").css("opacity",0.5);
	$("#focus .btn span").mouseenter(function() {
		index = $("#focus .btn span").index(this);
		showPics(index);
	}).eq(0).trigger("mouseenter");
	
	
	$("#focus ul").css("width",sWidth * (len + 1));
	
	
	$("#focus ul li div").hover(function() {
		$(this).siblings().css("opacity",0.7);
	},function() {
		$("#focus ul li div").css("opacity",1);
	});
	
	
	$("#focus").hover(function() {
		clearInterval(picTimer);
	},function() {
		picTimer = setInterval(function() {
			if(index == len) { 
				showFirPic();
				index = 0;
			} else { 
				showPics(index);
			}
			index++;
		},3000);
	}).trigger("mouseleave");
	
	
	function showPics(index) { 
		var nowLeft = -index*sWidth; 
		$("#focus ul").stop(true,false).animate({"left":nowLeft},500); 
		$("#focus .btn span").removeClass("on").eq(index).addClass("on");
	}
	
	function showFirPic() { 
		$("#focus ul").append($("#focus ul li:first").clone());
		var nowLeft = -len*sWidth; 
		$("#focus ul").stop(true,false).animate({"left":nowLeft},500,function() {
			$("#focus ul").css("left","0");
			$("#focus ul li:last").remove();
		}); 
		$("#focus .btn span").removeClass("on").eq(0).addClass("on"); 
	}
});

</script>
</head>

<body>
<div class="wrapper">
	<div id="focus">
		<ul>
		<!--start-->
			<li class="ggao" id="1201247121929">
<div style="left:0; top:0; width:780px; height:380px;"><a href="http://localhost:8080/WangGe/admin/manage.jsp" target="_blank"><img src="${pageContext.request.contextPath}/../WGPhoto/guanggao_img/201247121929.jpg"/></a></div>
</li>
<li class="ggao" id="2201247122425">
<div style="left:0; top:0; width:560px; height:380px;"><a href="http://localhost:8080/WangGe/admin/manage.jsp" target="_blank"><img src="${pageContext.request.contextPath}/../WGPhoto/guanggao_img/2012471224251.jpg" /></a></div>
<div style="right:0; top:0; width:220px; height:140px;"><a href="http://localhost:8080/WangGe/admin/manage.jsp" target="_blank"><img src="${pageContext.request.contextPath}/../WGPhoto/guanggao_img/2012471224252.jpg" /></a></div>
<div style="right:0; top:140px; width:220px; height:140px;"><a href="http://localhost:8080/WangGe/admin/manage.jsp" target="_blank"><img src="${pageContext.request.contextPath}/../WGPhoto/guanggao_img/2012471224253.jpg" /></a></div>
<div style="right:0; bottom:0; width:220px; height:100px;"><a href="http://localhost:8080/WangGe/admin/manage.jsp" target="_blank"><img src="${pageContext.request.contextPath}/../WGPhoto/guanggao_img/2012471224254.jpg" /></a></div>
</li>
<li class="ggao" id="3201247122033">
<div style="left:0; top:0; width:260px; height:210px;"><a href="http://localhost:8080/WangGe/admin/manage.jsp" target="_blank"><img src="${pageContext.request.contextPath}/../WGPhoto/guanggao_img/2012471220331.jpg" /></a></div>
<div style="left:260px; top:0; width:260px; height:210px;"><a href="http://localhost:8080/WangGe/admin/manage.jsp" target="_blank"><img src="${pageContext.request.contextPath}/../WGPhoto/guanggao_img/2012471220332.jpg" /></a></div>
<div style="left:0; top:210px; width:520px; height:170px;"><a href="http://localhost:8080/WangGe/admin/manage.jsp" target="_blank"><img src="${pageContext.request.contextPath}/../WGPhoto/guanggao_img/2012471220333.jpg" /></a></div>
<div style="right:0; top:0; width:260px; height:380px;"><a href="http://localhost:8080/WangGe/admin/manage.jsp" target="_blank"><img src="${pageContext.request.contextPath}/../WGPhoto/guanggao_img/2012471220334.jpg" /></a></div>
</li>
			<!--end-->
		</ul>
	</div>
	</div>
</body>
</html>