<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script src="${pageContext.request.contextPath}/ScatteredGrid/js/jquery-1.5.1.min.js" type="text/javascript"></script>
<script type="text/javascript">
    $(function () {
    
    	var height = $("body").height();
		$("#rightIframe",parent.document.body).height(height + 50);
    
        var x = 10;
        var y = 10;
        $("div.tooltip").mouseover(function (e) {
            this.myTitle = this.title;
            this.title = "";
            var tooltip = "<div id='tooltip'><img src='" + $("#midimg").attr("src") + "' alt='预览图' class='aaa'/><\/div>";
            $("body").append(tooltip);
            $("#tooltip")
			.css({
			    "top": (e.pageY + y) + "px",
			    "left": (e.pageX + x) + "px"                
			}).show("fast");
        }).mouseout(function () {
            this.title = this.myTitle;
            $("#tooltip").remove();
        }).mousemove(function (e) {
            $("#tooltip")
			.css({
			    "top": (e.pageY + y) + "px",
			    "left": (e.pageX + x) + "px"
			});
        });
        
        var $beforeonclick = $("#pic2");
        $("#pic2").click(function (){
        	$(this).attr("class","select");
        	$beforeonclick.attr("class","unselect");
        	$beforeonclick = $(this);
 			var srcvalue = $("#pic21").attr("src");
 			$("#midimg").attr("src",srcvalue);
 			$("#imghref").attr("href",srcvalue);
        });
        
        $("#pic3").click(function (){
        	$(this).attr("class","select");
        	$beforeonclick.attr("class","unselect");
        	$beforeonclick = $(this);
 			var srcvalue = $("#pic31").attr("src");
 			$("#midimg").attr("src",srcvalue);
 			$("#imghref").attr("href",srcvalue);
        });
        $("#pic4").click(function (){
        	$(this).attr("class","select");
        	$beforeonclick.attr("class","unselect");
        	$beforeonclick = $(this);
 			var srcvalue = $("#pic41").attr("src");
 			$("#midimg").attr("src",srcvalue);
 			$("#imghref").attr("href",srcvalue);
        });
      	
		$("#amend").click(function (){
			var goods_id = $("#goods_id").attr("value");
			var goods_name = $("#goods_name").text();
			var goods_type_name = $("#goods_type_name").attr("value");
			var goods_price = $("#goods_price").text();
			var market_price = $("#market_price").text();
			var goods_hasamount = $("#goods_hasamount").text();
			var residual_mount = $("#residual_mount").text();
			var goods_info = $("#goods_info").val();
			$("#rightIframe",parent.document.body).attr("src","${pageContext.request.contextPath}/ScatteredGrid/manage/manageUploadGoods.jsp?goods_id="+goods_id+"&goods_name="+goods_name+"&goods_type_name="+goods_type_name+"&goods_price="+goods_price+"&market_price="+market_price+"&goods_hasamount="+goods_hasamount+"&residual_mount="+residual_mount+"&goods_info="+goods_info);
		});
    })
    
  	
</script>
<style type="text/css">
    #body1
    {
        width:700px;
        margin:0 auto;
        }
    #good
    {
        width:680px;
        height:30px;
        font-size:24px;
        padding-left:15px;
        }
    #box
    {
        width:300px;
        height:400px;
        float:left;
        margin:10px;
        }
    #pic1
    {
        width:285px;
        height:285px;
        margin:6px;      
        }
    .pic01
    {
        width:276px;
        height:276px;
        margin-left:5px;
        }
    #pic2 ,#pic3 ,#pic4
    {
        width:83px;
        height:83px;
        padding:1px;
        float:left;
        margin-left:10px;
        }   
    .pic
    {
        width:81px;
        height:81px;
        margin-top:1px;
        margin-left:1px;
        }
    #tooltip{
	    position:absolute;
	    display:none;
        }
    .aaa
    {
        width:500px;
        height:500px
        }
    #jiage
    {
        width:350px;
        height:400px;
        margin:10px;
        float:left;
        }
    .jiage1
    {
        width:120px;
        height:30px;
        padding-top:3px;
        font-size:24px;
        margin:20px 10px;
        float:left;
        }
     .jiage2
     {
        width:200px;
        height:30px;
        padding-top:3px;
        font-size:24px;
        margin:20px 5px;
        float:left;
        }       
    .message
    {
        width:680px;
        height:auto;
        font-size:20px;
        margin:5px;
        padding-left:10px;
		
        }  
    .select
    {	
    	border: 1px solid #1efae8;
    	} 
    .unselect
    {	
    	} 
    .boxclass
    {	
    	border: 1px solid #bfc4c3;
    	}  
	 #box1
    {
        width:260px;
        height:20px;
        }
    
	#div_sure{
		width:590px;
        height:auto;
        float:right;
	}
	
	.text_red{
		color: red;
	}

	.text_black{
		color: black;
	}
            
</style>
    <title></title>
</head>
<body>
<div id="body1">
<div>
<%String ref = request.getHeader("REFERER");%>
<a href="" onclick="javascript:window.location='<%=ref%>'" target="iframe">返回上一步</a>
</div>
<div id="good">
<div style="margin:0px 5px;float:left;width:550px">
<s:if test="scatteredGridGoods.Status==2">
	（旧库存）
</s:if>
<s:elseif test="scatteredGridGoods.Status==1">
	（已上架）
</s:elseif>
<s:else>
	（已下架）
</s:else>
<span id="goods_name"><s:property value="scatteredGridGoods.goods_name" /></span>
</div>
<s:if test="scatteredGridGoods.Status!=2">
<div style=" margin:0px 5px;float:left;">
<s:url id="url" action="findGoods_updata">
        <s:param name="goods_id"><s:property value="scatteredGridGoods.goods_id"/></s:param>
</s:url>
<s:a href="%{url}">[修改]</s:a>
</div>
</s:if>
</div>
<div id="box" class="boxclass">
<div id="pic1" class="tooltip" ><img id="midimg" class="pic01" src="<s:text name="imgPath" />/<s:property value="gridid"/>/<s:property value="goods_id"/>/<s:property value="scatteredGridGoods.goods_photoname1"/>" alt="2" /></div>
<div id="pic2" class="select"><img class="pic" src="${pageContext.request.contextPath}<s:text name="imgPath" />/<s:property value="gridid"/>/<s:property value="goods_id"/>/<s:property value="scatteredGridGoods.goods_photoname1"/>" alt="2" id="pic21" /></div>
<div id="pic3"><img class="pic" src="${pageContext.request.contextPath}<s:text name="imgPath" />/<s:property value="gridid"/>/<s:property value="goods_id"/>/<s:property value="scatteredGridGoods.goods_photoname2"/>" alt="2" id="pic31"/></div>
<div id="pic4"><img class="pic" src="${pageContext.request.contextPath}<s:text name="imgPath" />/<s:property value="gridid"/>/<s:property value="goods_id"/>/<s:property value="scatteredGridGoods.goods_photoname3"/>" alt="2" id="pic41"/></div>
</div>
<div id="jiage">

<div id="dangqian" class="jiage1">当前价：</div>
<div id="dangqian2" class="jiage2">
	<span id="goods_price"><s:property value="scatteredGridGoods.goods_price" /></span>
</div>

<div id="shichang" class="jiage1">市场价：</div><div id="shichang1" class="jiage2"><span id="market_price"><s:property value="scatteredGridGoods.market_price" /></span></div>
<div id="shuliang" class="jiage1">原本数量：</div><div id="shuliang2" class="jiage2"><span id="goods_hasamount"><s:property value="scatteredGridGoods.goods_hasamount" /></span></div>
<div id="shuliang" class="jiage1">剩余数量：</div><div id="shuliang2" class="jiage2"><span id="residual_mount"><s:property value="scatteredGridGoods.residual_mount" /></span></div>
</div>
<div class="message">
	<div style="width:670px; text-align:left; float:left;">商品信息：</div>
  	<div style="width:670px; white-space:normal; word-break :break-all;">
  	<s:if test="scatteredGridGoods.goods_info == null || scatteredGridGoods.goods_info.length()==0">
  		&nbsp;
  	</s:if>
  	<s:else>
  	<s:property value="scatteredGridGoods.goods_info"  escape="false"/>
  	</s:else>
  	</div>
</div>
</div>
</body>
</html>
