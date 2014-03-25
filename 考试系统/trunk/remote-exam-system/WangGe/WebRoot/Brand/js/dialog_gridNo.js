// JavaScript Document
$(function(){	
	$("#grid_num").hide();
	$("#addgoods_no").hide();
		var grid_num = $("#grid_num").attr("value");
		$("#namewordcount").html(grid_num.length + "/5字");
		var addgoods_no = $("#addgoods_no").attr("value");
		$("#namewordcount2").html(addgoods_no.length + "/5字");
		//提交，最终验证。
		 $('#sure').click(function(){
			 if($("#xgno").attr("checked")=="checked"){
			 	gridNokeyup();
			 }
			 if($("#xggno").attr("checked")=="checked"){
			 	addgoods_nokeyup();
			 }
				var numError = $('.onError').length;
				if(numError){
					return false;
				}else{
					sure();
					return true;
				}
		 });
		 
		 $("#xgno").click(function(){
			 	var $parent = $("#span");
				$parent.find(".formtips1").remove();
				if(this.checked){
					$("#grid_num2").hide();
					$("#grid_num").show();
				}else{
					$("#grid_num").attr("value",$("#grid_num2").text());
					$("#grid_num2").show();
					$("#grid_num").hide();
				}
		 });
		 $("#xggno").click(function(){
			 	var $parent = $("#span2");
				$parent.find(".formtips1").remove();
				if(this.checked){
					$("#addgoods_no").show();
					$("#addgoods_no2").hide();
				}else{
					$("#addgoods_no").attr("value",$("#addgoods_no2").text());
					$("#addgoods_no2").show();
					$("#addgoods_no").hide();
				}
		 });
		 $("#grid_num").click(function(){
			 	return false;
		 });
		 $("#addgoods_no").click(function(){
			 	return false;
		 });
})
	function res(){
		var $parent = $("#span");
		$parent.find(".formtips1").remove();
		$parent = $("#span2");
		$parent.find(".formtips1").remove();
		$("#addgoods_no").attr("value",$("#addgoods_no2").text());
		$("#grid_num").attr("value",$("#grid_num2").text());
	}

	function sure() {
			var $grid_num = $("#grid_num");
			var gridNew = $grid_num.val();
			var gridOld = $grid_num.attr("name");
			
			if(gridNew.length == 0 || gridNew==gridOld){
				gridNew = "";
			}
			
			var $addgoods_no = $("#addgoods_no");
			var gridNew2 = $addgoods_no.val();
			var gridOld2 = $addgoods_no.attr("name");
			if(gridNew2.length == 0 || gridNew2==gridOld2){
				gridNew2 = "";
			}
			if(gridNew.length == 0 && gridNew2.length == 0){
				alert("请修改信息！");
			}else{
				var brandgrid_grid_id = $("#gridid").val();
				$("#iframe",window.parent.parent.parent.document.body).attr("src","updataGridNo_brandowner.do?brandgrid_grid_id=" +brandgrid_grid_id+ "&grid_num=" + gridNew+"&addgoods_no="+gridNew2);
		 		$(window.parent.document).find("#floatBox .title span").trigger('click');	 
			}
		}

 			var namebeforevalue = "";
 			var namebeforevalue2 = "";
			function gridNokeyup(){
			 		var grid_num = $("#grid_num").attr("value");
			 		var $parent = $("#span");
			 		$parent.find(".formtips1").remove();
			  		var param = "grid_num=" + grid_num;
			  		if(grid_num!=""){
						$.ajax({
							type: "POST",
							url: "/WangGe/justGridNo_owner.do",
							data: param,
							dataType: 'text',
							error:function(data){
								
							},
							success: function(data){
								if(data=="success"){
							    	$parent.append('<span class="formtips1 onSuccess">&nbsp;</span>');
								}else{
									var errorMsg = '该编号已存在.';
			                        $parent.append('<span class="formtips1 onError">'+errorMsg+'</span>');
								}	
							},
							complete:function(data){
								if(grid_num.length >5){
						  			$("#grid_num").val(namebeforevalue);		
						  			return;
						  		}
						  		if(gridname.length == 5){
						  			$("#namewordcount").attr("class","text_red");
						  		}else{
						  			$("#namewordcount").attr("class","text_black");
						  		}
						  		namebeforevalue = grid_num;
						  		$("#namewordcount").html(grid_num.length + "/5字");
						  		return;
							}
						});
					} 
			  	}
			function addgoods_nokeyup(){
		 		var addgoods_no = $("#addgoods_no").attr("value");
		 		var $parent = $("#span2");
		 		$parent.find(".formtips1").remove();
		  		var param = "addgoods_no=" + addgoods_no;
		  		if(addgoods_no!="" && addgoods_no<99999){
					$.ajax({
						type: "POST",
						url: "/WangGe/justGridAddgoods_no_owner.do",
						data: param,
						dataType: 'text',
						error:function(data){
							
						},
						success: function(data){
							if(data=="success"){
						    	$parent.append('<span class="formtips1 onSuccess">&nbsp;</span>');
							}else{
								var errorMsg = '该编号已存在.';
		                        $parent.append('<span class="formtips1 onError">'+errorMsg+'</span>');
							}	
						},
						complete:function(data){
							if(addgoods_no.length >5){
					  			$("#addgoods_no").val(namebeforevalue2);		
					  			return;
					  		}
					  		if(addgoods_no.length == 5){
					  			$("#namewordcount2").attr("class","text_red");
					  		}else{
					  			$("#namewordcount2").attr("class","text_black");
					  		}
					  		namebeforevalue2 = addgoods_no;
					  		$("#namewordcount2").html(addgoods_no.length + "/5字");
					  		return;
						}
					});
				}else{ 
					var errorMsg = '一定要数字.';
                    $parent.append('<span class="formtips1 onError">'+errorMsg+'</span>');
				}
		  	}