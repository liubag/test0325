$(document).ready(function () {
	var is_foreign=$("#is_foreign").val();
	if(is_foreign==0){
		$("#isHasTranslator").hide();
	}
	$("#foreign").click(function(){
		$("#isHasTranslator").show();
	});
	$("#chain").click(function(){
		$("#isHasTranslator").hide();
	});	
	$("#modify").click(function(){
		$("#name").attr("disabled",false);
		$("#fileupload").attr("disabled",false);
		$("#content_summary").attr("disabled",false);
		$("#isbn").attr("disabled",false);
		$("#author").attr("disabled",false);
		$("#translator").attr("disabled",false);
		$("#publish_company").attr("disabled",false);
		$("#changeCatagory").attr("disabled",false);
		$("#price").attr("disabled",false);
		$("#send").attr("disabled",false);
		$("#modify").attr("disabled",true);
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
				
				if($(this).is('#price')){
					var Msg='请正确输入图书原价';
					if(this.value==""){						
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
				var bookImage=$("#fileupload").val();					
				var numError=$('form .onError').length;
				if(numError!=0){
					return false;
				}else if(bookImage!=""&&bookImage!=null){
					var fileupload=$("#fileupload").val();
					//生成guid
					var guid = (G() + G() + "-" + G() + "-" + G() + "-" + 
						G() + "-" + G() + G() + G()).toUpperCase();
					//拼接图片
					var guidImage = guid+fileupload.substring(fileupload.indexOf("."));
					$(".book_image").attr("value",guidImage);
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
					$("#update").ajaxSubmit(options);
				}				
			});
	});
	$("#changeCatagory").click(function(){
		$("#getCatagory").slideToggle("slow");
		$("#select_big ").get(0).selectedIndex=0; 
		$("#select_small ").get(0).selectedIndex=0; 
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