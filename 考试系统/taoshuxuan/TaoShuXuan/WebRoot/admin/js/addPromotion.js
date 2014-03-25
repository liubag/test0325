$(document).ready(function () {
	$("#select_type").change(function () {
		var promotionType=$(this).val();
		if(promotionType==1){
			$(".promotion_money").hide();
			$(".promotion_discount").show();
			
		}else if(promotionType==2){
			$(".promotion_money").show();
			$(".promotion_discount").hide();
		}else if(promotionType==0){
			$(".promotion_money").hide();
			$(".promotion_discount").hide();
		}
	});
	
	$("form :input.required1").each(function(){
		var $required=$("<strong class='high'>*</strong>");	
		$(this).parent().append($required);
	});
	$("form :input").blur(function(){
		var $parent=$(this).parent();
		$parent.find(".formtips").remove();				
		var reg = new RegExp("^(([0-9]+\\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\\.[0-9]+)|([0-9][1-9]*[0-9]*))$"); //匹配正浮点数			
		if($(this).is('#fileupload')){
			var Msg='请正确选择活动封面';
			if(this.value==""){						
				$parent.append('<span class="formtips onError">'+Msg+'</span>');													
			}else{
				$parent.append('<span class="formtips onSuccess">'+Msg+'</span>');
			}
		}
		
		if($(this).is('#select_type')){
			var Msg='请正确选择活动类型';
			if(this.value==0){						
				$parent.append('<span class="formtips onError">'+Msg+'</span>');													
			}else{
				$parent.append('<span class="formtips onSuccess">'+Msg+'</span>');
			}
		}
		
		if($(this).is('#promotion_money')){
			var Msg='请正确输入优惠金额';
			var promotionType=$("#select_type").val();
			if(promotionType==2){	
				if(this.value==0||!reg.test(this.value)){						
					$parent.append('<span class="formtips onError">'+Msg+'</span>');													
				}else{
					$parent.append('<span class="formtips onSuccess">'+Msg+'</span>');
				}		
			}		
		}	
		
		if($(this).is('#promotion_discount')){
			var Msg='请正确输入优惠折扣';
			var promotionType=$("#select_type").val();
			if(promotionType==1){	
				if(this.value==0||!/^(?:0|1|0\.[0-9]+)$/.test(this.value)){						
					$parent.append('<span class="formtips onError">'+Msg+'</span>');													
				}else{
					$parent.append('<span class="formtips onSuccess">'+Msg+'</span>');
				}		
			}		
		}	
		
		if($(this).is('#need_amount')){
			var Msg='请正确输入是要的购书金额';
			if(this.value==0||!reg.test(this.value)){						
				$parent.append('<span class="formtips onError">'+Msg+'</span>');													
			}else{
				$parent.append('<span class="formtips onSuccess">'+Msg+'</span>');
			}
		}
		
		if($(this).is('.catagory_id')){
			var Msg='请正确选择优惠图书';
			if($(".hid").val()==","){						
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
		$(".effective_date").parent().find(".formtips").remove();
		if($(".effective_date").val()==""){
			$(".effective_date").parent().append('<span class="formtips onError">'+"请正确输入日期"+'</span>');
		}else{
			$(".effective_date").parent().append('<span class="formtips onSuccess">'+"请正确输入日期"+'</span>');
		}	
		$(".expiry_date").parent().find(".formtips").remove();
		if($(".expiry_date").val()==""){
			$(".expiry_date").parent().append('<span class="formtips onError">'+"请正确输入日期"+'</span>');
		}else{
			$(".expiry_date").parent().append('<span class="formtips onSuccess">'+"请正确输入日期"+'</span>');
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
			$(".promotion_image").attr("value",guidImage);
			var imageFile="activity";
			var options = {
				url: "uploadFile.do?fileuploadFileName="+fileupload+"&guid="+guid+"&imageFile="+imageFile,
				type : "POST",
				dataType : "script",
				async: false,			
				error:function(data){
							
				},
				success : function(msg) {

				}
			};
			$("#form").ajaxSubmit(options);
		}				
	});
	
	function G() {
		return (((1 + Math.random()) * 0x10000) | 0).toString(16).substring(1)
	}
	
});