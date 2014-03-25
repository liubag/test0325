<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title></title>
		<link href="${pageContext.request.contextPath}/ScatteredGrid/css/showuploadphotostyle.css" rel="stylesheet" type="text/css" />
		<script src="${pageContext.request.contextPath}/ScatteredGrid/js/jquery-latest.pack.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/ScatteredGrid/js/dialog.js" type="text/javascript"></script>
		 <script src="${pageContext.request.contextPath}/ScatteredGrid/js/jquery-1.5.1.min.js" type="text/javascript"></script>
		 <script type="text/javascript" src="${pageContext.request.contextPath}/kindeditor/kindeditor-min.js" charset="UTF-8"></script>
<script type="text/javascript">
		KE.show({
			 id : "editor",
		     width : "670px",
		     height : "200px",		    
		     resizeMode : 1,
		     allowFileManager : true,
		     /*图片上传的SERVLET路径*/
		     imageUploadJson : "${pageContext.request.contextPath}/uploadImage.html", 
		     /*图片管理的SERVLET路径*/     
		     fileManagerJson : "${pageContext.request.contextPath}/uploadImgManager.html",
		     /*允许上传的附件类型*/
		     accessoryTypes : "doc|xls|pdf|txt|ppt|rar|zip",
		     /*附件上传的SERVLET路径*/
		     accessoryUploadJson : "${pageContext.request.contextPath}/uploadAccessory.html"
		    	
		});
	</script>
		 <script type="text/javascript">
		 	$(function(){
			 	$(document).ready(function(){
			 		$("#formupload").hide();
			 		$("#myDialog").show();
			  		var marker = $("#marker").attr("value");
			  		var marker2 = $("#marker2").attr("value");
			  		if(marker2.length == 0){
			  			if(marker!=""){
			  				if(marker == "turnold_fail_full"){
			  					alert("可用空间已满！");
			  					$(window.parent.document).find("#floatBox .title span").trigger('click');
			  				}else{
			  					alert("上传图片失败！" + marker);
			  					$("#formupload").show();
			  				}
				  			
				  		}else{
				  			var page = $("#page").attr("value");
				  			$("#rightIframe",window.parent.parent.parent.document.body).attr("src","showAllGoods_by_page_user.do?page=" + page + "&goodstatu=2");
			 				$(window.parent.document).find("#floatBox .title span").trigger('click');	 
				  		}
			  		}
			  		$("#formupload").show();
			 		$("#myDialog").hide();	
			  	});
		 		
		 		
		 		//如果是必填的，则加红星标识.
				$("form :input.required").each(function(){
					var $required = $("<strong class='high'> *</strong>"); //创建元素
					$(this).parent().append($required); //然后将它追加到文档中
				});
				
				$("#goodsinfo").each(function(){
					var $required = $("<strong class='high'> *</strong>"); //创建元素
					$(this).parent().append($required); //然后将它追加到文档中
				});
				
		         //文本框失去焦点后
			    $('form :input').blur(function(){
			    	var $parent = $(this).parent();
					$parent.find(".formtips").remove();
					  if( $(this).is('#file11') ){
							if( this.value=="" ){
							    var errorMsg = '不能为空.';
		                        $parent.append('<span class="formtips onError">'+errorMsg+'</span>');
							}else{
							    var okMsg = '输入正确.';
							    $parent.append('<span class="formtips onSuccess">'+okMsg+'</span>');
							}
					 }
					 
					  if( $(this).is('#file12') ){
							if( this.value=="" ){
							    var errorMsg = '不能为空.';
		                        $parent.append('<span class="formtips onError">'+errorMsg+'</span>');
							}else{
							    var okMsg = '输入正确.';
							    $parent.append('<span class="formtips onSuccess">'+okMsg+'</span>');
							}
					 }
					 
					 if( $(this).is('#file13') ){
							if( this.value=="" ){
							    var errorMsg = '不能为空.';
		                        $parent.append('<span class="formtips onError">'+errorMsg+'</span>');
							}else{
							    var okMsg = '输入正确.';
							    $parent.append('<span class="formtips onSuccess">'+okMsg+'</span>');
							}
					 }
					 
					 
				}).keyup(function(){
				   $(this).triggerHandler("blur");
				}).focus(function(){
			  	   $(this).triggerHandler("blur");
				});//end blur
		
				
				//提交，最终验证。
				 $('#send').click(function(){
						$("form :input.required").trigger('blur');
						$("#goodsinfo").trigger('blur');
						var numError = $('form .onError').length;
						if(numError){
							return false;
						}
						var txt = $("#editor").val();
						var arr = new Array();
						arr = txt.split("<img src=");
						var hm = arr.length;
						hm = hm *1 - 1;
						if(hm >= 10){
							alert("图片不能超过10张！当前为" + hm + "张.");
							return false;
						}
		
						if(txt.length >=1500){
							alert("内容不能超过1500字符！当前为："+txt.length+ "字.");
							return false;
						}
						$("#formupload").hide();
			 			$("#myDialog").show();
				 });
				 
				//重置
				 $('#res').click(function(){
						$(".formtips").remove(); 
				 });
		 		
		 	});
		 	
		 	
		 	
		 </script>
		 
		  
	</head>

	<body>
	
	<%
		String goodsid = request.getParameter("goodsid");
		String page3 = request.getParameter("page");
		String marker2 = request.getParameter("marker2");
		if(goodsid == null){
			goodsid = "";
			page3 = "";
			marker2 = "";
		}
		
		%>
		<input type="hidden" value="<%=marker2 %>" id="marker2"/>
		<input type="hidden" value="<s:property value="marker"/>" id="marker"/>
		<input type="hidden" value="<s:property value="page"/>" id="page"/>
		<s:form action="turnToTheUndercarriage" method="post"
			enctype="multipart/form-data" theme="simple" autocomplete="off" id="formupload">
	  	<input type="hidden" value="<%=goodsid %>" id="goods_id" name="goods_id"/>
		<div class="int">
			<label for="file11">图片1：</label>
			<input type="file" name="file" id="file11" class="required" style="ime-mode:Disabled"/>
		</div>
		<div class="int">
			<label for="file12">图片2：</label>
			<input type="file" name="file" id="file12" class="required" style="ime-mode:Disabled"/>
		</div>
		<div class="int">
			<label for="file13">图片3：</label>
			<input type="file" name="file" id="file13" class="required" style="ime-mode:Disabled"/>
		</div>
		<div class="">
			<label for="goodsinfo">详细介绍(图片不超过10张，html代码（编辑器左上角第一个按钮可查看）不超过500字符):</label>
			<textarea id="editor" name="goods_info" rows="" cols="" style="width: 400px; height: 200px; visibility: hidden;">
		 			
		 		</textarea>
		</div>
		<div class="sub">
			<input type="submit" value="确定上传" id="send"/><input type="reset" id="res"/>
		</div>
	 </s:form>
		
	
	<div id="myDialog" title="My Dialog" style="display:none;background-color: blue;">  
			<div id="dialogContent" style="overflow-y: auto; height: 100%;">  
				<span class="blue13">waiting..</span>  
			</div>   
	</div>  
	</body>
</html>
