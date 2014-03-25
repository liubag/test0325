// JavaScript Document

$(function(){
			
		   $("#xiugai").click(function(){
				$("#tu").css("display","none");
				$("#xiugai").css("display","none");
				$("#shangchuan").css("display","block");
				$("#msure").css("display","block");
			});
			 $("#yes").click(function(){
				var file11 = $("#file11").val();
				if(file11.length==0){
					alert("图片路径不能为空.");
					return false;
				}
				$(this).css("background-color","#D3D3D3");
				$(this).attr("value","上传中...");
				$(this).attr("readonly","readonly");
				$("#no").hide();
				return true;
			});
			 $("#no").click(function(){
				 $("#tu").css("display","block");
					$("#xiugai").css("display","block");
					$("#shangchuan").css("display","none");
					$("#msure").css("display","none");
				});
})
