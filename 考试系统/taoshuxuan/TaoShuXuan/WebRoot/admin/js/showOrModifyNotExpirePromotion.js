$(document).ready(function () {
	var promotion_type=$("#promotion_type").val();
	$("#select_type").get(0).selectedIndex=promotion_type;
	if(promotion_type==1){
		$(".promotion_discount").show();
	}else if(promotion_type==2){
		$(".promotion_money").show();
	}
	
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
	$("#modify").click(function(){
		$("#fileupload").attr("disabled",false);
		$("#select_type").attr("disabled",false);
		$("#promotion_money").attr("disabled",false);
		$("#promotion_discount").attr("disabled",false);
		$("#need_amount").attr("disabled",false);
		$("#changeCatagory").attr("disabled",false);
		$("#send").attr("disabled",false);
		$("#modify").attr("disabled",true);
		$("form :input.required1").each(function(){
			var $required=$("<strong class='high'>*</strong>");	
			$(this).parent().append($required);
		});
		var reg = new RegExp("^(([0-9]+\\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\\.[0-9]+)|([0-9][1-9]*[0-9]*))$"); //匹配正浮点数
		$("form :input").blur(function(){
			var $parent=$(this).parent();
			$parent.find(".formtips").remove();				
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
						
					if(this.value==0||!reg.test(this.value)){						
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
			$("#ui-multiselect-test-1-option-0").attr("checked",false); 
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
				var bookImage=$("#fileupload").val();					
				var numError=$('form .onError').length;
				if(numError!=0){
					return false;
				}else if(bookImage!=""&&bookImage!=null){
					alert("dddd");
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
		$("#showCatagorys").slideToggle("slow");
		$(".hid").attr("value",null);
		
	});

	function G() {
		return (((1 + Math.random()) * 0x10000) | 0).toString(16).substring(1)
	}
});