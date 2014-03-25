$(document).ready(function () {
			$("form :input.required1").each(function(){
				var $required=$("<strong class='high'>*</strong>");	
				$(this).parent().append($required);
			});
			$("form :input").blur(function(){
				var $parent=$(this).parent().parent();
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
						if(this.value==$("#oldPassword").val()){
							$parent.append('<span class="formtips onError">新密码必须与旧的不同</span>');
						}else{
							$parent.append('<span class="formtips onSuccess">'+Msg+'</span>');
						}
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
				}else{
					var t = $(this);
					var newPassword=$("#newPassword").val();
					var oldPassword=$("#oldPassword").val();
					var staff_id = $("#staff_id").name;
					$.ajax({
								type: "POST",	
								url: "changeStaffPassword.do",
								data:{"staff.staff_id":staff_id,"oldPassword":oldPassword,"newPassword":newPassword},
								dataType: 'text',
								async: false,
								error:function(data){	
										alert("error");			
								},
								success: function(data){
									
									if((data=="success")){									
										alert("修改密码成功");
									}else if(data=="oldPasswordWrong"){
										alert("旧密码错误");
									}else{
										alert("修改失败，请试着重新登陆");
									}														
								}				
						});	
				}			
			});
			
});