$(document).ready(function () {
			$("form :input.required1").each(function(){
				var $required=$("<strong class='high'>*</strong>");	
				$(this).parent().append($required);
			});
			$("form :input").blur(function(){
				var $parent=$(this).parent();
				$parent.find(".formtips").remove();

				if($(this).is('#oldPassword')){
					var Msg='请正确输入旧密码';
					if(this.value==""){						
						$parent.append('<span class="formtips onError">'+Msg+'</span>');													
					}else{
						$parent.append('<span class="formtips onSuccess">'+Msg+'</span>');
					}
				}
				
				if($(this).is('#newPassword')){
					var Msg='请正确输入新密码';
					if(this.value==""){						
						$parent.append('<span class="formtips onError">'+Msg+'</span>');													
					}else{
						$parent.append('<span class="formtips onSuccess">'+Msg+'</span>');
					}
				}
				if($(this).is('#confirmPassword')){
					var Msg='请正确输入确认密码';
					var newPassword=$("#newPassword").val();
					if(this.value==""||this.value!=newPassword){						
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