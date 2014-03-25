$(document).ready(function () {
	$("#modify").click(function(){
		$("#phone").attr("disabled",false);
		$("#address").attr("disabled",false);
		$("#send").attr("disabled",false);
		$("#modify").attr("disabled",true);
		$("form :input.required1").each(function(){
				var $required=$("<strong class='high'>*</strong>");	
				$(this).parent().append($required);
			});
			$("form :input").blur(function(){
				var $parent=$(this).parent();
				$parent.find(".formtips").remove();

				if($(this).is('#phone')){
					var Msg='请正确输入手机号码';
					if(this.value==""||this.value.length!=11){						
						$parent.append('<span class="formtips onError">'+Msg+'</span>');													
					}else{
						$parent.append('<span class="formtips onSuccess">'+Msg+'</span>');
					}
				}
				
				if($(this).is('#address')){
					var Msg='请输入员工地址';
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
				var numError=$('form .onError').length;
				if(numError!=0){
					return false;
				}				
			});
	});
});