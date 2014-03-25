// JavaScript Document
$(function(){		   
		//如果是必填的，则加红星标识.
		$("input.required").each(function(){
			var $required = $("<strong class='high'>*</strong>"); //创建元素
			$("#span").append($required); //然后将它追加到文档中
		});
		var gridname = $("#gridname").attr("value");
		$("#namewordcount").html(gridname.length + "/15字");
		
		//提交，最终验证。
		 $('#sure').click(function(){
			 	gridnamekeyup();
				var numError = $('.onError').length;
				if(numError){
					return false;
				}else{
					sure();
					return true;
				}
		 });
})
	function sure() {
			var $gridname = $("#gridname");
			var gridNew = $gridname.val();
			var gridOld = $gridname.attr("name");
			if(gridNew.length == 0 || gridNew==gridOld){
				alert("请修改格子名称！");
			}else{
				$("#giframe",window.parent.parent.parent.document.body).attr("src","updataGridName_gridowner.do?brandgrid_gridname=" + gridNew+"&owner_status=gzxi");
		 		$(window.parent.document).find("#floatBox .title span").trigger('click');	 
			}
		}

 			var namebeforevalue = "";
			function gridnamekeyup(){
			 		var gridname = $("#gridname").attr("value");
			 		var $parent = $("#span");
			 		$parent.find(".formtips1").remove();
			  		var param = "brandgrid_gridname=" + gridname;
			  		if(gridname!=""){
						$.ajax({
							type: "POST",
							url: "/WangGe/justGridName_gridowner.do",
							data: param,
							dataType: 'text',
							error:function(data){
								
							},
							success: function(data){
								if(data=="success"){
							    	$parent.append('<span class="formtips1 onSuccess">&nbsp;</span>');
								}else{
		                        	$parent.append('<span class="formtips1 onError">&nbsp;</span>');
								}	
							},
							complete:function(data){
								if(gridname.length >15){
						  			$("#gridname").val(namebeforevalue);		
						  			return;
						  		}
						  		if(gridname.length == 15){
						  			$("#namewordcount").attr("class","text_red");
						  		}else{
						  			$("#namewordcount").attr("class","text_black");
						  		}
						  		namebeforevalue = gridname;
						  		$("#namewordcount").html(gridname.length + "/15字");
						  		return;
							}
						});
					} 
			  	}