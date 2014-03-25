$(document).ready(function () {
		$("#foreign").click(function(){
			$("#isHasTranslator").show();
	
		});
		$("#chain").click(function(){
			$("#isHasTranslator").hide();
	
		});	
			$("form :input.required1").each(function(){
				var $required=$("<strong class='high'>*</strong>");	
				$(this).parent().append($required);
			});
			$("form :input").blur(function(){
				var $parent=$(this).parent();
				$parent.find(".formtips").remove();
				
				if($(this).is('#name')){
					var Msg='请正确输入图书名称';						
					if(this.value==""){
						$parent.append('<span class="formtips onError">'+Msg+'</span>');												
					}else{
						$parent.append('<span class="formtips onSuccess">'+Msg+'</span>');
					}
				}
				
				if($(this).is('#fileupload')){
					var Msg='请正确选择图书封面';
					if(this.value==""){						
						$parent.append('<span class="formtips onError">'+Msg+'</span>');													
					}else{
						$parent.append('<span class="formtips onSuccess">'+Msg+'</span>');
					}
				}
				
				if($(this).is('#content_summary')){
					var Msg='请正确输入图书简介';
					if(this.value==""){						
						$parent.append('<span class="formtips onError">'+Msg+'</span>');													
					}else{
						$parent.append('<span class="formtips onSuccess">'+Msg+'</span>');
					}
				}
				
				if($(this).is('#isbn')){
					var Msg='请正确输入ISBN';
					if(this.value==""){						
						$parent.append('<span class="formtips onError">'+Msg+'</span>');													
					}else{
						$parent.append('<span class="formtips onSuccess">'+Msg+'</span>');
					}
				}
				
				if($(this).is('#author')){
					var Msg='请正确输入图书作者';
					if(this.value==""){						
						$parent.append('<span class="formtips onError">'+Msg+'</span>');													
					}else{
						$parent.append('<span class="formtips onSuccess">'+Msg+'</span>');
					}
				}
				

				
				if($(this).is('#publish_company')){
					var Msg='请正确输入出版社';
					if(this.value==""){						
						$parent.append('<span class="formtips onError">'+Msg+'</span>');													
					}else{
						$parent.append('<span class="formtips onSuccess">'+Msg+'</span>');
					}
				}
				
				if($(this).is('#storage_num')){
					var Msg='请正确输入图书库存';
					if(this.value==""){						
						$parent.append('<span class="formtips onError">'+Msg+'</span>');													
					}else{
						$parent.append('<span class="formtips onSuccess">'+Msg+'</span>');
					}
				}
				
				
				if($(this).is('#select_small')){
					var Msg='请正确选择图书分类';
					var secondCatagory=$("#select_small option:selected").text();
					if(secondCatagory=="--请选择二级分类--"){						
						$parent.append('<span class="formtips onError">'+Msg+'</span>');													
					}else{
						$parent.append('<span class="formtips onSuccess">'+Msg+'</span>');
					}
				}
				
				if($(this).is('#price')){
					var Msg='请正确输入图书原价';
					var reg = new RegExp("^(([0-9]+\\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\\.[0-9]+)|([0-9][1-9]*[0-9]*))$"); //匹配正浮点数
					if(this.value==""||!reg.test(this.value)){						
						$parent.append('<span class="formtips onError">'+Msg+'</span>');													
					}else{
						$parent.append('<span class="formtips onSuccess">'+Msg+'</span>');
					}
				}
			}).keyup(function(){
				$(this).triggerHandler("blur");
			}).focus(function(){
				$(this).triggerHandler("blur");	
			});
			$('#send').click(function(){
				$("form .required1:input").trigger('blur');
							
				
				$(".publish_date").parent().find(".formtips").remove();
				if($(".publish_date").val()==""){
					$(".publish_date").parent().append('<span class="formtips onError">'+"请正确输入日期"+'</span>');
				}else{
					$(".publish_date").parent().append('<span class="formtips onSuccess">'+"请正确输入日期"+'</span>');
				}		
				var numError=$('form .onError').length;
				if(numError!=0){
					return false;
				}else{
				
					var fileupload=$("#fileupload").val();
					//生成guid
					var guid = (G() + G() + "-" + G() + "-" + G() + "-" + 
						G() + "-" + G() + G() + G()).toUpperCase();
					//拼接图片
					var guidImage = guid+fileupload.substring(fileupload.indexOf("."));
					$(".book_image").attr("value",guidImage);
					alert(guidImage);
					var imageFile="cover";
					var options = {
					url: "uploadFile.do?fileuploadFileName="+fileupload+"&guid="+guid+"&imageFile="+imageFile,
					type : "POST",
					dataType : "script",
			
					error:function(data){
							
					},
					success : function(msg) {

					}
					};
					$("#form").ajaxSubmit(options);
				}				
			});
	
	$("#select_big").focus(function(){
		$("#select_small").val('--请选择二级分类--');
	});
	
	$("#select_small").focus(function(){
		var id=$("#select_big").val();	
		$.ajax({
			type: "POST",
			url: "findSecondCatagory.do?catagory.catagory_id="+id,
			dataType: 'json',
			async: false,
			error:function(data){
							
			},
			success: function(msg){
				var	message="";			
				$("#select_small").find(".board").remove();	
				message+="<option id='option' value='--请选择二级分类--'>--请选择二级分类--</option>";			
				for(var i=0;i<msg.length;i++){
					message+="<option class='board' value='"+msg[i].catagory_id+"'>"+msg[i].catagory_name+ "</option>";
				}	
				$("#select_small").html(message);															
			}							
		});	
	});
	function G() {
		return (((1 + Math.random()) * 0x10000) | 0).toString(16).substring(1)
	}
	
});