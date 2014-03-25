<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title></title>
		<script src="${pageContext.request.contextPath}/Brand/js/jquery-1.6.4.min.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/Brand/js/dialog_uploadph.js" type="text/javascript"></script>
		<link href="${pageContext.request.contextPath}/Brand/css/dialog_uploadph.css" rel="stylesheet" type="text/css" />
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
	  
	</head>

	<body>
	
	<%
		String goodsid = request.getParameter("goodsid");
		String page3 = request.getParameter("page");
		String statu = request.getParameter("statu");
		String statu_choice = request.getParameter("statu_choice");
		
		%>
		
		<s:form action="turnToTheUGoods_gridowner" method="post"
			enctype="multipart/form-data" theme="simple" autocomplete="off" id="formupload">
		<input type="hidden" value="<%=statu %>" id="statu" name="statu"/>
		<input type="hidden" value="<%=statu_choice %>" id="statu_choice" name="statu_choice"/>
		<input type="hidden" value="<%=page3 %>" id="page" name="page"/>
	  	<input type="hidden" value="<%=goodsid %>" id="goods_id" name="brandgrid_goods_id"/>
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
		
	
	<div id="myDialog" title="My Dialog" style="display:none;text-align:center; padding-top: 100px;">  
			<div style="margin-bottom: 30px;" id="waiting">上传中，请稍后...</div>
			<div>  
				<img alt="" src="../pic/empty_180_180.gif"/> 
			</div>   
	</div> 
	</body>
</html>
